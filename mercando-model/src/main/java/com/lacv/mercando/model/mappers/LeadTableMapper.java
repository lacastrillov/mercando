/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.dot.gcpbasedot.mapper.EntityMapper;
import com.dot.gcpbasedot.mapper.EntityMapperImpl;
import com.lacv.mercando.model.dtos.LeadTableDto;
import com.lacv.mercando.model.entities.LeadTable;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Component;

/**
 *
 * @author lcastrillo
 */
@Component("leadTableMapper")
public class LeadTableMapper extends EntityMapperImpl<LeadTable, LeadTableDto> implements EntityMapper<LeadTable, LeadTableDto> {

    
    @Override
    public LeadTableDto entityToDto(LeadTable entity) {
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
    public List<LeadTableDto> listEntitiesToListDtos(List <LeadTable> entities){
        List<LeadTableDto> dtos= new ArrayList<>();
        if(entities!=null){
            for(LeadTable entity: entities){
                dtos.add(entityToDto(entity));
            }
        }
        return dtos;
    }
    
}
