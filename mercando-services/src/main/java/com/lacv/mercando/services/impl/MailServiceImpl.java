/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.services.impl;


import com.lacv.mercando.daos.MailJpa;
import com.lacv.mercando.model.entities.Mail;
import com.lacv.mercando.model.mappers.MailMapper;
import com.lacv.mercando.services.MailService;
import com.dot.gcpbasedot.dao.GenericDao;
import com.dot.gcpbasedot.service.EntityServiceImpl1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lcastrillo
 */
@Service("mailService")
public class MailServiceImpl extends EntityServiceImpl1<Mail> implements MailService {
    
    @Autowired
    public MailJpa mailJpa;
    
    @Autowired
    public MailMapper mailMapper;
    
    @Override
    public GenericDao getGenericDao(){
        return mailJpa;
    }
    
}
