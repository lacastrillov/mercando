/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.dot.gcpbasedot.domain.BaseEntity;
import com.dot.gcpbasedot.mapper.BasicEntityMapper;
import com.lacv.mercando.model.dtos.AuthorizationDto;
import com.lacv.mercando.model.dtos.RoleAuthorizationDto;
import com.lacv.mercando.model.dtos.RoleDto;
import com.lacv.mercando.model.entities.RoleAuthorization;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * @author nalvarez
 */
@Component("roleAuthorizationMapper")
public class RoleAuthorizationMapper implements BasicEntityMapper {

    @Autowired
    AuthorizationMapper authorizationMapper;
    
    @Autowired
    RoleMapper roleMapper;
    
    
    @Override
    public BaseEntity entityToDto(BaseEntity baseEntity) {
        RoleAuthorization entity= (RoleAuthorization) baseEntity;
        RoleAuthorizationDto dto= new RoleAuthorizationDto();
        if(entity!=null){
            dto.setId(entity.getId());
            dto.setAuthorization((AuthorizationDto) authorizationMapper.entityToDto(entity.getAuthorization()));
            dto.setRole((RoleDto) roleMapper.entityToDto(entity.getRole()));
        }
        return dto;
    }
    
    /**
     *
     * @param entities
     * @return
     */
    @Override
    public List<? extends BaseEntity> listEntitiesToListDtos(List <? extends BaseEntity> entities){
        ArrayList<RoleAuthorizationDto> dtos= new ArrayList<>();
        if(entities!=null){
            for(BaseEntity entity: entities){
                dtos.add((RoleAuthorizationDto) entityToDto(entity));
            }
        }
        return dtos;
    }
    
}
