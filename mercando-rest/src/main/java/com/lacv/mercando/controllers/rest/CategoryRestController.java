/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.rest;


import com.lacv.mercando.model.mappers.CategoryMapper;
import com.lacv.mercando.services.CategoryService;
import com.lacv.jmagrexs.controller.rest.RestEntityController;
import com.lacv.jmagrexs.modules.fileexplorer.model.entities.WebFile;
import com.lacv.jmagrexs.modules.fileexplorer.services.WebFileService;
import com.lacv.mercando.model.entities.Category;
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
@RequestMapping(value="/rest/category")
public class CategoryRestController extends RestEntityController {
    
    @Autowired
    CategoryService categoryService;
    
    @Autowired
    CategoryMapper categoryMapper;
    
    @Autowired
    WebFileService webFileService;
    
    
    @PostConstruct
    public void init(){
        super.addControlMapping("category", categoryService, categoryMapper);
    }
    
    @Override
    public String saveFilePart(int slice, String fieldName, String fileName, String fileType, int fileSize, InputStream is, Object idParent, Boolean sessionUpload) {
        String path= "imagenes/categoria/";
        WebFile parentWebFile= webFileService.createDirectoriesIfMissing(path, null);
        
        try {
            String imageName= idParent + "_" +fileName.replaceAll(" ", "_");
            WebFile webFile= webFileService.createByFileData(parentWebFile, slice, imageName, fileType, fileSize, is, null);
            
            Category category = categoryService.loadById(idParent);
            category.setImage(webFile.getLocation());
            categoryService.update(category);
            
            return "Archivo " + fileName + " almacenado correctamente con ID " + idParent;
        } catch (Exception ex) {
            return ex.getMessage();
        }
    }
    
    
}
