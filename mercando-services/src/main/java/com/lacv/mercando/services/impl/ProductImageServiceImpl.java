/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.services.impl;


import com.lacv.mercando.daos.ProductImageJpa;
import com.lacv.mercando.model.entities.ProductImage;
import com.lacv.mercando.model.mappers.ProductImageMapper;
import com.lacv.mercando.services.ProductImageService;
import com.lacv.jmagrexs.dao.GenericDao;
import com.lacv.jmagrexs.service.EntityServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lcastrillo
 */
@Service("productImageService")
public class ProductImageServiceImpl extends EntityServiceImpl<ProductImage> implements ProductImageService {
    
    @Autowired
    public ProductImageJpa productImageJpa;
    
    @Autowired
    public ProductImageMapper productImageMapper;
    
    @Override
    public GenericDao getGenericDao(){
        return productImageJpa;
    }
    
}
