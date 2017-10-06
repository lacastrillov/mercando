/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.services.impl;


import com.lacv.mercando.daos.LeadTableJpa;
import com.lacv.mercando.model.entities.LeadTable;
import com.lacv.mercando.model.mappers.LeadTableMapper;
import com.lacv.mercando.services.LeadTableService;
import com.dot.gcpbasedot.dao.GenericDao;
import com.dot.gcpbasedot.service.EntityServiceImpl1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nalvarez
 */
@Service("leadTableService")
public class LeadTableServiceImpl extends EntityServiceImpl1<LeadTable> implements LeadTableService {
    
    @Autowired
    public LeadTableJpa leadTableJpa;
    
    @Autowired
    public LeadTableMapper leadTableMapper;
    
    @Override
    public GenericDao getGenericDao(){
        return leadTableJpa;
    }
    
}
