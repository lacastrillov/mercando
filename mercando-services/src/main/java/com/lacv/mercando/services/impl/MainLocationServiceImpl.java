/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.services.impl;


import com.lacv.mercando.daos.MainLocationJpa;
import com.lacv.mercando.model.entities.MainLocation;
import com.lacv.mercando.model.mappers.MainLocationMapper;
import com.lacv.mercando.services.MainLocationService;
import com.dot.gcpbasedot.dao.GenericDao;
import com.dot.gcpbasedot.service.EntityServiceImpl1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nalvarez
 */
@Service("mainLocationService")
public class MainLocationServiceImpl extends EntityServiceImpl1<MainLocation> implements MainLocationService {
    
    @Autowired
    public MainLocationJpa mainLocationJpa;
    
    @Autowired
    public MainLocationMapper mainLocationMapper;
    
    @Override
    public GenericDao getGenericDao(){
        return mainLocationJpa;
    }
    
}
