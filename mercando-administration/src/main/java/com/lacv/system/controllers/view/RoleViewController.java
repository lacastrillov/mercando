/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.system.controllers.view;

import com.lacv.system.model.dtos.RoleDto;
import com.lacv.system.model.mappers.RoleMapper;
import com.lacv.system.services.RoleService;
import com.dot.gcpbasedot.controller.ExtEntityController;
import com.dot.gcpbasedot.dto.MenuItem;
import com.dot.gcpbasedot.dto.config.EntityConfig;
import com.lacv.system.model.entities.RoleAuthorization;
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
@RequestMapping(value="/role")
public class RoleViewController extends ExtEntityController {
    
    @Autowired
    RoleService roleService;
    
    @Autowired
    RoleMapper roleMapper;
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        EntityConfig view= new EntityConfig("role", roleService, RoleDto.class);
        view.setSingularEntityTitle("Rol");
        view.setPluralEntityTitle("Roles");
        view.addInternalViewButton("userRole", "Ver Usuarios");
        view.addChildExtView("roleAuthorization", RoleAuthorization.class, EntityConfig.TCV_N_TO_N);
        super.addControlMapping(view);
        
        MenuItem menuParent= new MenuItem("Sistema");
        MenuItem menuParent1= new MenuItem("Seguridad", 1);
        MenuItem menuItem= new MenuItem("role", "Gestionar Roles", 1);
        menuParent1.addSubMenu(menuItem);
        menuParent.addSubMenu(menuParent1);
        menuComponent.addItemMenu(menuParent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
}
