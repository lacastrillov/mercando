/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.services.impl;


import com.lacv.mercando.daos.WebresourceRoleJpa;
import com.lacv.mercando.model.entities.WebresourceRole;
import com.lacv.mercando.model.mappers.WebresourceRoleMapper;
import com.lacv.mercando.services.WebresourceRoleService;
import com.dot.gcpbasedot.dao.GenericDao;
import com.dot.gcpbasedot.service.EntityServiceImpl1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nalvarez
 */
@Service("webresourceRoleService")
public class WebresourceRoleServiceImpl extends EntityServiceImpl1<WebresourceRole> implements WebresourceRoleService {
    
    @Autowired
    public WebresourceRoleJpa webresourceRoleJpa;
    
    @Autowired
    public WebresourceRoleMapper webresourceRoleMapper;
    
    @Override
    public GenericDao getGenericDao(){
        return webresourceRoleJpa;
    }
    
}
