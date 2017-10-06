/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.dot.gcpbasedot.domain.BaseEntity;
import com.dot.gcpbasedot.mapper.BasicEntityMapper;
import com.lacv.mercando.model.dtos.LeadTableDto;
import com.lacv.mercando.model.entities.LeadTable;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Component;

/**
 *
 * @author nalvarez
 */
@Component("leadTableMapper")
public class LeadTableMapper implements BasicEntityMapper {

    
    @Override
    public BaseEntity entityToDto(BaseEntity baseEntity) {
        LeadTable entity= (LeadTable) baseEntity;
        LeadTableDto dto= new LeadTableDto();
        if(entity!=null){
            dto.setId(entity.getId());
            dto.setDescription(entity.getDescription());
            dto.setName(entity.getName());
            dto.setStatus(entity.getStatus());
            dto.setTableAlias(entity.getTableAlias());
            dto.setFileUpload(entity.getFileUpload());
            dto.setLink(entity.getLink());
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
        ArrayList<LeadTableDto> dtos= new ArrayList<>();
        if(entities!=null){
            for(BaseEntity entity: entities){
                dtos.add((LeadTableDto) entityToDto(entity));
            }
        }
        return dtos;
    }
    
}
