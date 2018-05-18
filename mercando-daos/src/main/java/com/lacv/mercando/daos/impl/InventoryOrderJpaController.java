/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.daos.impl;


import com.lacv.mercando.daos.InventoryOrderJpa;
import com.lacv.mercando.model.entities.InventoryOrder;
import com.lacv.jmagrexs.dao.JPAGenericDao;
import org.springframework.stereotype.Repository;

/**
 *
 * @author lacastrillov
 */
@Repository
public class InventoryOrderJpaController extends JPAGenericDao<InventoryOrder> implements InventoryOrderJpa {

    
}
