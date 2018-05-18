/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.daos.impl;


import com.lacv.mercando.daos.SupplierJpa;
import com.lacv.mercando.model.entities.Supplier;
import com.lacv.jmagrexs.dao.JPAGenericDao;
import org.springframework.stereotype.Repository;

/**
 *
 * @author lacastrillov
 */
@Repository
public class SupplierJpaController extends JPAGenericDao<Supplier> implements SupplierJpa {
    
}
