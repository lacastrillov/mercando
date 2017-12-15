/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.rest.process;


import com.lacv.mercando.model.entities.LogProcess;
import com.lacv.mercando.model.entities.User;
import com.lacv.mercando.services.LogProcessService;
import com.lacv.mercando.services.security.SecurityService;
import com.dot.gcpbasedot.controller.RestProcessController;
import com.dot.gcpbasedot.dto.SOAPServiceDto;
import com.lacv.mercando.model.dtos.process.BasicPDto;
import com.lacv.mercando.model.dtos.process.PlayerUserPDto;
import com.lacv.mercando.model.dtos.process.UserNamePDto;
import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author nalvarez
 */
@Controller
@RequestMapping(value="/soapClients")
public class SoapClientsProcessController extends RestProcessController {
    
    @Autowired
    LogProcessService logProcessService;
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        super.addControlProcess("soapClients", LogProcess.class, logProcessService);
        
        SOAPServiceDto service1= new SOAPServiceDto("getBestScore","http://0.0.0.0:9999/training-server/PlayerManager", UserNamePDto.class);
        super.enableSOAPClient(service1);
        
        SOAPServiceDto service2= new SOAPServiceDto("getPlayer","http://0.0.0.0:9999/training-server/PlayerManager", UserNamePDto.class);
        super.enableSOAPClient(service2);
        
        SOAPServiceDto service3= new SOAPServiceDto("getAllPlayers","http://0.0.0.0:9999/training-server/PlayerManager", BasicPDto.class);
        super.enableSOAPClient(service3);
        
        SOAPServiceDto service4= new SOAPServiceDto("createPlayer","http://0.0.0.0:9999/training-server/PlayerManager", PlayerUserPDto.class);
        super.enableSOAPClient(service4);
    }
    
    @Override
    public String getClientId(){
        User user= securityService.getCurrentUser();
        return user.getUsername();
    }
    
    
}
