/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.rest.config;


import com.dot.gcpbasedot.controller.RestConfigurationController;
import com.lacv.mercando.model.dtos.config.PortalConfigDto;
import com.lacv.mercando.model.entities.WebFile;
import com.lacv.mercando.services.WebFileService;
import com.lacv.mercando.services.config.ContactConfigService;
import com.lacv.mercando.services.config.PortalConfigService;
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
@RequestMapping(value="/generalConfig")
public class GeneralConfigController extends RestConfigurationController {
    
    @Autowired
    PortalConfigService portalConfigService;
    
    @Autowired
    ContactConfigService contactConfigService;
    
    @Autowired
    WebFileService webFileService;
    
    
    @PostConstruct
    public void init(){
        super.addControlConfigurationObject("portalConfig", portalConfigService);
        super.addControlConfigurationObject("contactConfig", contactConfigService);
    }
    
    public String portalConfigFiles(PortalConfigDto portalConfig, String fieldName, String fileName, String fileType, int fileSize, InputStream is){
        String path= "imagenes/generalConfig/";
        WebFile parentWebFile= webFileService.findByPath(path);
        
        try {
            String imageName=fileName;
            if(fieldName.equals("banner")){
                imageName= fileName.replaceAll(" ", "_") + "_banner." + FilenameUtils.getExtension(fileName);
            }
            WebFile webFile= webFileService.createByFileData(parentWebFile, 0, imageName, fileType, fileSize, is);
            
            return webFile.getLocation();
        } catch (Exception ex) {
            return ex.getMessage();
        }
    }
    
}
