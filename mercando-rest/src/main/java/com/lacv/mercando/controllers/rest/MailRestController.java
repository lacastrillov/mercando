/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.rest;


import com.lacv.mercando.model.mappers.MailMapper;
import com.lacv.mercando.services.MailService;
import com.dot.gcpbasedot.controller.RestEntityController;
import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author nalvarez
 */
@Controller
@RequestMapping(value="/mail")
public class MailRestController extends RestEntityController {
    
    @Autowired
    MailService mailService;
    
    @Autowired
    MailMapper mailMapper;
    
    
    @PostConstruct
    public void init(){
        super.addControlMapping("mail", mailService, mailMapper);
    }
    
    
}
