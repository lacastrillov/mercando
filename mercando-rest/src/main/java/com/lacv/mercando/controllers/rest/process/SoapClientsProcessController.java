/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.rest.process;


import com.lacv.system.model.entities.LogProcess;
import com.lacv.system.model.entities.User;
import com.lacv.system.services.LogProcessService;
import com.lacv.system.services.security.SecurityService;
import com.dot.gcpbasedot.controller.RestProcessController;
import com.lacv.mercando.services.external.BackbaseTrainingService;
import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author lcastrillo
 */
@Controller
@RequestMapping(value="/soapClients")
public class SoapClientsProcessController extends RestProcessController {
    
    @Autowired
    LogProcessService logProcessService;
    
    @Autowired
    SecurityService securityService;
    
    @Autowired
    BackbaseTrainingService backbaseTrainingService;
    
    
    @PostConstruct
    public void init(){
        super.addControlProcess("soapClients", LogProcess.class, logProcessService);
        
        super.enableExternalService(backbaseTrainingService);
    }
    
    @Override
    public String getClientId(){
        User user= securityService.getCurrentUser();
        return user.getUsername();
    }
    
    
}
