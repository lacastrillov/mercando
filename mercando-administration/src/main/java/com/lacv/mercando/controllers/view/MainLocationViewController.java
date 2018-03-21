/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.view;

import com.lacv.mercando.model.dtos.MainLocationDto;
import com.lacv.mercando.model.mappers.MainLocationMapper;
import com.lacv.mercando.services.MainLocationService;
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
@RequestMapping(value="/mainLocation")
public class MainLocationViewController extends ExtEntityController {
    
    @Autowired
    MainLocationService mainLocationService;
    
    @Autowired
    MainLocationMapper mainLocationMapper;
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        EntityConfig view= new EntityConfig("mainLocation", mainLocationService, MainLocationDto.class);
        view.setSingularEntityTitle("Ubicaci&oacute;n Principal");
        view.setPluralEntityTitle("Ubicaciones Principales");
        super.addControlMapping(view);
        
        MenuItem menuParent= new MenuItem("Comercios", 6);
        MenuItem menuItem= new MenuItem("mainLocation", "Gestionar Ubicaciones Principales");
        menuParent.addSubMenu(menuItem);
        menuComponent.addItemMenu(menuParent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
}
