/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.view.process;

import com.lacv.mercando.model.dtos.LogProcessDto;
import com.lacv.mercando.model.dtos.process.BasicResultDto;
import com.dot.gcpbasedot.controller.ExtProcessController;
import com.dot.gcpbasedot.dto.MenuItem;
import com.dot.gcpbasedot.dto.config.ProcessConfig;
import com.dot.gcpbasedot.enums.PageType;
import com.lacv.mercando.model.dtos.process.BasicPDto;
import com.lacv.mercando.model.dtos.process.NetworkPDto;
import com.lacv.mercando.model.dtos.process.ProductoPDto;
import com.lacv.mercando.model.dtos.process.SolicitudePDto;
import com.lacv.mercando.model.dtos.process.UsuarioPDto;
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
@RequestMapping(value="/externalService")
public class ExternalServiceViewProcessController extends ExtProcessController {
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        ProcessConfig process= new ProcessConfig("externalService", "logProcess", LogProcessDto.class);
        process.setMainProcessTitle("Gestionar Servicios Externos");
        process.addControlProcessView("maquinasNovaventa", "Maquinas Novaventa", SolicitudePDto.class, BasicResultDto.class);
        process.addControlProcessView("maquinasNovaventaXml", "Maquinas Novaventa XML", SolicitudePDto.class, BasicResultDto.class);
        process.addControlProcessView("merakiDevices", "Meraki Devices", NetworkPDto.class, BasicResultDto.class);
        process.addControlProcessView("noticiasCarroya", "Noticias Carroya", BasicPDto.class, BasicResultDto.class);
        process.addControlProcessView("estaInBody", "Esta In Body", UsuarioPDto.class, BasicResultDto.class);
        process.addControlProcessView("estaInParameters", "Esta In Parameters", ProductoPDto.class, BasicResultDto.class);
        super.addControlMapping(process);
        
        MenuItem menuParent= new MenuItem("Procesos de Negocio", 4);
        MenuItem menuItem= new MenuItem("externalService", "Gestionar Servicios Externos");
        menuItem.setPageType(PageType.PROCESS);
        menuParent.addSubMenu(menuItem);
        menuComponent.addItemMenu(menuParent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
    
}
