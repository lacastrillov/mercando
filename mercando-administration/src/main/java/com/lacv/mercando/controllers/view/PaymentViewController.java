/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.view;

import com.lacv.mercando.model.dtos.PaymentDto;
import com.lacv.mercando.model.mappers.PaymentMapper;
import com.lacv.mercando.services.PaymentService;
import com.dot.gcpbasedot.controller.ExtEntityController;
import com.dot.gcpbasedot.components.MenuComponent;
import com.dot.gcpbasedot.dto.MenuItem;
import com.dot.gcpbasedot.dto.config.EntityConfig;
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
@RequestMapping(value="/payment")
public class PaymentViewController extends ExtEntityController {
    
    @Autowired
    PaymentService paymentService;
    
    @Autowired
    MenuComponent menuComponent;
    
    @Autowired
    PaymentMapper paymentMapper;
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        EntityConfig view= new EntityConfig("payment", paymentService, PaymentDto.class);
        view.setSingularEntityTitle("Pago");
        view.setPluralEntityTitle("Pagos");
        super.addControlMapping(view);
        
        MenuItem menuItem= new MenuItem("Pagos", "payment", "Gestionar Pagos");
        menuItem.setParentPosition(10);
        menuComponent.addItemMenu(menuItem);
        super.addMenuComponent(menuComponent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
}
