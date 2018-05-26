/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.lacv.jmagrexs.mapper.EntityMapper;
import com.lacv.jmagrexs.mapper.EntityMapperImpl;
import com.lacv.mercando.model.dtos.InventoryorderDetailDto;
import com.lacv.mercando.model.entities.InventoryorderDetail;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * @author lcastrillo
 */
@Component("inventoryorderDetailMapper")
public class InventoryorderDetailMapper extends EntityMapperImpl<InventoryorderDetail, InventoryorderDetailDto> implements EntityMapper<InventoryorderDetail, InventoryorderDetailDto> {
    
    @Autowired
    InventoryOrderMapper inventoryOrderMapper;
    
    @Autowired
    ProductMapper productMapper;

    
    @Override
    public InventoryorderDetailDto entityToDto(InventoryorderDetail entity) {
        InventoryorderDetailDto dto= new InventoryorderDetailDto();
        if(entity!=null){
            dto.setId(entity.getId());
            dto.setInventoryOrder(inventoryOrderMapper.entityToDto(entity.getInventoryOrder()));
            dto.setProduct(productMapper.entityToDto(entity.getProduct()));
            dto.setQuantity(entity.getQuantity());
            dto.setUnitPrice(entity.getUnitPrice());
        }
        return dto;
    }
    
    /**
     *
     * @param entities
     * @return
     */
    @Override
    public List<InventoryorderDetailDto> listEntitiesToListDtos(List<InventoryorderDetail> entities){
        List<InventoryorderDetailDto> dtos= new ArrayList<>();
        if(entities!=null){
            for(InventoryorderDetail entity: entities){
                dtos.add(entityToDto(entity));
            }
        }
        return dtos;
    }
    
    @Override
    public InventoryorderDetail dtoToEntity(InventoryorderDetailDto dto) {
        InventoryorderDetail entity= new InventoryorderDetail();
        if(dto!=null){
            entity.setId(dto.getId());
            entity.setInventoryOrder(inventoryOrderMapper.dtoToEntity(dto.getInventoryOrder()));
            entity.setProduct(productMapper.dtoToEntity(dto.getProduct()));
            entity.setQuantity(dto.getQuantity());
            entity.setUnitPrice(dto.getUnitPrice());
        }
        return entity;
    }
    
    /**
     *
     * @return
     */
    @Override
    public List<InventoryorderDetail> listDtosToListEntities(List<InventoryorderDetailDto> dtos){
        List<InventoryorderDetail> entities= new ArrayList<>();
        if(entities!=null){
            for(InventoryorderDetailDto dto: dtos){
                entities.add(dtoToEntity(dto));
            }
        }
        return entities;
    }

}
