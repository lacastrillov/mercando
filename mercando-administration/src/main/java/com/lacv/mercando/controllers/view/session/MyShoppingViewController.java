/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.view.session;

import com.lacv.mercando.model.dtos.PurchaseOrderDto;
import com.lacv.mercando.model.mappers.PurchaseOrderMapper;
import com.lacv.mercando.services.PurchaseOrderService;
import com.dot.gcpbasedot.controller.ExtEntityController;
import com.dot.gcpbasedot.components.MenuComponent;
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
@RequestMapping(value="/myShopping")
public class MyShoppingViewController extends ExtEntityController {
    
    @Autowired
    PurchaseOrderService purchaseOrderService;
    
    @Autowired
    MenuComponent menuComponent;
    
    @Autowired
    PurchaseOrderMapper purchaseOrderMapper;
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        EntityConfig view= new EntityConfig("purchaseOrder", purchaseOrderService, PurchaseOrderDto.class);
        view.setPathRef("myShopping");
        view.setSingularEntityTitle("Mi Compra");
        view.setPluralEntityTitle("Mis Compras");
        view.addChildExtView("purchaseorderDetail", PurchaseorderDetail.class, EntityConfig.TCV_STANDARD);
        view.addChildExtView("payment", Payment.class, EntityConfig.TCV_STANDARD);
        view.setEditableForm(false);
        view.setEditableGrid(false);
        view.setRestSession(true);
        super.addControlMapping(view);
        
        MenuItem menuItem= new MenuItem("Ordenes de Compra", "myShopping", "Mis Compras");
        menuItem.setParentPosition(9);
        menuComponent.addItemMenu(menuItem);
        super.addMenuComponent(menuComponent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
}
