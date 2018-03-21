/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.system.daos.impl;


import com.lacv.system.daos.LeadTableJpa;
import com.lacv.system.model.entities.LeadTable;
import com.dot.gcpbasedot.dao.JPAAbstractDao;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author lacastrillov
 */
@Repository
public class LeadTableJpaController extends JPAAbstractDao<LeadTable> implements LeadTableJpa {

    @Autowired
    public void init(DataSource dataSource){
        super.setDataSource(dataSource);
    }
    
    @Override
    @PersistenceContext(unitName ="MarketPlatformPU")
    public void setEntityManager(EntityManager entityManager) {
        this.entityManager= entityManager;
    }
    
}
