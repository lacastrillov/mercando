/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.view;

import com.lacv.mercando.model.dtos.WebResourceDto;
import com.lacv.mercando.model.mappers.WebResourceMapper;
import com.lacv.mercando.services.WebResourceService;
import com.dot.gcpbasedot.controller.ExtEntityController;
import com.dot.gcpbasedot.dto.MenuItem;
import com.dot.gcpbasedot.dto.config.EntityConfig;
import com.lacv.mercando.model.entities.WebresourceAuthorization;
import com.lacv.mercando.model.entities.WebresourceRole;
import com.lacv.mercando.services.security.SecurityService;
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
@RequestMapping(value="/webResource")
public class WebResourceViewController extends ExtEntityController {
    
    @Autowired
    WebResourceService webResourceService;
    
    @Autowired
    WebResourceMapper webResourceMapper;
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        EntityConfig view= new EntityConfig("webResource", webResourceService, WebResourceDto.class);
        view.setSingularEntityTitle("Recurso Web");
        view.setPluralEntityTitle("Recursos Web");
        view.addChildExtView("webresourceRole", WebresourceRole.class, EntityConfig.TCV_N_TO_N);
        view.addChildExtView("webresourceAuthorization", WebresourceAuthorization.class, EntityConfig.TCV_N_TO_N);
        view.setDefaultOrderBy("category");
        view.setDefaultOrderDir("ASC");
        super.addControlMapping(view);
        
        MenuItem menuParent= new MenuItem("Sistema");
        MenuItem menuParent1= new MenuItem("Seguridad");
        MenuItem menuItem= new MenuItem("webResource", "Gestionar Recursos Web");
        menuParent1.addSubMenu(menuItem);
        menuParent.addSubMenu(menuParent1);
        menuComponent.addItemMenu(menuParent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
}
