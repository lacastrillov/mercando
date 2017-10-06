/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.view.process;

import com.lacv.mercando.model.dtos.LogProcessDto;
import com.lacv.mercando.model.dtos.process.BasicResultDto;
import com.lacv.mercando.model.dtos.process.CreatePasswordDto;
import com.dot.gcpbasedot.controller.ExtProcessController;
import com.dot.gcpbasedot.components.MenuComponent;
import com.dot.gcpbasedot.dto.MenuItem;
import com.dot.gcpbasedot.dto.config.ProcessConfig;
import com.dot.gcpbasedot.enums.PageType;
import com.lacv.mercando.model.dtos.process.ContactUserPDto;
import com.lacv.mercando.model.dtos.process.RegisterUserPDto;
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
@RequestMapping(value="/processUser")
public class UserViewProcessController extends ExtProcessController {
    
    @Autowired
    MenuComponent menuComponent;
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        ProcessConfig process= new ProcessConfig("processUser", "logProcess", LogProcessDto.class);
        process.setMainProcessTitle("Gestionar Procesos de Usuario");
        process.addControlProcessView("createPassword", "Crear Password", CreatePasswordDto.class, BasicResultDto.class);
        process.addControlProcessView("contactUser", "Contacto de Usuario", ContactUserPDto.class, BasicResultDto.class);
        process.addControlProcessView("registerUser", "Registro de Usuario", RegisterUserPDto.class, BasicResultDto.class);
        
        super.addControlMapping(process);
        
        MenuItem menuItem= new MenuItem("Procesos", "processUser", "Gestionar Procesos de Usuario");
        menuItem.setPageType(PageType.PROCESS);
        menuItem.setParentPosition(4);
        menuComponent.addItemMenu(menuItem);
        super.addMenuComponent(menuComponent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
    
}
