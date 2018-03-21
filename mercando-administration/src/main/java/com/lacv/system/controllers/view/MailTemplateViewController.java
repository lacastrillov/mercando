/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.system.controllers.view;

import com.lacv.system.model.dtos.MailTemplateDto;
import com.lacv.system.model.mappers.MailTemplateMapper;
import com.lacv.system.services.MailTemplateService;
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
@RequestMapping(value="/mailTemplate")
public class MailTemplateViewController extends ExtEntityController {
    
    @Autowired
    MailTemplateService mailTemplateService;
    
    @Autowired
    MailTemplateMapper mailTemplateMapper;
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        EntityConfig view= new EntityConfig("mailTemplate", mailTemplateService, MailTemplateDto.class);
        view.setSingularEntityTitle("Plantilla de Correo");
        view.setPluralEntityTitle("Plantillas de Correo");
        super.addControlMapping(view);
        
        MenuItem menuParent= new MenuItem("Sistema");
        MenuItem menuParent1= new MenuItem("Correos", 5);
        MenuItem menuItem= new MenuItem("mailTemplate", "Gestionar Plantillas de Correo");
        menuParent1.addSubMenu(menuItem);
        menuParent.addSubMenu(menuParent1);
        menuComponent.addItemMenu(menuParent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
    
}
