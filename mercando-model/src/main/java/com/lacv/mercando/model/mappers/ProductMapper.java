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
    CommerceMapper commerceMapper;
    
    @Autowired
    SubCategoryMapper subCategoryMapper;
    
    @Autowired
    SupplierMapper supplierMapper;

    
    @Override
    public ProductDto entityToDto(Product entity) {
        ProductDto dto= new ProductDto();
        if(entity!=null){
            dto.setBrand(entity.getBrand());
            dto.setBuyUnitPrice(entity.getBuyUnitPrice());
            dto.setCategory(categoryMapper.entityToDto(entity.getCategory()));
            dto.setCode(entity.getCode());
            dto.setCommerce(commerceMapper.entityToDto(entity.getCommerce()));
            dto.setDescription(entity.getDescription());
            dto.setDiscount(entity.getDiscount());
            dto.setFeatured(entity.getFeatured());
            dto.setId(entity.getId());
            dto.setKeywords(entity.getKeywords());
            dto.setName(entity.getName());
            dto.setOrderLevel(entity.getOrderLevel());
            dto.setQuantityPerUnit(entity.getQuantityPerUnit());
            dto.setRegisterDate(entity.getRegisterDate());
            dto.setSeggestedUnitPrice(entity.getSeggestedUnitPrice());
            dto.setStatus(entity.getStatus());
            dto.setSubCategory(subCategoryMapper.entityToDto(entity.getSubCategory()));
            dto.setSupplier(supplierMapper.entityToDto(entity.getSupplier()));
            dto.setUnitsInOrder(entity.getUnitsInOrder());
            dto.setUnitsInStock(entity.getUnitsInStock());
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
    
    @Override
    public Product dtoToEntity(ProductDto dto) {
        Product entity= new Product();
        if(dto!=null){
            entity.setBrand(dto.getBrand());
            entity.setBuyUnitPrice(dto.getBuyUnitPrice());
            entity.setCategory(categoryMapper.dtoToEntity(dto.getCategory()));
            entity.setCode(dto.getCode());
            entity.setCommerce(commerceMapper.dtoToEntity(dto.getCommerce()));
            entity.setDescription(dto.getDescription());
            entity.setDiscount(dto.getDiscount());
            entity.setFeatured(dto.getFeatured());
            entity.setId(dto.getId());
            entity.setKeywords(dto.getKeywords());
            entity.setName(dto.getName());
            entity.setOrderLevel(dto.getOrderLevel());
            entity.setQuantityPerUnit(dto.getQuantityPerUnit());
            entity.setRegisterDate(dto.getRegisterDate());
            entity.setSeggestedUnitPrice(dto.getSeggestedUnitPrice());
            entity.setStatus(dto.getStatus());
            entity.setSubCategory(subCategoryMapper.dtoToEntity(dto.getSubCategory()));
            entity.setSupplier(supplierMapper.dtoToEntity(dto.getSupplier()));
            entity.setUnitsInOrder(dto.getUnitsInOrder());
            entity.setUnitsInStock(dto.getUnitsInStock());
        }
        return entity;
    }
    
    /**
     *
     * @return
     */
    @Override
    public List<Product> listDtosToListEntities(List<ProductDto> dtos){
        List<Product> entities= new ArrayList<>();
        if(entities!=null){
            for(ProductDto dto: dtos){
                entities.add(dtoToEntity(dto));
            }
        }
        return entities;
    }

}
