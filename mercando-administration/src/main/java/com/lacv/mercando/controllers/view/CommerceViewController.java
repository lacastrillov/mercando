/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.view;

import com.lacv.mercando.model.dtos.CommerceDto;
import com.lacv.mercando.model.mappers.CommerceMapper;
import com.lacv.mercando.services.CommerceService;
import com.dot.gcpbasedot.controller.ExtEntityController;
import com.dot.gcpbasedot.dto.MenuItem;
import com.dot.gcpbasedot.dto.config.EntityConfig;
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
@RequestMapping(value="/commerce")
public class CommerceViewController extends ExtEntityController {
    
    @Autowired
    CommerceService commerceService;
    
    @Autowired
    CommerceMapper commerceMapper;
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        EntityConfig view= new EntityConfig("commerce", commerceService, CommerceDto.class);
        view.setSingularEntityTitle("Comercio");
        view.setPluralEntityTitle("Comercios");
        view.setMultipartFormData(true);
        view.setVisibleSeeAllButton(true);
        super.addControlMapping(view);
        
        MenuItem menuParent= new MenuItem("Comercios");
        MenuItem menuItem= new MenuItem("commerce", "Gestionar Comercios");
        menuParent.addSubMenu(menuItem);
        menuComponent.addItemMenu(menuParent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
}
