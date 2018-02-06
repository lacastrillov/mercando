/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.rest;


import com.dot.gcpbasedot.controller.RestDirectController;
import com.dot.gcpbasedot.service.JdbcDirectService;
import com.lacv.mercando.model.entities.WebFile;
import com.lacv.mercando.services.WebFileService;
import java.io.InputStream;
import java.util.Map;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author nalvarez
 */
@Controller
@RequestMapping(value="/direct")
public class DirectRestController extends RestDirectController {
    
    @Autowired
    JdbcDirectService jdbcDirectService;
    
    @Autowired
    WebFileService webFileService;
    
    
    @Override
    public String saveFilePart(String tableName, String fieldName, String fileName, String fileType, int fileSize, InputStream is, Integer idEntity) {
        try {
            String path= "archivos/"+tableName.replaceFirst("lt_", "");
            WebFile parentWebFile= webFileService.createDirectoriesIfMissing(path);
            String newFileName= idEntity + "_" +fieldName+"."+FilenameUtils.getExtension(fileName);
            WebFile webFile= webFileService.createByFileData(parentWebFile, 0, newFileName, fileType, fileSize, is);
            
            Map<String,Object> entity = jdbcDirectService.loadByParameter(tableName, "id", idEntity);
            entity.put(fieldName, webFile.getLocation());
            jdbcDirectService.updateByParameter(tableName, entity, "id", idEntity);
            
            return "Archivo " + newFileName + " almacenado correctamente";
        } catch (Exception ex) {
            return ex.getMessage();
        }
    }
    
}
