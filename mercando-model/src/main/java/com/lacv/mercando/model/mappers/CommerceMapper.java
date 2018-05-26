/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.lacv.jmagrexs.mapper.EntityMapper;
import com.lacv.jmagrexs.mapper.EntityMapperImpl;
import com.lacv.jmagrexs.modules.security.model.mappers.UserMapper;
import com.lacv.mercando.model.dtos.CommerceDto;
import com.lacv.mercando.model.entities.Commerce;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * @author lcastrillo
 */
@Component("commerceMapper")
public class CommerceMapper extends EntityMapperImpl<Commerce, CommerceDto> implements EntityMapper<Commerce, CommerceDto> {
    
    @Autowired
    MainLocationMapper mainLocationMapper;
    
    @Autowired
    UserMapper userMapper;

    
    @Override
    public CommerceDto entityToDto(Commerce entity) {
        CommerceDto dto= new CommerceDto();
        if(entity!=null){
            dto.setCommerceDescription(entity.getCommerceDescription());
            dto.setCommerceImage(entity.getCommerceImage());
            dto.setCommerceName(entity.getCommerceName());
            dto.setCommerceTag(entity.getCommerceTag());
            dto.setCreationDate(entity.getCreationDate());
            dto.setId(entity.getId());
            dto.setMainLocation(mainLocationMapper.entityToDto(entity.getMainLocation()));
            dto.setUser(userMapper.entityToDto(entity.getUser()));
        }
        return dto;
    }
    
    /**
     *
     * @param entities
     * @return
     */
    @Override
    public List<CommerceDto> listEntitiesToListDtos(List<Commerce> entities){
        List<CommerceDto> dtos= new ArrayList<>();
        if(entities!=null){
            for(Commerce entity: entities){
                dtos.add(entityToDto(entity));
            }
        }
        return dtos;
    }
    
    @Override
    public Commerce dtoToEntity(CommerceDto dto) {
        Commerce entity= new Commerce();
        if(dto!=null){
            entity.setCommerceDescription(dto.getCommerceDescription());
            entity.setCommerceImage(dto.getCommerceImage());
            entity.setCommerceName(dto.getCommerceName());
            entity.setCommerceTag(dto.getCommerceTag());
            entity.setCreationDate(dto.getCreationDate());
            entity.setId(dto.getId());
            entity.setMainLocation(mainLocationMapper.dtoToEntity(dto.getMainLocation()));
            entity.setUser(userMapper.dtoToEntity(dto.getUser()));
        }
        return entity;
    }
    
    /**
     *
     * @return
     */
    @Override
    public List<Commerce> listDtosToListEntities(List<CommerceDto> dtos){
        List<Commerce> entities= new ArrayList<>();
        if(entities!=null){
            for(CommerceDto dto: dtos){
                entities.add(dtoToEntity(dto));
            }
        }
        return entities;
    }

}
