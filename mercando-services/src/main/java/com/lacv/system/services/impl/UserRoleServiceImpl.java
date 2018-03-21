/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.system.services.impl;


import com.lacv.system.daos.UserRoleJpa;
import com.lacv.system.model.entities.UserRole;
import com.lacv.system.model.mappers.UserRoleMapper;
import com.lacv.system.services.UserRoleService;
import com.dot.gcpbasedot.dao.GenericDao;
import com.dot.gcpbasedot.service.EntityServiceImpl1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lcastrillo
 */
@Service("userRoleService")
public class UserRoleServiceImpl extends EntityServiceImpl1<UserRole> implements UserRoleService {
    
    @Autowired
    public UserRoleJpa userRoleJpa;
    
    @Autowired
    public UserRoleMapper userRoleMapper;
    
    @Override
    public GenericDao getGenericDao(){
        return userRoleJpa;
    }
    
}
