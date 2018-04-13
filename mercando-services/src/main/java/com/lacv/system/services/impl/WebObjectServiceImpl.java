/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.system.services.impl;


import com.lacv.system.daos.WebObjectJpa;
import com.lacv.system.model.entities.WebObject;
import com.lacv.system.model.mappers.WebObjectMapper;
import com.lacv.system.services.WebObjectService;
import com.dot.gcpbasedot.dao.GenericDao;
import com.dot.gcpbasedot.dao.Parameters;
import com.dot.gcpbasedot.service.EntityServiceImpl1;
import com.dot.gcpbasedot.util.FileService;
import com.dot.gcpbasedot.util.Util;
import com.lacv.system.model.constants.WebConstants;
import java.util.Date;
import java.util.List;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author lcastrillo
 */
@Service("webObjectService")
public class WebObjectServiceImpl extends EntityServiceImpl1<WebObject> implements WebObjectService {
    
    @Autowired
    public WebObjectJpa webObjectJpa;
    
    @Autowired
    public WebObjectMapper webObjectMapper;
    
    @Autowired
    WebConstants webConstants;
    
    
    @Override
    public GenericDao getGenericDao(){
        return webObjectJpa;
    }
    
    
    @Override
    @Transactional(readOnly= true)
    public WebObject findByPath(String path){
        WebObject parentWebObject=null;
        String[] folders= path.split("/");
        
        if(folders.length>0){
            for(String folder: folders){
                if(!folder.equals("")){
                    Parameters p= new Parameters();
                    p.whereEqual("webObject", parentWebObject);
                    p.whereEqual("name", folder);
                    parentWebObject= super.loadByParameters(p);
                    if(parentWebObject==null){
                        return null;
                    }
                }
            }
        }
        return parentWebObject;
    }

    @Override
    @Transactional(value = TRANSACTION_MANAGER, propagation = Propagation.REQUIRED)
    public WebObject createFolder(WebObject parentWebObject, String folderName) {
        if(!folderName.equals("")){
            WebObject webObject= new WebObject();
            webObject.setName(folderName);
            webObject.setCreationDate(new Date());
            webObject.setTypeClass("folder");
            webObject.setIcon("folder");
            webObject.setModificationDate(new Date());
            webObject.setWebObject(parentWebObject);
            super.createForce(webObject);

            String path= webObject.getPath();
            String location= webConstants.LOCAL_DIR + WebConstants.ROOT_FOLDER + path;
            FileService.createFolder(location + webObject.getName());
            return webObject;
        }
        return null;
    }

    @Override
    @Transactional(value = TRANSACTION_MANAGER, propagation = Propagation.REQUIRED)
    public WebObject createEmptyFile(WebObject parentWebObject, String fileName) {
        if(fileName.equals("")){
            String extension= FilenameUtils.getExtension(fileName);
            WebObject webObject= new WebObject();
            webObject.setName(fileName);
            webObject.setCreationDate(new Date());
            webObject.setTypeClass(extension);
            webObject.setIcon(Util.getSimpleContentType(extension));
            webObject.setModificationDate(new Date());
            webObject.setWebObject(parentWebObject);
            super.create(webObject);

            String path= webObject.getPath();
            String location= webConstants.LOCAL_DIR + WebConstants.ROOT_FOLDER + path;
            FileService.createFile(location + webObject.getName());

            return webObject;
        }else{
            return null;
        }
    }
    
    @Override
    @Transactional(value = TRANSACTION_MANAGER, propagation = Propagation.REQUIRED)
    public WebObject createDirectoriesIfMissing(String path){
        WebObject parentWebObject=null, webObject=null;
        String[] folders= path.split("/");
        
        if(folders.length>0){
            for(String folder: folders){
                if(!folder.equals("")){
                    Parameters p= new Parameters();
                    p.whereEqual("webObject", parentWebObject);
                    p.whereEqual("name", folder);
                    webObject= super.loadByParameters(p);
                    if(webObject==null){
                        webObject= createFolder(parentWebObject, folder);
                    }
                    parentWebObject= webObject;
                }
            }
        }
        return webObject;
    }
    
    @Override
    @Transactional(value = TRANSACTION_MANAGER, propagation = Propagation.REQUIRED)
    public boolean deleteIfExist(WebObject parentWebObject, String fileName){
        Parameters p= new Parameters();
        p.whereEqual("webObject", parentWebObject);
        p.whereEqual("name", fileName);
        List<WebObject> webObjectInFolder= super.findByParameters(p);
        if(webObjectInFolder.size()>0){
            for(WebObject WebObject: webObjectInFolder){
                super.remove(WebObject);
            }
            return true;
        }
        return false;
    }
    
    
}
