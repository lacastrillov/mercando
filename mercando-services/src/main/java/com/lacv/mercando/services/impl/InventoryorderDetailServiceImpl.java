/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.services.impl;


import com.lacv.mercando.daos.InventoryorderDetailJpa;
import com.lacv.mercando.model.entities.InventoryorderDetail;
import com.lacv.mercando.model.mappers.InventoryorderDetailMapper;
import com.lacv.mercando.services.InventoryorderDetailService;
import com.lacv.jmagrexs.dao.GenericDao;
import com.lacv.jmagrexs.mapper.EntityMapper;
import com.lacv.jmagrexs.service.EntityServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lcastrillo
 */
@Service("inventoryorderDetailService")
public class InventoryorderDetailServiceImpl extends EntityServiceImpl<InventoryorderDetail> implements InventoryorderDetailService {
    
    @Autowired
    public InventoryorderDetailJpa inventoryorderDetailJpa;
    
    @Autowired
    public InventoryorderDetailMapper inventoryorderDetailMapper;
    
    @Override
    public GenericDao getGenericDao(){
        return inventoryorderDetailJpa;
    }

    @Override
    public EntityMapper getEntityMapper() {
        return inventoryorderDetailMapper;
    }
    
}
