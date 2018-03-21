/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.system.services.impl;


import com.lacv.system.daos.MailTemplateJpa;
import com.lacv.system.model.entities.MailTemplate;
import com.lacv.system.model.mappers.MailTemplateMapper;
import com.lacv.system.services.MailTemplateService;
import com.dot.gcpbasedot.dao.GenericDao;
import com.dot.gcpbasedot.service.EntityServiceImpl1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lcastrillo
 */
@Service("mailTemplateService")
public class MailTemplateServiceImpl extends EntityServiceImpl1<MailTemplate> implements MailTemplateService {
    
    @Autowired
    public MailTemplateJpa mailTemplateJpa;
    
    @Autowired
    public MailTemplateMapper mailTemplateMapper;
    
    @Override
    public GenericDao getGenericDao(){
        return mailTemplateJpa;
    }
    
}
