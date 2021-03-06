/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.lacv.jmagrexs.mapper.EntityMapper;
import com.lacv.jmagrexs.mapper.EntityMapperImpl;
import com.lacv.mercando.model.dtos.ProductImageDto;
import com.lacv.mercando.model.entities.ProductImage;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * @author lcastrillo
 */
@Component("productImageMapper")
public class ProductImageMapper extends EntityMapperImpl<ProductImage, ProductImageDto> implements EntityMapper<ProductImage, ProductImageDto> {
    
    @Autowired
    ProductMapper productMapper;

    
    @Override
    public ProductImageDto entityToDto(ProductImage entity) {
        ProductImageDto dto= new ProductImageDto();
        if(entity!=null){
            dto.setId(entity.getId());
            dto.setImage(entity.getImage());
            dto.setOrder(entity.getOrder());
            dto.setProduct(productMapper.entityToDto(entity.getProduct()));
        }
        return dto;
    }
    
    /**
     *
     * @param entities
     * @return
     */
    @Override
    public List<ProductImageDto> listEntitiesToListDtos(List<ProductImage> entities){
        List<ProductImageDto> dtos= new ArrayList<>();
        if(entities!=null){
            for(ProductImage entity: entities){
                dtos.add(entityToDto(entity));
            }
        }
        return dtos;
    }
    
    @Override
    public ProductImage dtoToEntity(ProductImageDto dto) {
        ProductImage entity= new ProductImage();
        if(dto!=null){
            entity.setId(dto.getId());
            entity.setImage(dto.getImage());
            entity.setOrder(dto.getOrder());
            entity.setProduct(productMapper.dtoToEntity(dto.getProduct()));
        }
        return entity;
    }
    
    /**
     *
     * @return
     */
    @Override
    public List<ProductImage> listDtosToListEntities(List<ProductImageDto> dtos){
        List<ProductImage> entities= new ArrayList<>();
        if(entities!=null){
            for(ProductImageDto dto: dtos){
                entities.add(dtoToEntity(dto));
            }
        }
        return entities;
    }

}
