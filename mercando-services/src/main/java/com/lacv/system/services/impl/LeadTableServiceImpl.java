/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.system.services.impl;


import com.lacv.system.daos.LeadTableJpa;
import com.lacv.system.model.entities.LeadTable;
import com.lacv.system.model.mappers.LeadTableMapper;
import com.lacv.system.services.LeadTableService;
import com.dot.gcpbasedot.dao.GenericDao;
import com.dot.gcpbasedot.service.EntityServiceImpl1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lcastrillo
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
