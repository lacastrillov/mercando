/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.system.services.impl;


import com.lacv.system.daos.AuthorizationJpa;
import com.lacv.system.model.entities.Authorization;
import com.lacv.system.model.mappers.AuthorizationMapper;
import com.lacv.system.services.AuthorizationService;
import com.dot.gcpbasedot.dao.GenericDao;
import com.dot.gcpbasedot.service.EntityServiceImpl1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lcastrillo
 */
@Service("authorizationService")
public class AuthorizationServiceImpl extends EntityServiceImpl1<Authorization> implements AuthorizationService {
    
    @Autowired
    public AuthorizationJpa authorizationJpa;
    
    @Autowired
    public AuthorizationMapper authorizationMapper;
    
    @Override
    public GenericDao getGenericDao(){
        return authorizationJpa;
    }
    
}
