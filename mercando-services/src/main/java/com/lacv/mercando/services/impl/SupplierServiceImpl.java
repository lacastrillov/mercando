/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.services.impl;


import com.lacv.mercando.daos.SupplierJpa;
import com.lacv.mercando.model.entities.Supplier;
import com.lacv.mercando.model.mappers.SupplierMapper;
import com.lacv.mercando.services.SupplierService;
import com.lacv.jmagrexs.dao.GenericDao;
import com.lacv.jmagrexs.mapper.EntityMapper;
import com.lacv.jmagrexs.service.EntityServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lcastrillo
 */
@Service("supplierService")
public class SupplierServiceImpl extends EntityServiceImpl<Supplier> implements SupplierService {
    
    @Autowired
    public SupplierJpa supplierJpa;
    
    @Autowired
    public SupplierMapper supplierMapper;
    
    @Override
    public GenericDao getGenericDao(){
        return supplierJpa;
    }

    @Override
    public EntityMapper getEntityMapper() {
        return supplierMapper;
    }
    
}
