/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.system.controllers.view;

import com.lacv.system.model.dtos.WebObjectDto;
import com.lacv.system.model.mappers.WebObjectMapper;
import com.lacv.system.services.WebObjectService;
import com.dot.gcpbasedot.controller.ExtObjectExplorerController;
import com.dot.gcpbasedot.dto.GridTemplate;
import com.dot.gcpbasedot.dto.MenuItem;
import com.dot.gcpbasedot.dto.config.ObjectExplorerConfig;
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
@RequestMapping(value="/webObject")
public class WebObjectViewController extends ExtObjectExplorerController {
    
    @Autowired
    WebObjectService webObjectService;
    
    @Autowired
    WebObjectMapper webObjectMapper;
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        ObjectExplorerConfig view= new ObjectExplorerConfig("webObject", webObjectService, WebObjectDto.class);
        view.setSingularEntityTitle("Objeto Web");
        view.setPluralEntityTitle("Objectos Web");
        view.setMultipartFormData(true);
        
        GridTemplate gridTemplate= new GridTemplate("webObject.vm");
        gridTemplate.setNumColumns(6);
        view.setGridTemplate(gridTemplate);
        view.setActiveGridTemplateAsParent(true);
        
        super.addControlMapping(view);
        
        MenuItem menuParent= new MenuItem("Sistema");
        MenuItem menuParent1= new MenuItem("Gestor de Contenidos", 3);
        MenuItem menuItem= new MenuItem("webObject", "Explorador de Objetos");
        menuItem.setPageType(PageType.OBJECT_EXPLORER);
        menuParent1.addSubMenu(menuItem);
        menuParent.addSubMenu(menuParent1);
        menuComponent.addItemMenu(menuParent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
}
