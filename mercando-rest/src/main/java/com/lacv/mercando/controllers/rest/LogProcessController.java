/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.rest;


import com.lacv.mercando.model.mappers.LogProcessMapper;
import com.lacv.mercando.services.LogProcessService;
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
@RequestMapping(value="/logProcess")
public class LogProcessController extends RestEntityController {
    
    @Autowired
    LogProcessService logProcessService;
    
    @Autowired
    LogProcessMapper logProcessMapper;
    
    
    @PostConstruct
    public void init(){
        super.addControlMapping("logProcess", logProcessService, logProcessMapper);
    }
    
}
