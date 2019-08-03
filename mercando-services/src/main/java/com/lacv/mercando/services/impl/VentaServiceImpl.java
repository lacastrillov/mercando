/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.services.impl;


import com.lacv.mercando.daos.VentaJpa;
import com.lacv.mercando.model.entities.Venta;
import com.lacv.mercando.model.mappers.VentaMapper;
import com.lacv.mercando.services.VentaService;
import com.lacv.jmagrexs.dao.GenericDao;
import com.lacv.jmagrexs.mapper.EntityMapper;
import com.lacv.jmagrexs.service.EntityServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lcastrillo
 */
@Service("ventaService")
public class VentaServiceImpl extends EntityServiceImpl<Venta> implements VentaService {
    
    @Autowired
    public VentaJpa ventaJpa;
    
    @Autowired
    public VentaMapper ventaMapper;
    
    @Override
    public GenericDao getGenericDao(){
        return ventaJpa;
    }
    
    @Override
    public EntityMapper getEntityMapper(){
        return ventaMapper;
    }
    
}