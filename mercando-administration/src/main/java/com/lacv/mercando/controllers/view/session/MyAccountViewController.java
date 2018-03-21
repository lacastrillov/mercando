/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.view.session;

import com.lacv.system.model.dtos.UserDto;
import com.lacv.system.model.mappers.UserMapper;
import com.lacv.system.services.UserService;
import com.dot.gcpbasedot.controller.ExtEntityController;
import com.dot.gcpbasedot.dto.MenuItem;
import com.dot.gcpbasedot.dto.ProcessButton;
import com.dot.gcpbasedot.dto.config.EntityConfig;
import com.lacv.system.model.dtos.process.CreatePasswordDto;
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
@RequestMapping(value="/myAccount")
public class MyAccountViewController extends ExtEntityController {
    
    @Autowired
    UserService userService;
    
    @Autowired
    UserMapper userMapper;
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        EntityConfig view= new EntityConfig("user", userService, UserDto.class);
        view.setPathRef("myAccount");
        view.setSingularEntityTitle("Mis datos");
        view.setPluralEntityTitle("Mis datos");
        view.setMultipartFormData(true);
        view.setPreloadedForm(true);
        view.setRestSession(true);
        
        ProcessButton setPasswordButton= new ProcessButton();
        setPasswordButton.setMainProcessRef("processUser");
        setPasswordButton.setProcessName("createPassword");
        setPasswordButton.setProcessTitle("Crear Password");
        setPasswordButton.addSourceByDestinationField("username", "username");
        setPasswordButton.setDtoClass(CreatePasswordDto.class);
        setPasswordButton.setIconUrl("/img/process_icons/password.png");
        view.addProcessButton(setPasswordButton);
        
        super.addControlMapping(view);
        
        MenuItem menuParent= new MenuItem("Sistema");
        MenuItem menuParent1= new MenuItem("Configuraci&oacute;n");
        MenuItem menuItem= new MenuItem("myAccount", "Mis datos");
        menuParent1.addSubMenu(menuItem);
        menuParent.addSubMenu(menuParent1);
        menuComponent.addItemMenu(menuParent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
    @Override
    public Object getFormRecordId(){
        return securityService.getCurrentUser().getId();
    }
    
}
