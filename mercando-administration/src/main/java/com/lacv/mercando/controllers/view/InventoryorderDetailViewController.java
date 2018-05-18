/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.view;

import com.lacv.mercando.model.dtos.InventoryorderDetailDto;
import com.lacv.mercando.model.mappers.InventoryorderDetailMapper;
import com.lacv.mercando.services.InventoryorderDetailService;
import com.lacv.jmagrexs.controller.view.ExtEntityController;
import com.lacv.jmagrexs.dto.config.EntityConfig;
import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author lacastrillov
 */
@Controller
@RequestMapping(value="/vista/inventoryorderDetail")
public class InventoryorderDetailViewController extends ExtEntityController {
    
    @Autowired
    InventoryorderDetailService inventoryorderDetailService;
    
    @Autowired
    InventoryorderDetailMapper inventoryorderDetailMapper;
    
    
    @PostConstruct
    public void init(){
        EntityConfig view= new EntityConfig("inventoryorderDetail", inventoryorderDetailService, InventoryorderDetailDto.class);
        view.setSingularEntityTitle("Detalle Orden de Inventario");
        view.setPluralEntityTitle("Detalle Orden de Inventario");
        super.addControlMapping(view);
    }
    
    
}
