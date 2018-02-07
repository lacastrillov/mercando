/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.rest;


import com.lacv.mercando.model.mappers.WebresourceRoleMapper;
import com.lacv.mercando.services.WebresourceRoleService;
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
@RequestMapping(value="/webresourceRole")
public class WebresourceRoleRestController extends RestEntityController {
    
    @Autowired
    WebresourceRoleService webresourceRoleService;
    
    @Autowired
    WebresourceRoleMapper webresourceRoleMapper;
    
    
    @PostConstruct
    public void init(){
        super.addControlMapping("webresourceRole", webresourceRoleService, webresourceRoleMapper);
    }
    
    
}
