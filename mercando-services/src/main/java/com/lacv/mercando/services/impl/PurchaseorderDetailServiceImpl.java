/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.services.impl;


import com.lacv.mercando.daos.PurchaseorderDetailJpa;
import com.lacv.mercando.model.entities.PurchaseorderDetail;
import com.lacv.mercando.model.mappers.PurchaseorderDetailMapper;
import com.lacv.mercando.services.PurchaseorderDetailService;
import com.dot.gcpbasedot.dao.GenericDao;
import com.dot.gcpbasedot.service.EntityServiceImpl1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lcastrillo
 */
@Service("purchaseorderDetailService")
public class PurchaseorderDetailServiceImpl extends EntityServiceImpl1<PurchaseorderDetail> implements PurchaseorderDetailService {
    
    @Autowired
    public PurchaseorderDetailJpa purchaseorderDetailJpa;
    
    @Autowired
    public PurchaseorderDetailMapper purchaseorderDetailMapper;
    
    @Override
    public GenericDao getGenericDao(){
        return purchaseorderDetailJpa;
    }
    
}
