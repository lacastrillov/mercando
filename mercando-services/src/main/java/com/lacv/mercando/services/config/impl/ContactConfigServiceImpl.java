/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.services.config.impl;

import com.dot.gcpbasedot.dao.GenericDao;
import com.dot.gcpbasedot.service.ConfigurationObjectServiceImpl;
import com.lacv.mercando.daos.JsonObjectJpa;
import com.lacv.mercando.model.dtos.config.ContactConfigDto;
import com.lacv.mercando.services.config.ContactConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lacastrillov
 */
@Service
public class ContactConfigServiceImpl extends ConfigurationObjectServiceImpl<ContactConfigDto> implements ContactConfigService {
    
    @Autowired
    JsonObjectJpa jsonObjectDao;
    
    @Override
    public GenericDao getJsonObjectDao() {
        return jsonObjectDao;
    }
    
}
