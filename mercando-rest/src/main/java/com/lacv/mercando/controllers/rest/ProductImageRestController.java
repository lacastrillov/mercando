/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.rest;


import com.lacv.mercando.model.mappers.ProductImageMapper;
import com.lacv.mercando.services.ProductImageService;
import com.dot.gcpbasedot.controller.RestEntityController;
import com.lacv.mercando.model.constants.WebConstants;
import com.lacv.mercando.model.dtos.ProductImageDto;
import com.lacv.mercando.model.entities.ProductImage;
import com.lacv.mercando.model.entities.WebFile;
import com.lacv.mercando.services.WebFileService;
import java.io.InputStream;
import javax.annotation.PostConstruct;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author nalvarez
 */
@Controller
@RequestMapping(value="/productImage")
public class ProductImageRestController extends RestEntityController {
    
    @Autowired
    ProductImageService productImageService;
    
    @Autowired
    ProductImageMapper productImageMapper;
    
    @Autowired
    WebFileService webFileService;
    
    @Autowired
    WebConstants webConstants;
    
    
    @PostConstruct
    public void init(){
        super.addControlMapping("productImage", productImageService, productImageMapper);
    }
    
    private WebFile getParentWebFile(Object idContainer){
        String pathSup= "imagenes/producto/";
        String path= pathSup + idContainer + "/";
        WebFile parentWebFile= webFileService.findByPath(path);
        if(parentWebFile==null || !parentWebFile.getName().equals(idContainer.toString())){
            WebFile webParentSupFile= webFileService.findByPath(pathSup);
            parentWebFile= webFileService.createFolder(webParentSupFile, idContainer.toString());
        }
        return parentWebFile;
    }
    
    @Override
    public String saveFilePart(int slice, String fileName, String fileType, int fileSize, InputStream is, Object idEntity) {
        try {
            String imageName= idEntity + "_" +"product-image."+FilenameUtils.getExtension(fileName);
            ProductImage productImage = productImageService.loadById(idEntity);
            WebFile parentWebFile= getParentWebFile(productImage.getProduct().getId());
            
            productImage.setImage(webConstants.LOCAL_DOMAIN + WebConstants.ROOT_FOLDER + parentWebFile.getPath() + parentWebFile.getName() + "/" + imageName);
            productImageService.update(productImage);
            
            webFileService.createByFileData(parentWebFile, slice, imageName, fileType, fileSize, is);
            
            return "Archivo " + imageName + " almacenado correctamente";
        } catch (Exception ex) {
            return ex.getMessage();
        }
    }
    
    @Override
    public String saveResizedImage(String fileName, String fileType, int width, int height, int fileSize, InputStream is, Object idEntity){
        try {
            String imageName= idEntity + "_" + width + "x" + height + "_" +"product-image."+FilenameUtils.getExtension(fileName);
            ProductImage productImage = productImageService.loadById(idEntity);
            WebFile parentWebFile= getParentWebFile(productImage.getProduct().getId());
            webFileService.createByFileData(parentWebFile, 0, imageName, fileType, fileSize, is);
            
            return "Archivo " + imageName + " almacenado correctamente";
        } catch (Exception ex) {
            return ex.getMessage();
        }
    }
    
}
