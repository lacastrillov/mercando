/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.lacv.jmagrexs.mapper.EntityMapper;
import com.lacv.jmagrexs.mapper.EntityMapperImpl;
import com.lacv.mercando.model.dtos.SubCategoryDto;
import com.lacv.mercando.model.entities.SubCategory;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * @author lcastrillo
 */
@Component("subCategoryMapper")
public class SubCategoryMapper extends EntityMapperImpl<SubCategory, SubCategoryDto> implements EntityMapper<SubCategory, SubCategoryDto> {
    
    @Autowired
    CategoryMapper categoryMapper;

    
    @Override
    public SubCategoryDto entityToDto(SubCategory entity) {
        SubCategoryDto dto= new SubCategoryDto();
        if(entity!=null){
            dto.setCategory(categoryMapper.entityToDto(entity.getCategory()));
            dto.setDescription(entity.getDescription());
            dto.setId(entity.getId());
            dto.setImage(entity.getImage());
            dto.setName(entity.getName());
        }
        return dto;
    }
    
    /**
     *
     * @param entities
     * @return
     */
    @Override
    public List<SubCategoryDto> listEntitiesToListDtos(List<SubCategory> entities){
        List<SubCategoryDto> dtos= new ArrayList<>();
        if(entities!=null){
            for(SubCategory entity: entities){
                dtos.add(entityToDto(entity));
            }
        }
        return dtos;
    }
    
    @Override
    public SubCategory dtoToEntity(SubCategoryDto dto) {
        SubCategory entity= new SubCategory();
        if(dto!=null){
            entity.setCategory(categoryMapper.dtoToEntity(dto.getCategory()));
            entity.setDescription(dto.getDescription());
            entity.setId(dto.getId());
            entity.setImage(dto.getImage());
            entity.setName(dto.getName());
        }
        return entity;
    }
    
    /**
     *
     * @return
     */
    @Override
    public List<SubCategory> listDtosToListEntities(List<SubCategoryDto> dtos){
        List<SubCategory> entities= new ArrayList<>();
        if(entities!=null){
            for(SubCategoryDto dto: dtos){
                entities.add(dtoToEntity(dto));
            }
        }
        return entities;
    }

}
