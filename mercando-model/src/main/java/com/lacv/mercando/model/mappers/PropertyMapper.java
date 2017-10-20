/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.dot.gcpbasedot.mapper.EntityMapper;
import com.dot.gcpbasedot.mapper.EntityMapperImpl;
import com.lacv.mercando.model.dtos.PropertyDto;
import com.lacv.mercando.model.entities.Property;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Component;

/**
 *
 * @author nalvarez
 */
@Component("propertyMapper")
public class PropertyMapper extends EntityMapperImpl<Property, PropertyDto> implements EntityMapper<Property, PropertyDto> {

    
    @Override
    public PropertyDto entityToDto(Property entity) {
        PropertyDto dto= new PropertyDto();
        if(entity!=null){
            dto.setId(entity.getId());
            dto.setKey(entity.getKey());
            dto.setStatus(entity.getStatus());
            dto.setType(entity.getType());
            dto.setValue(entity.getValue());
        }
        return dto;
    }
    
    /**
     *
     * @param entities
     * @return
     */
    @Override
    public List<PropertyDto> listEntitiesToListDtos(List<Property> entities){
        List<PropertyDto> dtos= new ArrayList<>();
        if(entities!=null){
            for(Property entity: entities){
                dtos.add(entityToDto(entity));
            }
        }
        return dtos;
    }
    
}
