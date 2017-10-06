/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.services.impl;


import com.lacv.mercando.daos.CommerceJpa;
import com.lacv.mercando.model.entities.Commerce;
import com.lacv.mercando.model.mappers.CommerceMapper;
import com.lacv.mercando.services.CommerceService;
import com.dot.gcpbasedot.dao.GenericDao;
import com.dot.gcpbasedot.service.EntityServiceImpl1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nalvarez
 */
@Service("commerceService")
public class CommerceServiceImpl extends EntityServiceImpl1<Commerce> implements CommerceService {
    
    @Autowired
    public CommerceJpa commerceJpa;
    
    @Autowired
    public CommerceMapper commerceMapper;
    
    @Override
    public GenericDao getGenericDao(){
        return commerceJpa;
    }
    
}
