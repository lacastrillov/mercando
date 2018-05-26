/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.services.impl;


import com.lacv.mercando.daos.PaymentJpa;
import com.lacv.mercando.model.entities.Payment;
import com.lacv.mercando.model.mappers.PaymentMapper;
import com.lacv.mercando.services.PaymentService;
import com.lacv.jmagrexs.dao.GenericDao;
import com.lacv.jmagrexs.mapper.EntityMapper;
import com.lacv.jmagrexs.service.EntityServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lcastrillo
 */
@Service("paymentService")
public class PaymentServiceImpl extends EntityServiceImpl<Payment> implements PaymentService {
    
    @Autowired
    public PaymentJpa paymentJpa;
    
    @Autowired
    public PaymentMapper paymentMapper;
    
    @Override
    public GenericDao getGenericDao(){
        return paymentJpa;
    }

    @Override
    public EntityMapper getEntityMapper() {
        return paymentMapper;
    }
    
}
