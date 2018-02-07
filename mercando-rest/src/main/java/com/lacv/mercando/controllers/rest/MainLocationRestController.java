/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.rest;


import com.dot.gcpbasedot.controller.RestEntityController;
import com.lacv.mercando.model.mappers.MainLocationMapper;
import com.lacv.mercando.services.MainLocationService;
import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author lcastrillo
 */
@Controller
@RequestMapping(value="/mainLocation")
public class MainLocationRestController extends RestEntityController {
    
    @Autowired
    MainLocationService mainLocationService;
    
    @Autowired
    MainLocationMapper mainLocationMapper;
    
    
    @PostConstruct
    public void init(){
        super.addControlMapping("mainLocation", mainLocationService, mainLocationMapper);
    }
    
}
