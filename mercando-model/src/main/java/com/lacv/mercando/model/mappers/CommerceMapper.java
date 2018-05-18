/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.lacv.jmagrexs.mapper.EntityMapper;
import com.lacv.jmagrexs.mapper.EntityMapperImpl;
import com.lacv.jmagrexs.modules.security.mappers.UserMapper;
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
    public CommerceDto entityToDto(Commerce baseEntity) {
        Commerce entity= (Commerce) baseEntity;
        CommerceDto dto= new CommerceDto();
        if(entity!=null){
            dto.setId(entity.getId());
            dto.setCommerceDescription(entity.getCommerceDescription());
            dto.setCommerceImage(entity.getCommerceImage());
            dto.setCommerceName(entity.getCommerceName());
            dto.setCommerceTag(entity.getCommerceTag());
            dto.setCreationDate(entity.getCreationDate());
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
                dtos.add((CommerceDto) entityToDto(entity));
            }
        }
        return dtos;
    }
    
}
