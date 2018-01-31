/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.view;

import com.lacv.mercando.model.dtos.PurchaseOrderDto;
import com.lacv.mercando.model.mappers.PurchaseOrderMapper;
import com.lacv.mercando.services.PurchaseOrderService;
import com.dot.gcpbasedot.controller.ExtEntityController;
import com.dot.gcpbasedot.dto.MenuItem;
import com.dot.gcpbasedot.dto.config.EntityConfig;
import com.lacv.mercando.model.entities.Payment;
import com.lacv.mercando.model.entities.PurchaseorderDetail;
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
@RequestMapping(value="/purchaseOrder")
public class PurchaseOrderViewController extends ExtEntityController {
    
    @Autowired
    PurchaseOrderService purchaseOrderService;
    
    @Autowired
    PurchaseOrderMapper purchaseOrderMapper;
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        EntityConfig view= new EntityConfig("purchaseOrder", purchaseOrderService, PurchaseOrderDto.class);
        view.setSingularEntityTitle("Orden de Compra");
        view.setPluralEntityTitle("Ordenes de Compra");
        view.addChildExtView("purchaseorderDetail", PurchaseorderDetail.class, EntityConfig.TCV_1_TO_N);
        view.addChildExtView("payment", Payment.class, EntityConfig.TCV_1_TO_N);
        super.addControlMapping(view);
        
        MenuItem menuParent= new MenuItem("Ordenes de Compra", 9);
        MenuItem menuItem= new MenuItem("purchaseOrder", "Gestionar Ordenes de Compra");
        menuParent.addSubMenu(menuItem);
        menuComponent.addItemMenu(menuParent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
}
