/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.system.services.impl;


import com.dot.gcpbasedot.dao.GenericDao;
import com.dot.gcpbasedot.dao.Parameters;
import com.dot.gcpbasedot.reflection.EntityReflection;
import com.dot.gcpbasedot.service.EntityService;
import com.dot.gcpbasedot.service.EntityServiceImpl1;
import com.lacv.system.model.constants.SystemConstants;
import com.lacv.system.model.entities.WebEntity;
import com.lacv.system.model.mappers.WebEntityMapper;
import com.lacv.system.daos.WebEntityJpa;
import com.lacv.system.services.UserService;
import com.lacv.system.services.WebEntityService;
import com.lacv.mercando.services.CategoryService;
import com.lacv.mercando.services.CommerceService;
import com.lacv.mercando.services.ProductService;
import com.lacv.mercando.services.SupplierService;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.apache.log4j.Logger;

/**
 *
 * @author lcastrillo
 */
@Service("webEntityService")
public class WebEntityServiceImpl extends EntityServiceImpl1<WebEntity> implements WebEntityService {
    
    static final Logger LOGGER = Logger.getLogger(WebEntityServiceImpl.class);
    
    Map<Class, String> refEntities= new HashMap<>();
    
    Map<Class, EntityService> services= new HashMap<>();
    
    @Autowired
    WebEntityJpa webEntityJpa;
    
    @Autowired
    WebEntityMapper webEntityMapper;
    
    @Autowired
    SystemConstants webConstants;
    
    @Autowired
    CategoryService categoryService;
    
    @Autowired
    CommerceService commerceService;
    
    @Autowired
    ProductService productService;
    
    @Autowired
    UserService userService;
    
    @Autowired
    SupplierService supplierService;
    
    
    @Override
    public GenericDao getGenericDao(){
        return webEntityJpa;
    }
    
    private void addEntityService(String entityRef, EntityService entityService){
        refEntities.put(entityService.getClass(), entityRef);
        services.put(entityService.getClass(), entityService);
    }
    
    @PostConstruct
    public void init(){
        addEntityService("commerce", commerceService);
        addEntityService("product", productService);
        addEntityService("user", userService);
        addEntityService("category", categoryService);
        addEntityService("supplier", supplierService);
    }
    
    @Override
    public List<Object> findEntities(String path, Class type){
        String entityRef= refEntities.get(type);
        WebEntity parentWebEntity= findByPath(path);
        
        Parameters p= new Parameters();
        p.whereEqual("webEntity", parentWebEntity);
        p.whereEqual("entityRef", entityRef);
        p.orderBy("entityOrder", "ASC");
        
        return findEntities(p, type);
    }
    
    @Override
    public List<Object> findEntities(String path, String status, Class type){
        String entityRef= refEntities.get(type);
        WebEntity parentWebEntity= findByPath(path);
        
        Parameters p= new Parameters();
        p.whereEqual("webEntity", parentWebEntity);
        p.whereEqual("entityRef", entityRef);
        p.whereEqual("status", status);
        p.orderBy("entityOrder", "ASC");
        
        return findEntities(p, type);
    }
    
    @Override
    public List<Object> findEntities(Parameters p, Class type){
        List<Object> entities= new ArrayList<>();
        List<WebEntity> webEntities= super.findByParameters(p);
        for(WebEntity webEntity: webEntities){
            Object entity= loadEntity(webEntity, type);
            if(entity!=null){
                entities.add(entity);
            }
        }
        return entities;
    }
    
    @Override
    public Object loadEntity(WebEntity webEntity, Class type) {
        String entityRef= refEntities.get(type);
        EntityService entityService= services.get(type);
        if(webEntity.getEntityRef().equals(entityRef) && webEntity.getEntityId()!=null && !webEntity.getEntityId().equals("")){
            try {
                Object entityId = EntityReflection.getParsedFieldValue(type, "id", webEntity.getEntityId());
                Object entity= entityService.loadById(entityId);
                return entity;
            } catch (ClassNotFoundException ex) {
                LOGGER.error("ERROR getAllEntitiesByPath", ex);
            }
        }
        return null;
    }
    
    @Override
    @Transactional(readOnly= true)
    public WebEntity findByPath(String path){
        WebEntity parentWebEntity=null;
        String[] folders= path.split("/");
        
        if(folders.length>0){
            for(String folder: folders){
                if(!folder.equals("")){
                    Parameters p= new Parameters();
                    p.whereEqual("webEntity", parentWebEntity);
                    p.whereEqual("name", folder);
                    parentWebEntity= super.loadByParameters(p);
                    if(parentWebEntity==null){
                        return null;
                    }
                }
            }
        }
        return parentWebEntity;
    }

    @Override
    @Transactional(value = TRANSACTION_MANAGER, propagation = Propagation.REQUIRED)
    public WebEntity createFolder(WebEntity parentWebEntity, String folderName) {
        if(!folderName.equals("")){
            WebEntity webEntity= new WebEntity();
            webEntity.setName(folderName);
            webEntity.setCreationDate(new Date());
            webEntity.setEntityRef("folder");
            webEntity.setIcon("folder");
            webEntity.setEntityName("folder");
            webEntity.setModificationDate(new Date());
            webEntity.setWebEntity(parentWebEntity);
            super.createForce(webEntity);
            
            return webEntity;
        }
        return null;
    }

    @Override
    @Transactional(value = TRANSACTION_MANAGER, propagation = Propagation.REQUIRED)
    public WebEntity create(WebEntity parentWebEntity, String name, String entityRef, String entityName) {
        if(!name.equals("")){
            WebEntity webEntity= new WebEntity();
            webEntity.setName(name);
            webEntity.setCreationDate(new Date());
            webEntity.setEntityRef(entityRef);
            webEntity.setIcon(entityRef);
            webEntity.setModificationDate(new Date());
            webEntity.setWebEntity(parentWebEntity);
            webEntity.setEntityOrder(0);
            webEntity.setEntityName(entityName);
            webEntity.setStatus("Active");
            super.create(webEntity);

            return webEntity;
        }else{
            return null;
        }
    }
    
    @Override
    @Transactional(value = TRANSACTION_MANAGER, propagation = Propagation.REQUIRED)
    public WebEntity createDirectoriesIfMissing(String path){
        WebEntity parentWebEntity = null;
        WebEntity webEntity = null;
        String[] folders= path.split("/");
        
        if(folders.length>0){
            for(String folder: folders){
                if(!folder.equals("")){
                    Parameters p= new Parameters();
                    p.whereEqual("webEntity", parentWebEntity);
                    p.whereEqual("name", folder);
                    webEntity= super.loadByParameters(p);
                    if(webEntity==null){
                        webEntity= createFolder(parentWebEntity, folder);
                    }
                    parentWebEntity= webEntity;
                }
            }
        }
        return webEntity;
    }
    
    @Override
    @Transactional(value = TRANSACTION_MANAGER, propagation = Propagation.REQUIRED)
    public boolean deleteIfExist(WebEntity parentWebEntity, String fileName){
        Parameters p= new Parameters();
        p.whereEqual("webEntity", parentWebEntity);
        p.whereEqual("name", fileName);
        List<WebEntity> webEntityInFolder= super.findByParameters(p);
        if(webEntityInFolder.size()>0){
            for(WebEntity WebEntity: webEntityInFolder){
                super.remove(WebEntity);
            }
            return true;
        }
        return false;
    }
    
    
}
