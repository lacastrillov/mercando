/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.services;

import com.lacv.jmagrexs.modules.security.entities.User;
import com.lacv.mercando.model.entities.PurchaseOrder;
import com.lacv.jmagrexs.service.EntityService;
import com.lacv.mercando.model.dtos.process.ShoppingCartPDto;



/**
 *
 * @author lacastrillov
 */
public interface PurchaseOrderService extends EntityService<PurchaseOrder> {
    
    Long generatePurchaseOrder(ShoppingCartPDto shoppingCartPDto, User buyerUser);
    
}
