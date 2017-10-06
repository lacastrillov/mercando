/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.services.impl;

import com.dot.gcpbasedot.service.JdbcDirectAbstractService;
import com.dot.gcpbasedot.service.JdbcDirectService;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lacastrillov
 */
@Service
public class JdbcDirectServiceImpl extends JdbcDirectAbstractService implements JdbcDirectService {
    
    @Autowired
    public void init(DataSource dataSource){
        super.setDataSource(dataSource);
    }
    
}
