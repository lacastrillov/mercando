/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.view;

import com.lacv.mercando.model.dtos.SupplierDto;
import com.lacv.mercando.model.mappers.SupplierMapper;
import com.lacv.mercando.services.SupplierService;
import com.lacv.jmagrexs.controller.view.ExtEntityController;
import com.lacv.jmagrexs.dto.MenuItem;
import com.lacv.jmagrexs.dto.config.EntityConfig;
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
@RequestMapping(value="/vista/supplier")
public class SupplierViewController extends ExtEntityController {
    
    @Autowired
    SupplierService supplierService;
    
    @Autowired
    SupplierMapper supplierMapper;
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        EntityConfig view= new EntityConfig("supplier", supplierService, SupplierDto.class);
        view.setSingularEntityTitle("Proveedor");
        view.setPluralEntityTitle("Proveedores");
        super.addControlMapping(view);
        
        MenuItem menuParent= new MenuItem("Pedidos", 8);
        MenuItem menuItem= new MenuItem("supplier", "Gestionar Proveedores");
        menuParent.addSubMenu(menuItem);
        menuComponent.addItemMenu(menuParent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
}
