/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.rest;


import com.dot.gcpbasedot.controller.RestEntityController;
import com.lacv.mercando.model.entities.Commerce;
import com.lacv.mercando.model.mappers.CommerceMapper;
import com.lacv.mercando.services.CommerceService;
import com.lacv.mercando.model.constants.WebConstants;
import com.lacv.mercando.model.entities.WebFile;
import com.lacv.mercando.services.WebFileService;
import java.io.InputStream;
import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author nalvarez
 */
@Controller
@RequestMapping(value="/commerce")
public class CommerceRestController extends RestEntityController {
    
    @Autowired
    CommerceService commerceService;
    
    @Autowired
    CommerceMapper commerceMapper;
    
    @Autowired
    WebFileService webFileService;
    
    @Autowired
    WebConstants webConstants;
    
    
    @PostConstruct
    public void init(){
        super.addControlMapping("commerce", commerceService, commerceMapper);
    }
    
    @Override
    public String saveFilePart(int slice, String fileName, String fileType, int fileSize, InputStream is, Object idEntity) {
        String path= "imagenes/comercio/";
        WebFile parentWebFile= webFileService.findByPath(path);
        
        try {
            String imageName= idEntity + "_" +fileName.replaceAll(" ", "_");
            Commerce commerce = commerceService.loadById(idEntity);
            commerce.setCommerceImage(webConstants.LOCAL_DOMAIN + WebConstants.ROOT_FOLDER + path + imageName);
            commerceService.update(commerce);
            
            webFileService.createByFileData(parentWebFile, slice, imageName, fileType, fileSize, is);
            
            return "Archivo " + fileName + " almacenado correctamente con ID " + idEntity;
        } catch (Exception ex) {
            return ex.getMessage();
        }
    }
    
}
