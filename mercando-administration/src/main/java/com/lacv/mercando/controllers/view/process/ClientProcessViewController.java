/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.view.process;

import com.lacv.jmagrexs.controller.view.ExtProcessController;
import com.lacv.jmagrexs.dto.MenuItem;
import com.lacv.jmagrexs.dto.config.ProcessConfig;
import com.lacv.jmagrexs.enums.PageType;
import com.lacv.jmagrexs.modules.common.model.dtos.BasicResultDto;
import com.lacv.jmagrexs.modules.common.model.dtos.LogProcessDto;
import com.lacv.jmagrexs.modules.security.services.bussiness.SecurityService;
import com.lacv.mercando.model.dtos.process.ContactUserPDto;
import com.lacv.mercando.model.dtos.process.RegisterUserPDto;
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
@RequestMapping(value="/vista/processClient")
public class ClientProcessViewController extends ExtProcessController {
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        ProcessConfig process= new ProcessConfig("processClient", "logProcess", LogProcessDto.class);
        process.setMainProcessTitle("Gestionar Procesos de Cliente");
        process.addControlProcessView("contactUser", "Contacto de Usuario", ContactUserPDto.class, BasicResultDto.class);
        process.addControlProcessView("registerUser", "Registro de Usuario", RegisterUserPDto.class, BasicResultDto.class);
        
        super.addControlMapping(process);
        
        MenuItem menuParent= new MenuItem("Procesos de Negocio");
        MenuItem menuItem= new MenuItem("processClient", "Gestionar Procesos de Cliente");
        menuItem.setPageType(PageType.PROCESS);
        menuParent.addSubMenu(menuItem);
        menuComponent.addItemMenu(menuParent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
    
}
