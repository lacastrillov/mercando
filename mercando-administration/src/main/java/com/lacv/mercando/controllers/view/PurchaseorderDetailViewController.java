/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.view;

import com.lacv.mercando.model.dtos.PurchaseorderDetailDto;
import com.lacv.mercando.model.mappers.PurchaseorderDetailMapper;
import com.lacv.mercando.services.PurchaseorderDetailService;
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
@RequestMapping(value="/vista/purchaseorderDetail")
public class PurchaseorderDetailViewController extends ExtEntityController {
    
    @Autowired
    PurchaseorderDetailService purchaseorderDetailService;
    
    @Autowired
    PurchaseorderDetailMapper purchaseorderDetailMapper;
    
    
    @PostConstruct
    public void init(){
        EntityConfig view= new EntityConfig("purchaseorderDetail", purchaseorderDetailService, PurchaseorderDetailDto.class);
        view.setSingularEntityTitle("Detalle Orden Compra");
        view.setPluralEntityTitle("Detalle Orden Compra");
        super.addControlMapping(view);
    }
    
    
}
