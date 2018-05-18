/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.daos.impl;


import com.lacv.mercando.daos.InventoryorderDetailJpa;
import com.lacv.mercando.model.entities.InventoryorderDetail;
import com.lacv.jmagrexs.dao.JPAAbstractDao;
import com.lacv.jmagrexs.dao.JPAGenericDao;
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
public class InventoryorderDetailJpaController extends JPAGenericDao<InventoryorderDetail> implements InventoryorderDetailJpa {

    
}
