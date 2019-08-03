/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.services.impl;


import com.lacv.mercando.daos.CompraJpa;
import com.lacv.mercando.model.entities.Compra;
import com.lacv.mercando.model.mappers.CompraMapper;
import com.lacv.mercando.services.CompraService;
import com.lacv.jmagrexs.dao.GenericDao;
import com.lacv.jmagrexs.mapper.EntityMapper;
import com.lacv.jmagrexs.service.EntityServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lcastrillo
 */
@Service("compraService")
public class CompraServiceImpl extends EntityServiceImpl<Compra> implements CompraService {
    
    @Autowired
    public CompraJpa compraJpa;
    
    @Autowired
    public CompraMapper compraMapper;
    
    @Override
    public GenericDao getGenericDao(){
        return compraJpa;
    }
    
    @Override
    public EntityMapper getEntityMapper(){
        return compraMapper;
    }
    
}