/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.dot.gcpbasedot.mapper.EntityMapper;
import com.dot.gcpbasedot.mapper.EntityMapperImpl;
import com.lacv.mercando.model.dtos.WebResourceDto;
import com.lacv.mercando.model.entities.WebResource;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Component;

/**
 *
 * @author lcastrillo
 */
@Component("webResourceMapper")
public class WebResourceMapper extends EntityMapperImpl<WebResource, WebResourceDto> implements EntityMapper<WebResource, WebResourceDto> {

    
    @Override
    public WebResourceDto entityToDto(WebResource entity) {
        WebResourceDto dto= new WebResourceDto();
        if(entity!=null){
            dto.setId(entity.getId());
            dto.setIsPublic(entity.getIsPublic());
            dto.setName(entity.getName());
            dto.setPath(entity.getPath());
            dto.setType(entity.getType());
            dto.setCategory(entity.getCategory());
        }
        return dto;
    }
    
    /**
     *
     * @param entities
     * @return
     */
    @Override
    public List<WebResourceDto> listEntitiesToListDtos(List<WebResource> entities){
        List<WebResourceDto> dtos= new ArrayList<>();
        if(entities!=null){
            for(WebResource entity: entities){
                dtos.add(entityToDto(entity));
            }
        }
        return dtos;
    }
    
}
