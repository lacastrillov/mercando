/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.daos.impl;


import com.lacv.mercando.daos.CommerceJpa;
import com.lacv.mercando.model.entities.Commerce;
import com.lacv.jmagrexs.dao.JPAGenericDao;
import org.springframework.stereotype.Repository;

/**
 *
 * @author lacastrillov
 */
@Repository
public class CommerceJpaController extends JPAGenericDao<Commerce> implements CommerceJpa {
    
}
