/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.system.model.mappers;

import com.dot.gcpbasedot.mapper.EntityMapper;
import com.dot.gcpbasedot.mapper.EntityMapperImpl;
import com.lacv.system.model.dtos.WebObjectDto;
import com.lacv.system.model.entities.WebObject;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Component;

/**
 *
 * @author lcastrillo
 */
@Component("webObjectMapper")
public class WebObjectMapper extends EntityMapperImpl<WebObject, WebObjectDto> implements EntityMapper<WebObject, WebObjectDto> {

    
    @Override
    public WebObjectDto entityToDto(WebObject entity) {
        WebObjectDto dto= new WebObjectDto();
        if(entity!=null){
            dto.setId(entity.getId());
            dto.setAuthor(entity.getAuthor());
            dto.setCreationDate(entity.getCreationDate());
            dto.setIcon(entity.getIcon());
            dto.setPath(entity.getPath());
            dto.setModificationDate(entity.getModificationDate());
            dto.setName(entity.getName());
            dto.setObjectId(entity.getObjectId());
            dto.setObjectOrder(entity.getObjectOrder());
            dto.setStatus(entity.getStatus());
            dto.setTypeClass(entity.getTypeClass());
            dto.setTypeName(entity.getTypeName());
            dto.setWebObject((WebObjectDto) entityToDto(entity.getWebObject()));
        }
        return dto;
    }
    
    /**
     *
     * @param entities
     * @return
     */
    @Override
    public List<WebObjectDto> listEntitiesToListDtos(List<WebObject> entities){
        List<WebObjectDto> dtos= new ArrayList<>();
        if(entities!=null){
            for(WebObject entity: entities){
                dtos.add(entityToDto(entity));
            }
        }
        return dtos;
    }
    
}
