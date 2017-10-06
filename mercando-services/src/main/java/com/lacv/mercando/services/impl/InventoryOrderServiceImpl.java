/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.services.impl;


import com.lacv.mercando.daos.InventoryOrderJpa;
import com.lacv.mercando.model.entities.InventoryOrder;
import com.lacv.mercando.model.mappers.InventoryOrderMapper;
import com.lacv.mercando.services.InventoryOrderService;
import com.dot.gcpbasedot.dao.GenericDao;
import com.dot.gcpbasedot.service.EntityServiceImpl1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nalvarez
 */
@Service("inventoryOrderService")
public class InventoryOrderServiceImpl extends EntityServiceImpl1<InventoryOrder> implements InventoryOrderService {
    
    @Autowired
    public InventoryOrderJpa inventoryOrderJpa;
    
    @Autowired
    public InventoryOrderMapper inventoryOrderMapper;
    
    @Override
    public GenericDao getGenericDao(){
        return inventoryOrderJpa;
    }
    
}
