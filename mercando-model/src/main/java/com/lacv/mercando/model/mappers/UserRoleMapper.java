/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.dot.gcpbasedot.domain.BaseEntity;
import com.dot.gcpbasedot.mapper.BasicEntityMapper;
import com.lacv.mercando.model.dtos.RoleDto;
import com.lacv.mercando.model.dtos.UserDto;
import com.lacv.mercando.model.dtos.UserRoleDto;
import com.lacv.mercando.model.entities.UserRole;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * @author nalvarez
 */
@Component("userRoleMapper")
public class UserRoleMapper implements BasicEntityMapper {

    @Autowired
    UserMapper userMapper;
    
    @Autowired
    RoleMapper roleMapper;
    
    @Override
    public BaseEntity entityToDto(BaseEntity baseEntity) {
        UserRole entity= (UserRole) baseEntity;
        UserRoleDto dto= new UserRoleDto();
        if(entity!=null){
            dto.setId(entity.getId());
            dto.setRole((RoleDto) roleMapper.entityToDto(entity.getRole()));
            dto.setUser((UserDto) userMapper.entityToDto(entity.getUser()));
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
        ArrayList<UserRoleDto> dtos= new ArrayList<>();
        if(entities!=null){
            for(BaseEntity entity: entities){
                dtos.add((UserRoleDto) entityToDto(entity));
            }
        }
        return dtos;
    }
    
}
