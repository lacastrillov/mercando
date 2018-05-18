/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.view;

import com.lacv.mercando.model.dtos.InventoryOrderDto;
import com.lacv.mercando.model.mappers.InventoryOrderMapper;
import com.lacv.mercando.services.InventoryOrderService;
import com.lacv.jmagrexs.controller.view.ExtEntityController;
import com.lacv.jmagrexs.dto.MenuItem;
import com.lacv.jmagrexs.dto.config.EntityConfig;
import com.lacv.mercando.model.entities.InventoryorderDetail;
import com.lacv.jmagrexs.modules.security.services.bussiness.SecurityService;
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
@RequestMapping(value="/vista/inventoryOrder")
public class InventoryOrderViewController extends ExtEntityController {
    
    @Autowired
    InventoryOrderService inventoryOrderService;
    
    @Autowired
    InventoryOrderMapper inventoryOrderMapper;
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        EntityConfig view= new EntityConfig("inventoryOrder", inventoryOrderService, InventoryOrderDto.class);
        view.setSingularEntityTitle("Orden de Inventario");
        view.setPluralEntityTitle("Ordenes de Inventario");
        view.addChildExtView("inventoryorderDetail", InventoryorderDetail.class, EntityConfig.TCV_1_TO_N);
        super.addControlMapping(view);
        
        MenuItem menuParent= new MenuItem("Pedidos");
        MenuItem menuItem= new MenuItem("inventoryOrder", "Gestionar Ordenes de Inventario");
        menuParent.addSubMenu(menuItem);
        menuComponent.addItemMenu(menuParent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
    
}
