/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.view.process;

import com.lacv.mercando.model.dtos.LogProcessDto;
import com.lacv.mercando.model.dtos.process.MainLocationPDto;
import com.lacv.mercando.model.dtos.process.ProductoPDto;
import com.lacv.mercando.model.dtos.process.ResultadoPDto;
import com.lacv.mercando.model.dtos.process.UsuarioPDto;
import com.dot.gcpbasedot.controller.ExtProcessController;
import com.dot.gcpbasedot.components.MenuComponent;
import com.dot.gcpbasedot.dto.MenuItem;
import com.dot.gcpbasedot.dto.config.ProcessConfig;
import com.dot.gcpbasedot.enums.PageType;
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
@RequestMapping(value="/processMainLocation")
public class MainLocationViewProcessController extends ExtProcessController {
    
    @Autowired
    MenuComponent menuComponent;
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        ProcessConfig process= new ProcessConfig("processMainLocation", "logProcess", LogProcessDto.class);
        process.setMainProcessTitle("Gestionar Proceso Main Location");
        process.addControlProcessView("crearMainLocation", "Crear Main Location", MainLocationPDto.class, ResultadoPDto.class);
        process.addControlProcessView("activarUsuario", "Activar Usuario", UsuarioPDto.class, ProductoPDto.class);
        
        super.addControlMapping(process);
        
        MenuItem menuItem= new MenuItem("Procesos", "processMainLocation", "Gestionar Proceso Main Location");
        menuItem.setPageType(PageType.PROCESS);
        menuComponent.addItemMenu(menuItem);
        super.addMenuComponent(menuComponent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
}
