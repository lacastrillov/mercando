/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.services.config.impl;

import com.dot.gcpbasedot.dao.GenericDao;
import com.dot.gcpbasedot.service.ConfigurationObjectServiceImpl;
import com.lacv.mercando.daos.JsonObjectJpa;
import com.lacv.mercando.model.dtos.config.PortalConfigDto;
import com.lacv.mercando.services.config.PortalConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lacastrillov
 */
@Service
public class PortalConfigServiceImpl extends ConfigurationObjectServiceImpl<PortalConfigDto> implements PortalConfigService {
    
    @Autowired
    JsonObjectJpa jsonObjectDao;
    
    @Override
    public GenericDao getJsonObjectDao() {
        return jsonObjectDao;
    }
    
}
