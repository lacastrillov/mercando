/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.system.controllers.view;

import com.lacv.system.model.dtos.WebFileDto;
import com.lacv.system.model.mappers.WebFileMapper;
import com.lacv.system.services.WebFileService;
import com.dot.gcpbasedot.controller.ExtFileExplorerController;
import com.dot.gcpbasedot.dto.GridTemplate;
import com.dot.gcpbasedot.dto.MenuItem;
import com.dot.gcpbasedot.dto.config.FileExplorerConfig;
import com.dot.gcpbasedot.enums.PageType;
import com.lacv.system.services.security.SecurityService;
import java.util.List;
import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author lacastrillov
 */
@Controller
@RequestMapping(value="/webFile")
public class WebFileViewController extends ExtFileExplorerController {
    
    @Autowired
    WebFileService webFileService;
    
    @Autowired
    WebFileMapper webFileMapper;
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        FileExplorerConfig view= new FileExplorerConfig("webFile", webFileService, WebFileDto.class);
        view.setSingularEntityTitle("Archivo Web");
        view.setPluralEntityTitle("Archivos Web");
        view.setMultipartFormData(true);
        view.setDefaultOrder("type", "ASC");
        
        GridTemplate gridTemplate= new GridTemplate("webFile.vm");
        gridTemplate.setNumColumns(6);
        view.setGridTemplate(gridTemplate);
        view.setActiveGridTemplateAsParent(true);
        
        super.addControlMapping(view);
        
        MenuItem menuParent= new MenuItem("Gestor de Contenidos", 3);
        MenuItem menuItem= new MenuItem("webFile", "Explorador de Archivos");
        menuItem.setPageType(PageType.FILE_EXPLORER);
        menuParent.addSubMenu(menuItem);
        menuComponent.addItemMenu(menuParent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
}
