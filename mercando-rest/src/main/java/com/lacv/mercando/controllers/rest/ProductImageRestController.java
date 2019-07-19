/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.rest;


import com.lacv.mercando.model.mappers.ProductImageMapper;
import com.lacv.mercando.services.ProductImageService;
import com.lacv.jmagrexs.controller.rest.RestEntityController;
import com.lacv.jmagrexs.modules.fileexplorer.model.entities.WebFile;
import com.lacv.jmagrexs.modules.fileexplorer.services.WebFileService;
import com.lacv.mercando.model.dtos.reports.ProductImageReportDto;
import com.lacv.mercando.model.entities.ProductImage;
import java.io.InputStream;
import javax.annotation.PostConstruct;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author lcastrillo
 */
@Controller
@RequestMapping(value="/rest/productImage")
public class ProductImageRestController extends RestEntityController {
    
    @Autowired
    ProductImageService productImageService;
    
    @Autowired
    ProductImageMapper productImageMapper;
    
    @Autowired
    WebFileService webFileService;
    
    
    @PostConstruct
    public void init(){
        super.addControlMapping("productImage", productImageService, productImageMapper);
        super.enableReport("reporteImagenesProducto", ProductImageReportDto.class);
    }
    
    @Override
    public String saveFilePart(int slice, String fieldName, String fileName, String fileType, int fileSize, InputStream is, Object idEntity, Boolean sessionUpload) {
        try {
            ProductImage productImage = productImageService.loadById(idEntity);
            String path= "imagenes/producto/"+productImage.getProduct().getId();
            WebFile parentWebFile= webFileService.createDirectoriesIfMissing(path, null);
            
            String imageName= idEntity + "_" +"product-image."+FilenameUtils.getExtension(fileName);
            WebFile webFile= webFileService.createByFileData(parentWebFile, slice, imageName, fileType, fileSize, is, null);
            
            productImage.setImage(webFile.getLocation());
            productImageService.update(productImage);
            
            return "Archivo " + imageName + " almacenado correctamente";
        } catch (Exception ex) {
            return ex.getMessage();
        }
    }
    
    @Override
    public String saveResizedImage(String fieldName, String fileName, String fileType, int width, int height, int fileSize, InputStream is, Object idEntity, Boolean sessionUpload){
        try {
            ProductImage productImage = productImageService.loadById(idEntity);
            String path= "imagenes/producto/"+productImage.getProduct().getId();
            WebFile parentWebFile= webFileService.createDirectoriesIfMissing(path, null);
            
            String imageName= idEntity + "_" + width + "x" + height + "_" +"product-image."+FilenameUtils.getExtension(fileName);
            webFileService.createByFileData(parentWebFile, 0, imageName, fileType, fileSize, is, null);
            
            return "Archivo " + imageName + " almacenado correctamente";
        } catch (Exception ex) {
            return ex.getMessage();
        }
    }
    
}
