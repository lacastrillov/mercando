/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.daos.impl;


import com.lacv.mercando.daos.SupplierJpa;
import com.lacv.mercando.model.entities.Supplier;
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
public class SupplierJpaController extends JPAAbstractDao<Supplier> implements SupplierJpa {

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
