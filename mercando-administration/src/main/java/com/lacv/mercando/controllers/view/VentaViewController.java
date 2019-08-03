/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.view;

import com.lacv.mercando.model.dtos.VentaDto;
import com.lacv.mercando.model.mappers.VentaMapper;
import com.lacv.mercando.services.VentaService;
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
@RequestMapping(value="/vista/venta")
public class VentaViewController extends ExtEntityController {
    
    @Autowired
    VentaService ventaService;
    
    @Autowired
    VentaMapper ventaMapper;
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        EntityConfig view= new EntityConfig("venta", ventaService, VentaDto.class);
        view.setSingularEntityTitle("Venta");
        view.setPluralEntityTitle("Ventas");
        view.setMultipartFormData(false);
        view.setVisibleSeeAllButton(false);
        view.setDefaultOrder("id", "DESC");
        view.addComboboxChildDependent("subCategory", "product");
        super.addControlMapping(view);
        
        MenuItem menuParent= new MenuItem("Productos");
        MenuItem menuItem= new MenuItem("venta", "Gestionar Ventas", 5);
        menuParent.addSubMenu(menuItem);
        menuComponent.addItemMenu(menuParent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
}