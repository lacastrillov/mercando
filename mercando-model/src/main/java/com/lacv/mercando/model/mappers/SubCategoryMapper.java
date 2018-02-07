/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.dot.gcpbasedot.mapper.EntityMapper;
import com.dot.gcpbasedot.mapper.EntityMapperImpl;
import com.lacv.mercando.model.dtos.CategoryDto;
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
            dto.setId(entity.getId());
            dto.setDescription(entity.getDescription());
            dto.setImage(entity.getImage());
            dto.setName(entity.getName());
            dto.setCategory(categoryMapper.entityToDto(entity.getCategory()));
        }
        return dto;
    }
    
    /**
     *
     * @param entities
     * @return
     */
    @Override
    public List<SubCategoryDto> listEntitiesToListDtos(List <SubCategory> entities){
        List<SubCategoryDto> dtos= new ArrayList<>();
        if(entities!=null){
            for(SubCategory entity: entities){
                dtos.add(entityToDto(entity));
            }
        }
        return dtos;
    }
    
}
