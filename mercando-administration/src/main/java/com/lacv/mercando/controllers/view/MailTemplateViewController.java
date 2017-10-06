/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.view;

import com.lacv.mercando.model.dtos.MailTemplateDto;
import com.lacv.mercando.model.mappers.MailTemplateMapper;
import com.lacv.mercando.services.MailTemplateService;
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
@RequestMapping(value="/mailTemplate")
public class MailTemplateViewController extends ExtEntityController {
    
    @Autowired
    MailTemplateService mailTemplateService;
    
    @Autowired
    MenuComponent menuComponent;
    
    @Autowired
    MailTemplateMapper mailTemplateMapper;
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        EntityConfig view= new EntityConfig("mailTemplate", "name", mailTemplateService, MailTemplateDto.class);
        view.setSingularEntityTitle("Plantilla de Correo");
        view.setPluralEntityTitle("Plantillas de Correo");
        super.addControlMapping(view);
        
        MenuItem menuItem= new MenuItem("Correos", "mailTemplate", "Gestionar Plantillas de Correo");
        menuItem.setParentPosition(5);
        menuComponent.addItemMenu(menuItem);
        super.addMenuComponent(menuComponent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
    
}
