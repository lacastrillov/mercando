/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.system.services.impl;


import com.lacv.system.daos.RoleAuthorizationJpa;
import com.lacv.system.model.entities.RoleAuthorization;
import com.lacv.system.model.mappers.RoleAuthorizationMapper;
import com.lacv.system.services.RoleAuthorizationService;
import com.dot.gcpbasedot.dao.GenericDao;
import com.dot.gcpbasedot.service.EntityServiceImpl1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lcastrillo
 */
@Service("roleAuthorizationService")
public class RoleAuthorizationServiceImpl extends EntityServiceImpl1<RoleAuthorization> implements RoleAuthorizationService {
    
    @Autowired
    public RoleAuthorizationJpa roleAuthorizationJpa;
    
    @Autowired
    public RoleAuthorizationMapper roleAuthorizationMapper;
    
    @Override
    public GenericDao getGenericDao(){
        return roleAuthorizationJpa;
    }
    
}
