/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.services.impl;


import com.lacv.mercando.daos.TableColumnJpa;
import com.lacv.mercando.model.entities.TableColumn;
import com.lacv.mercando.model.mappers.TableColumnMapper;
import com.lacv.mercando.services.TableColumnService;
import com.dot.gcpbasedot.dao.GenericDao;
import com.dot.gcpbasedot.service.EntityServiceImpl1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lcastrillo
 */
@Service("tableColumnService")
public class TableColumnServiceImpl extends EntityServiceImpl1<TableColumn> implements TableColumnService {
    
    @Autowired
    public TableColumnJpa tableColumnJpa;
    
    @Autowired
    public TableColumnMapper tableColumnMapper;
    
    @Override
    public GenericDao getGenericDao(){
        return tableColumnJpa;
    }
    
}
