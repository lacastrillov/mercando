/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.view;

import com.lacv.mercando.model.dtos.RoleAuthorizationDto;
import com.lacv.mercando.model.mappers.RoleAuthorizationMapper;
import com.lacv.mercando.services.RoleAuthorizationService;
import com.dot.gcpbasedot.controller.ExtEntityController;
import com.dot.gcpbasedot.components.MenuComponent;
import com.dot.gcpbasedot.dto.config.EntityConfig;
import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author lacastrillov
 */
@Controller
@RequestMapping(value="/roleAuthorization")
public class RoleAuthorizationViewController extends ExtEntityController {
    
    @Autowired
    RoleAuthorizationService roleAuthorizationService;
    
    @Autowired
    MenuComponent menuComponent;
    
    @Autowired
    RoleAuthorizationMapper roleAuthorizationMapper;
    
    
    @PostConstruct
    public void init(){
        EntityConfig view= new EntityConfig("roleAuthorization", roleAuthorizationService, RoleAuthorizationDto.class);
        view.setSingularEntityTitle("Comercio");
        view.setPluralEntityTitle("Comercios");
        view.activateNNMulticheckChild("authorization");
        super.addControlMapping(view);
        
        /*MenuItem menuItem= new MenuItem("Seguridad", "roleAuthorization", "Gestionar Comercios");
        menuComponent.addItemMenu(menuItem);
        super.addMenuComponent(menuComponent);*/
    }
    
    
}
