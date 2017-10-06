/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.view;

import com.lacv.mercando.model.dtos.UserRoleDto;
import com.lacv.mercando.model.mappers.UserRoleMapper;
import com.lacv.mercando.services.UserRoleService;
import com.dot.gcpbasedot.controller.ExtEntityController;
import com.dot.gcpbasedot.components.MenuComponent;
import com.dot.gcpbasedot.dto.MenuItem;
import com.dot.gcpbasedot.dto.config.EntityConfig;
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
@RequestMapping(value="/userRole")
public class UserRoleViewController extends ExtEntityController {
    
    @Autowired
    UserRoleService userRoleService;
    
    @Autowired
    MenuComponent menuComponent;
    
    @Autowired
    UserRoleMapper userRoleMapper;
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        EntityConfig view= new EntityConfig("userRole", "id", userRoleService, UserRoleDto.class);
        view.setPluralEntityTitle("Roles de Usuario");
        view.setSingularEntityTitle("Roles de Usuario");
        view.activateNNMulticheckChild("role");
        super.addControlMapping(view);
        
        MenuItem menuItem= new MenuItem("Seguridad", "userRole", "Gestionar Roles de Usuario");
        menuComponent.addItemMenu(menuItem);
        super.addMenuComponent(menuComponent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
}
