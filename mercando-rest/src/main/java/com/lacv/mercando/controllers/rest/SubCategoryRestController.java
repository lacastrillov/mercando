/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.rest;


import com.lacv.jmagrexs.controller.rest.RestEntityController;
import com.lacv.jmagrexs.modules.fileexplorer.model.entities.WebFile;
import com.lacv.jmagrexs.modules.fileexplorer.services.WebFileService;
import com.lacv.mercando.model.entities.SubCategory;
import com.lacv.mercando.model.mappers.SubCategoryMapper;
import com.lacv.mercando.services.SubCategoryService;
import java.io.InputStream;
import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author lcastrillo
 */
@Controller
@RequestMapping(value="/rest/subCategory")
public class SubCategoryRestController extends RestEntityController {
    
    @Autowired
    SubCategoryService subCategoryService;
    
    @Autowired
    SubCategoryMapper subCategoryMapper;
    
    @Autowired
    WebFileService webFileService;
    
    
    @PostConstruct
    public void init(){
        super.addControlMapping("subCategory", subCategoryService, subCategoryMapper);
    }
    
    @Override
    public String saveFilePart(int slice, String fieldName, String fileName, String fileType, int fileSize, InputStream is, Object idEntity, Boolean sessionUpload) {
        String path= "imagenes/subcategoria/";
        WebFile parentWebFile= webFileService.createDirectoriesIfMissing(path, null);
        
        try {
            String imageName= idEntity + "_" +fileName.replaceAll(" ", "_");
            WebFile webFile= webFileService.createByFileData(parentWebFile, slice, imageName, fileType, fileSize, is, null);
            
            SubCategory subCategory = subCategoryService.loadById(idEntity);
            subCategory.setImage(webFile.getLocation());
            subCategoryService.update(subCategory);
            
            return "Archivo " + fileName + " almacenado correctamente con ID " + idEntity;
        } catch (Exception ex) {
            return ex.getMessage();
        }
    }
    
}
