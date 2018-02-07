/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.services.impl;


import com.lacv.mercando.daos.RoleJpa;
import com.lacv.mercando.model.entities.Role;
import com.lacv.mercando.model.mappers.RoleMapper;
import com.lacv.mercando.services.RoleService;
import com.dot.gcpbasedot.dao.GenericDao;
import com.dot.gcpbasedot.service.EntityServiceImpl1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lcastrillo
 */
@Service("roleService")
public class RoleServiceImpl extends EntityServiceImpl1<Role> implements RoleService {
    
    @Autowired
    public RoleJpa roleJpa;
    
    @Autowired
    public RoleMapper roleMapper;
    
    @Override
    public GenericDao getGenericDao(){
        return roleJpa;
    }
    
}
