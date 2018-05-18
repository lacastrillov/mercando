/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.daos.impl;


import com.lacv.jmagrexs.dao.JPAGenericDao;
import com.lacv.mercando.daos.CategoryJpa;
import com.lacv.mercando.model.entities.Category;
import org.springframework.stereotype.Repository;

/**
 *
 * @author lacastrillov
 */
@Repository
public class CategoryJpaController extends JPAGenericDao<Category> implements CategoryJpa {

    
}
