/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.view;

import com.lacv.mercando.model.dtos.CompraDto;
import com.lacv.mercando.model.mappers.CompraMapper;
import com.lacv.mercando.services.CompraService;
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
@RequestMapping(value="/vista/compra")
public class CompraViewController extends ExtEntityController {
    
    @Autowired
    CompraService compraService;
    
    @Autowired
    CompraMapper compraMapper;
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        EntityConfig view= new EntityConfig("compra", compraService, CompraDto.class);
        view.setSingularEntityTitle("Compra");
        view.setPluralEntityTitle("Compras");
        view.setMultipartFormData(false);
        view.setVisibleSeeAllButton(false);
        view.setDefaultOrder("id", "DESC");
        view.addComboboxChildDependent("subCategory", "product");
        super.addControlMapping(view);
        
        MenuItem menuParent= new MenuItem("Productos");
        MenuItem menuItem= new MenuItem("compra", "Gestionar Compras", 4);
        menuParent.addSubMenu(menuItem);
        
        menuComponent.addItemMenu(menuParent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
}