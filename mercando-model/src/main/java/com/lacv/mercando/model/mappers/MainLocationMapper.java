/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.lacv.jmagrexs.mapper.EntityMapper;
import com.lacv.jmagrexs.mapper.EntityMapperImpl;
import com.lacv.mercando.model.dtos.MainLocationDto;
import com.lacv.mercando.model.entities.MainLocation;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Component;

/**
 *
 * @author lcastrillo
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
    public List<MainLocationDto> listEntitiesToListDtos(List<MainLocation> entities){
        List<MainLocationDto> dtos= new ArrayList<>();
        if(entities!=null){
            for(MainLocation entity: entities){
                dtos.add(entityToDto(entity));
            }
        }
        return dtos;
    }
    
    @Override
    public MainLocation dtoToEntity(MainLocationDto dto) {
        MainLocation entity= new MainLocation();
        if(dto!=null){
            entity.setId(dto.getId());
            entity.setMlDescription(dto.getMlDescription());
            entity.setMlLocation(dto.getMlLocation());
            entity.setMlName(dto.getMlName());
        }
        return entity;
    }
    
    /**
     *
     * @return
     */
    @Override
    public List<MainLocation> listDtosToListEntities(List<MainLocationDto> dtos){
        List<MainLocation> entities= new ArrayList<>();
        if(entities!=null){
            for(MainLocationDto dto: dtos){
                entities.add(dtoToEntity(dto));
            }
        }
        return entities;
    }

}
