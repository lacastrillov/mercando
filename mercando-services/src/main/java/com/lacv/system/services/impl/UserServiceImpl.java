/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.system.services.impl;


import com.lacv.system.daos.UserJpa;
import com.lacv.system.model.entities.User;
import com.lacv.system.model.mappers.UserMapper;
import com.lacv.system.services.UserService;
import com.dot.gcpbasedot.dao.GenericDao;
import com.dot.gcpbasedot.service.EntityServiceImpl1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lcastrillo
 */
@Service("userService")
public class UserServiceImpl extends EntityServiceImpl1<User> implements UserService {
    
    @Autowired
    public UserJpa userJpa;
    
    @Autowired
    public UserMapper userMapper;
    
    @Override
    public GenericDao getGenericDao(){
        return userJpa;
    }
    
    
}
