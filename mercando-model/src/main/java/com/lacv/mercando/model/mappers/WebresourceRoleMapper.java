/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.dot.gcpbasedot.mapper.EntityMapper;
import com.dot.gcpbasedot.mapper.EntityMapperImpl;
import com.lacv.mercando.model.dtos.WebresourceRoleDto;
import com.lacv.mercando.model.entities.WebresourceRole;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * @author lcastrillo
 */
@Component("webresourceRoleMapper")
public class WebresourceRoleMapper extends EntityMapperImpl<WebresourceRole, WebresourceRoleDto> implements EntityMapper<WebresourceRole, WebresourceRoleDto> {
    
    @Autowired
    RoleMapper roleMapper;
    
    @Autowired
    WebResourceMapper webResourceMapper;

    
    @Override
    public WebresourceRoleDto entityToDto(WebresourceRole entity) {
        WebresourceRoleDto dto= new WebresourceRoleDto();
        if(entity!=null){
            dto.setId(entity.getId());
            dto.setRole(roleMapper.entityToDto(entity.getRole()));
            dto.setWebResource(webResourceMapper.entityToDto(entity.getWebResource()));
        }
        return dto;
    }
    
    /**
     *
     * @param entities
     * @return
     */
    @Override
    public List<WebresourceRoleDto> listEntitiesToListDtos(List<WebresourceRole> entities){
        List<WebresourceRoleDto> dtos= new ArrayList<>();
        if(entities!=null){
            for(WebresourceRole entity: entities){
                dtos.add(entityToDto(entity));
            }
        }
        return dtos;
    }
    
}
