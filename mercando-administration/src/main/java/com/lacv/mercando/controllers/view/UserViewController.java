/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.view;

import com.lacv.mercando.model.dtos.UserDto;
import com.lacv.mercando.model.entities.UserRole;
import com.lacv.mercando.model.mappers.UserMapper;
import com.lacv.mercando.services.UserService;
import com.dot.gcpbasedot.controller.ExtEntityController;
import com.dot.gcpbasedot.dto.MenuItem;
import com.dot.gcpbasedot.dto.ProcessButton;
import com.dot.gcpbasedot.dto.config.EntityConfig;
import com.lacv.mercando.model.dtos.process.CreatePasswordDto;
import com.lacv.mercando.model.dtos.process.MainLocationPDto;
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
@RequestMapping(value="/user")
public class UserViewController extends ExtEntityController {
    
    @Autowired
    UserService userService;
    
    @Autowired
    UserMapper userMapper;
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        EntityConfig view= new EntityConfig("user", userService, UserDto.class);
        view.setSingularEntityTitle("Usuario");
        view.setPluralEntityTitle("Usuarios");
        view.addChildExtView("userRole", UserRole.class, EntityConfig.TCV_N_TO_N);
        view.setMultipartFormData(true);
        
        ProcessButton setPasswordButton= new ProcessButton();
        setPasswordButton.setMainProcessRef("processUser");
        setPasswordButton.setProcessName("createPassword");
        setPasswordButton.setProcessTitle("Crear Password");
        setPasswordButton.addSourceByDestinationField("username", "username");
        setPasswordButton.setDtoClass(CreatePasswordDto.class);
        setPasswordButton.setIconUrl("/img/process_icons/password.png");
        view.addProcessButton(setPasswordButton);
        
        ProcessButton mainLocationButton= new ProcessButton();
        mainLocationButton.setMainProcessRef("processMainLocation");
        mainLocationButton.setProcessName("crearMainLocation");
        mainLocationButton.setProcessTitle("Crear Main Location");
        mainLocationButton.addSourceByDestinationField("firstName", "usuario.nombre");
        mainLocationButton.addSourceByDestinationField("email", "usuario.correo");
        mainLocationButton.addSourceByDestinationField("cell", "usuario.telefono");
        mainLocationButton.addSourceByDestinationField("status", "usuario.estado");
        mainLocationButton.addSourceByDestinationField("registrationDate", "usuario.fechaRegistro");
        mainLocationButton.setDtoClass(MainLocationPDto.class);
        mainLocationButton.setIconUrl("/img/process_icons/ml-process.png");
        view.addProcessButton(mainLocationButton);
        
        super.addControlMapping(view);
        
        MenuItem menuParent= new MenuItem("Sistema", 1);
        MenuItem menuParent1= new MenuItem("Seguridad");
        MenuItem menuItem= new MenuItem("user", "Gestionar Usuarios", 2);
        menuParent1.addSubMenu(menuItem);
        menuParent.addSubMenu(menuParent1);
        menuComponent.addItemMenu(menuParent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
}
