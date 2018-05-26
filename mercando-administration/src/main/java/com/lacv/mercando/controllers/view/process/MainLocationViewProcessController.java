/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.view.process;

import com.lacv.mercando.model.dtos.process.MainLocationPDto;
import com.lacv.mercando.model.dtos.process.ProductoPDto;
import com.lacv.mercando.model.dtos.process.ResultadoPDto;
import com.lacv.mercando.model.dtos.process.UsuarioPDto;
import com.lacv.jmagrexs.controller.view.ExtProcessController;
import com.lacv.jmagrexs.dto.MenuItem;
import com.lacv.jmagrexs.dto.config.ProcessConfig;
import com.lacv.jmagrexs.enums.PageType;
import com.lacv.jmagrexs.modules.common.model.dtos.BasicResultDto;
import com.lacv.jmagrexs.modules.common.model.dtos.LogProcessDto;
import com.lacv.jmagrexs.modules.common.model.dtos.PropertyDto;
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
@RequestMapping(value="/vista/processMainLocation")
public class MainLocationViewProcessController extends ExtProcessController {
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        ProcessConfig process= new ProcessConfig("processMainLocation", "logProcess", LogProcessDto.class);
        process.setMainProcessTitle("Gestionar Proceso Main Location");
        process.addControlProcessView("crearMainLocation", "Crear Main Location", MainLocationPDto.class, ResultadoPDto.class);
        process.addControlProcessView("activarUsuario", "Activar Usuario", UsuarioPDto.class, ProductoPDto.class);
        process.addControlProcessView("insertarPropiedad", "Insertar Propiedad", PropertyDto.class, BasicResultDto.class);
        process.addMultipartFormProcess("crearMainLocation");
        process.setVisibleSeeAllButton(true);
        
        super.addControlMapping(process);
        
        MenuItem menuParent= new MenuItem("Procesos de Negocio");
        MenuItem menuItem= new MenuItem("processMainLocation", "Gestionar Proceso Main Location");
        menuItem.setPageType(PageType.PROCESS);
        menuParent.addSubMenu(menuItem);
        menuComponent.addItemMenu(menuParent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
}
