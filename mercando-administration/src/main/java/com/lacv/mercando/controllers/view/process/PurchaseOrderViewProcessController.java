/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.view.process;

import com.lacv.mercando.model.dtos.LogProcessDto;
import com.lacv.mercando.model.dtos.process.BasicResultDto;
import com.dot.gcpbasedot.controller.ExtProcessController;
import com.dot.gcpbasedot.components.MenuComponent;
import com.dot.gcpbasedot.dto.MenuItem;
import com.dot.gcpbasedot.dto.config.ProcessConfig;
import com.dot.gcpbasedot.enums.PageType;
import com.lacv.mercando.model.dtos.process.ShoppingCartPDto;
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
@RequestMapping(value="/processPurchaseOrder")
public class PurchaseOrderViewProcessController extends ExtProcessController {
    
    @Autowired
    MenuComponent menuComponent;
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        ProcessConfig process= new ProcessConfig("processPurchaseOrder", "logProcess", LogProcessDto.class);
        process.setMainProcessTitle("Gestionar Procesos de Ordenes de Compra");
        process.addControlProcessView("generarOrdenCompra", "Generar Orden Compra", ShoppingCartPDto.class, BasicResultDto.class);
        
        super.addControlMapping(process);
        
        MenuItem menuItem= new MenuItem("Procesos", "processPurchaseOrder", "Gestionar Procesos de Ordenes de Compra");
        menuItem.setPageType(PageType.PROCESS);
        menuComponent.addItemMenu(menuItem);
        
        super.addMenuComponent(menuComponent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
    
}
