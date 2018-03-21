/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.system.controllers.rest;


import com.lacv.system.model.mappers.WebresourceAuthorizationMapper;
import com.lacv.system.services.WebresourceAuthorizationService;
import com.dot.gcpbasedot.controller.RestEntityController;
import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author lcastrillo
 */
@Controller
@RequestMapping(value="/webresourceAuthorization")
public class WebresourceAuthorizationRestController extends RestEntityController {
    
    @Autowired
    WebresourceAuthorizationService webresourceAuthorizationService;
    
    @Autowired
    WebresourceAuthorizationMapper webresourceAuthorizationMapper;
    
    
    @PostConstruct
    public void init(){
        super.addControlMapping("webresourceAuthorization", webresourceAuthorizationService, webresourceAuthorizationMapper);
    }
    
    
}
