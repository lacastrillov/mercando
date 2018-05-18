/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.daos.impl;


import com.lacv.mercando.daos.SubCategoryJpa;
import com.lacv.mercando.model.entities.SubCategory;
import com.lacv.jmagrexs.dao.JPAGenericDao;
import org.springframework.stereotype.Repository;

/**
 *
 * @author lacastrillov
 */
@Repository
public class SubCategoryJpaController extends JPAGenericDao<SubCategory> implements SubCategoryJpa {
    
}
