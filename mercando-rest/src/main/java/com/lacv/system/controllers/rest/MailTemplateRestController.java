/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.system.controllers.rest;


import com.lacv.system.model.mappers.MailTemplateMapper;
import com.lacv.system.services.MailTemplateService;
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
@RequestMapping(value="/mailTemplate")
public class MailTemplateRestController extends RestEntityController {
    
    @Autowired
    MailTemplateService mailTemplateService;
    
    @Autowired
    MailTemplateMapper mailTemplateMapper;
    
    
    @PostConstruct
    public void init(){
        super.addControlMapping("mailTemplate", mailTemplateService, mailTemplateMapper);
    }
    
    
}
