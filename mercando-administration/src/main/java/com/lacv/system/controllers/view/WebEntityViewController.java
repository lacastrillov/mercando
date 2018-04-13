/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.system.controllers.view;

import com.lacv.system.model.dtos.WebEntityDto;
import com.lacv.system.model.mappers.WebEntityMapper;
import com.dot.gcpbasedot.controller.ExtEntityExplorerController;
import com.dot.gcpbasedot.dto.GridTemplate;
import com.dot.gcpbasedot.dto.MenuItem;
import com.dot.gcpbasedot.dto.config.EntityExplorerConfig;
import com.dot.gcpbasedot.enums.PageType;
import com.lacv.system.services.security.SecurityService;
import java.util.List;
import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.lacv.system.services.WebEntityService;

/**
 *
 * @author lacastrillov
 */
@Controller
@RequestMapping(value="/webEntity")
public class WebEntityViewController extends ExtEntityExplorerController {
    
    @Autowired
    WebEntityService webEntityService;
    
    @Autowired
    WebEntityMapper webEntityMapper;
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        EntityExplorerConfig view= new EntityExplorerConfig("webEntity", webEntityService, WebEntityDto.class);
        view.setSingularEntityTitle("Entidad Web");
        view.setPluralEntityTitle("Entidades Web");
        view.addEntityRef("commerce", "Comercio");
        view.addEntityRef("product", "Producto");
        view.addEntityRef("user", "Usuario");
        view.addEntityRef("category", "Categoria");
        view.addEntityRef("supplier", "Proveedor");
        
        GridTemplate gridTemplate= new GridTemplate("webEntity.vm");
        gridTemplate.setNumColumns(6);
        view.setGridTemplate(gridTemplate);
        view.setActiveGridTemplateAsParent(true);
        
        super.addControlMapping(view);
        
        MenuItem menuParent= new MenuItem("Sistema");
        MenuItem menuParent1= new MenuItem("Gestor de Contenidos", 3);
        MenuItem menuItem= new MenuItem("webEntity", "Explorador de Entidades");
        menuItem.setPageType(PageType.ENTITY_EXPLORER);
        menuParent1.addSubMenu(menuItem);
        menuParent.addSubMenu(menuParent1);
        menuComponent.addItemMenu(menuParent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
}
