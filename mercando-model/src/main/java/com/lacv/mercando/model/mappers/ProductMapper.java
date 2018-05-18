/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.lacv.jmagrexs.mapper.EntityMapper;
import com.lacv.jmagrexs.mapper.EntityMapperImpl;
import com.lacv.mercando.model.dtos.ProductDto;
import com.lacv.mercando.model.entities.Product;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * @author lcastrillo
 */
@Component("productMapper")
public class ProductMapper extends EntityMapperImpl<Product, ProductDto> implements EntityMapper<Product, ProductDto> {
    
    @Autowired
    CategoryMapper categoryMapper;
    
    @Autowired
    SubCategoryMapper subCategoryMapper;
    
    @Autowired
    SupplierMapper supplierMapper;
    
    @Autowired
    CommerceMapper commerceMapper;

    
    @Override
    public ProductDto entityToDto(Product entity) {
        ProductDto dto= new ProductDto();
        if(entity!=null){
            dto.setId(entity.getId());
            dto.setBrand(entity.getBrand());
            dto.setBuyUnitPrice(entity.getBuyUnitPrice());
            dto.setCategory(categoryMapper.entityToDto(entity.getCategory()));
            dto.setSubCategory(subCategoryMapper.entityToDto(entity.getSubCategory()));
            dto.setCode(entity.getCode());
            dto.setDescription(entity.getDescription());
            dto.setDiscount(entity.getDiscount());
            dto.setFeatured(entity.getFeatured());
            dto.setKeywords(entity.getKeywords());
            dto.setName(entity.getName());
            dto.setOrderLevel(entity.getOrderLevel());
            dto.setQuantityPerUnit(entity.getQuantityPerUnit());
            dto.setRegisterDate(entity.getRegisterDate());
            dto.setSeggestedUnitPrice(entity.getSeggestedUnitPrice());
            dto.setStatus(entity.getStatus());
            dto.setSupplier(supplierMapper.entityToDto(entity.getSupplier()));
            dto.setUnitsInOrder(entity.getUnitsInOrder());
            dto.setUnitsInStock(entity.getUnitsInStock());
            dto.setCommerce(commerceMapper.entityToDto(entity.getCommerce()));
        }
        return dto;
    }
    
    /**
     *
     * @param entities
     * @return
     */
    @Override
    public List<ProductDto> listEntitiesToListDtos(List<Product> entities){
        List<ProductDto> dtos= new ArrayList<>();
        if(entities!=null){
            for(Product entity: entities){
                dtos.add(entityToDto(entity));
            }
        }
        return dtos;
    }
    
}
