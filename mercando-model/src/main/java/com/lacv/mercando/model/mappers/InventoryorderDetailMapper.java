/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.dot.gcpbasedot.domain.BaseEntity;
import com.dot.gcpbasedot.mapper.BasicEntityMapper;
import com.lacv.mercando.model.dtos.InventoryOrderDto;
import com.lacv.mercando.model.dtos.InventoryorderDetailDto;
import com.lacv.mercando.model.dtos.ProductDto;
import com.lacv.mercando.model.entities.InventoryorderDetail;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * @author nalvarez
 */
@Component("inventoryorderDetailMapper")
public class InventoryorderDetailMapper implements BasicEntityMapper {
    
    @Autowired
    InventoryOrderMapper inventoryOrderMapper;
    
    @Autowired
    ProductMapper productMapper;

    
    @Override
    public BaseEntity entityToDto(BaseEntity baseEntity) {
        InventoryorderDetail entity= (InventoryorderDetail) baseEntity;
        InventoryorderDetailDto dto= new InventoryorderDetailDto();
        if(entity!=null){
            dto.setId(entity.getId());
            dto.setInventoryOrder((InventoryOrderDto) inventoryOrderMapper.entityToDto(entity.getInventoryOrder()));
            dto.setProduct((ProductDto) productMapper.entityToDto(entity.getProduct()));
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
    public List<? extends BaseEntity> listEntitiesToListDtos(List <? extends BaseEntity> entities){
        ArrayList<InventoryorderDetailDto> dtos= new ArrayList<>();
        if(entities!=null){
            for(BaseEntity entity: entities){
                dtos.add((InventoryorderDetailDto) entityToDto(entity));
            }
        }
        return dtos;
    }
    
}
