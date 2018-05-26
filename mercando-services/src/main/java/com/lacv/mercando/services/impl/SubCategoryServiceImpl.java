/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.services.impl;


import com.lacv.mercando.daos.SubCategoryJpa;
import com.lacv.mercando.model.entities.SubCategory;
import com.lacv.mercando.model.mappers.SubCategoryMapper;
import com.lacv.mercando.services.SubCategoryService;
import com.lacv.jmagrexs.dao.GenericDao;
import com.lacv.jmagrexs.mapper.EntityMapper;
import com.lacv.jmagrexs.service.EntityServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lcastrillo
 */
@Service("subCategoryService")
public class SubCategoryServiceImpl extends EntityServiceImpl<SubCategory> implements SubCategoryService {
    
    @Autowired
    public SubCategoryJpa subCategoryJpa;
    
    @Autowired
    public SubCategoryMapper subCategoryMapper;
    
    @Override
    public GenericDao getGenericDao(){
        return subCategoryJpa;
    }

    @Override
    public EntityMapper getEntityMapper() {
        return subCategoryMapper;
    }
    
}
