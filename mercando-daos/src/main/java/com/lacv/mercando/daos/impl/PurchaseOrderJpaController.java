/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.daos.impl;


import com.lacv.mercando.daos.PurchaseOrderJpa;
import com.lacv.mercando.model.entities.PurchaseOrder;
import com.lacv.jmagrexs.dao.JPAGenericDao;
import org.springframework.stereotype.Repository;

/**
 *
 * @author lacastrillov
 */
@Repository
public class PurchaseOrderJpaController extends JPAGenericDao<PurchaseOrder> implements PurchaseOrderJpa {
    
}
