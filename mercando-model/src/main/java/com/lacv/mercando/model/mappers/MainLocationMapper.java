/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.dot.gcpbasedot.mapper.EntityMapper;
import com.dot.gcpbasedot.mapper.EntityMapperImpl;
import com.lacv.mercando.model.dtos.MainLocationDto;
import com.lacv.mercando.model.entities.MainLocation;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Component;

/**
 *
 * @author nalvarez
 */
@Component("mainLocationMapper")
public class MainLocationMapper extends EntityMapperImpl<MainLocation, MainLocationDto> implements EntityMapper<MainLocation, MainLocationDto> {
    
    @Override
    public MainLocationDto entityToDto(MainLocation entity) {
        MainLocationDto dto= new MainLocationDto();
        if(entity!=null){
            dto.setId(entity.getId());
            dto.setMlDescription(entity.getMlDescription());
            dto.setMlLocation(entity.getMlLocation());
            dto.setMlName(entity.getMlName());
        }
        return dto;
    }
    
    /**
     *
     * @param entities
     * @return
     */
    @Override
    public List<MainLocationDto> listEntitiesToListDtos(List <MainLocation> entities){
        List<MainLocationDto> dtos= new ArrayList<>();
        if(entities!=null){
            for(MainLocation entity: entities){
                dtos.add(entityToDto(entity));
            }
        }
        return dtos;
    }
    
}
