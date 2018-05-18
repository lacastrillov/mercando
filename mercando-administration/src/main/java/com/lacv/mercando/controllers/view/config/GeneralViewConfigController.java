/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.view.config;

import com.lacv.jmagrexs.controller.view.ExtConfigurationObjectController;
import com.lacv.jmagrexs.dto.MenuItem;
import com.lacv.jmagrexs.dto.config.ConfigurationObjectConfig;
import com.lacv.jmagrexs.enums.PageType;
import com.lacv.mercando.model.dtos.config.ContactConfigDto;
import com.lacv.mercando.model.dtos.config.PortalConfigDto;
import com.lacv.jmagrexs.modules.security.services.bussiness.SecurityService;
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
@RequestMapping(value="/vista/generalConfig")
public class GeneralViewConfigController extends ExtConfigurationObjectController {
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        ConfigurationObjectConfig view= new ConfigurationObjectConfig("generalConfig");
        view.setMainConfigurationTitle("Gestionar Configuraci&oacute;n General");
        view.addControlConfigurationObjectView("portalConfig", "Configuraci&oacute;n del Portal", PortalConfigDto.class);
        view.addControlConfigurationObjectView("contactConfig", "Configuraci&oacute;n de Contacto", ContactConfigDto.class);
        view.addMultipartFormConfig("portalConfig");
        view.setVisibleSeeAllButton(true);
        
        super.addControlMapping(view);
        
        MenuItem menuParent= new MenuItem("Sistema");
        MenuItem menuParent1= new MenuItem("Configuraci&oacute;n");
        MenuItem menuItem= new MenuItem("generalConfig", "Gestionar Configuraci&oacute;n General");
        menuItem.setPageType(PageType.CONFIGURATION_OBJECT);
        menuParent1.addSubMenu(menuItem);
        menuParent.addSubMenu(menuParent1);
        menuComponent.addItemMenu(menuParent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
    
}
