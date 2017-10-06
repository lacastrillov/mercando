/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.services.impl;


import com.lacv.mercando.daos.CategoryJpa;
import com.lacv.mercando.model.entities.Category;
import com.lacv.mercando.model.mappers.CategoryMapper;
import com.lacv.mercando.services.CategoryService;
import com.dot.gcpbasedot.dao.GenericDao;
import com.dot.gcpbasedot.service.EntityServiceImpl1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nalvarez
 */
@Service("categoryService")
public class CategoryServiceImpl extends EntityServiceImpl1<Category> implements CategoryService {
    
    @Autowired
    public CategoryJpa categoryJpa;
    
    @Autowired
    public CategoryMapper categoryMapper;
    
    @Override
    public GenericDao getGenericDao(){
        return categoryJpa;
    }
    
}
