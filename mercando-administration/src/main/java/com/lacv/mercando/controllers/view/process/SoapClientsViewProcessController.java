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
import com.lacv.mercando.model.dtos.process.PlayerUserPDto;
import com.lacv.mercando.model.dtos.process.UserNamePDto;
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
@RequestMapping(value="/soapClients")
public class SoapClientsViewProcessController extends ExtProcessController {
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        ProcessConfig process= new ProcessConfig("soapClients", "logProcess", LogProcessDto.class);
        process.setMainProcessTitle("Gestionar Clientes SOAP");
        process.addControlProcessView("getBestScore", "Obtener Mejor Puntaje", UserNamePDto.class, BasicResultDto.class);
        process.addControlProcessView("getPlayer", "Obtener Jugador", UserNamePDto.class, BasicResultDto.class);
        process.addControlProcessView("getAllPlayers", "Ver Jugadores", BasicPDto.class, BasicResultDto.class);
        process.addControlProcessView("createPlayer", "Crear Jugador", PlayerUserPDto.class, BasicResultDto.class);
        super.addControlMapping(process);
        
        MenuItem menuParent= new MenuItem("Procesos de Negocio");
        MenuItem menuItem= new MenuItem("soapClients", "Gestionar Clientes SOAP");
        menuItem.setPageType(PageType.PROCESS);
        menuParent.addSubMenu(menuItem);
        menuComponent.addItemMenu(menuParent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
    
}
