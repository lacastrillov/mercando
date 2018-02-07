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
import com.dot.gcpbasedot.dao.GenericDao;
import com.dot.gcpbasedot.service.EntityServiceImpl1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lcastrillo
 */
@Service("paymentService")
public class PaymentServiceImpl extends EntityServiceImpl1<Payment> implements PaymentService {
    
    @Autowired
    public PaymentJpa paymentJpa;
    
    @Autowired
    public PaymentMapper paymentMapper;
    
    @Override
    public GenericDao getGenericDao(){
        return paymentJpa;
    }
    
}
