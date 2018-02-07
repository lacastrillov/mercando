/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.dot.gcpbasedot.mapper.EntityMapper;
import com.dot.gcpbasedot.mapper.EntityMapperImpl;
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
            dto.setId(entity.getId());
            dto.setDescription(entity.getDescription());
            dto.setImage(entity.getImage());
            dto.setName(entity.getName());
        }
        return dto;
    }

    @Override
    public List<CategoryDto> listEntitiesToListDtos(List<Category> entities) {
        List<CategoryDto> dtos= new ArrayList<>();
        if(entities!=null){
            for(Category entity: entities){
                dtos.add(entityToDto(entity));
            }
        }
        return dtos;
    }
    
}
