/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.services.config.impl;

import com.lacv.jmagrexs.dao.GenericDao;
import com.lacv.jmagrexs.modules.common.daos.JsonObjectJpa;
import com.lacv.jmagrexs.service.ConfigurationObjectServiceImpl;
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
