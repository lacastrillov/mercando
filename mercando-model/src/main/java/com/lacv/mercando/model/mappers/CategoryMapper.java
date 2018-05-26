/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.lacv.jmagrexs.mapper.EntityMapper;
import com.lacv.jmagrexs.mapper.EntityMapperImpl;
import com.lacv.mercando.model.dtos.CategoryDto;
import com.lacv.mercando.model.entities.Category;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Component;

/**
 *
 * @author lcastrillo
 */
@Component("categoryMapper")
public class CategoryMapper extends EntityMapperImpl<Category, CategoryDto> implements EntityMapper<Category, CategoryDto> {

    
    @Override
    public CategoryDto entityToDto(Category entity) {
        CategoryDto dto= new CategoryDto();
        if(entity!=null){
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
    public List<CategoryDto> listEntitiesToListDtos(List<Category> entities){
        List<CategoryDto> dtos= new ArrayList<>();
        if(entities!=null){
            for(Category entity: entities){
                dtos.add(entityToDto(entity));
            }
        }
        return dtos;
    }
    
    @Override
    public Category dtoToEntity(CategoryDto dto) {
        Category entity= new Category();
        if(dto!=null){
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
    public List<Category> listDtosToListEntities(List<CategoryDto> dtos){
        List<Category> entities= new ArrayList<>();
        if(entities!=null){
            for(CategoryDto dto: dtos){
                entities.add(dtoToEntity(dto));
            }
        }
        return entities;
    }

}
