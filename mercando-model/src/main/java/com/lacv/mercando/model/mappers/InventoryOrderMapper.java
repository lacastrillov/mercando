/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.lacv.system.model.mappers.UserMapper;
import com.dot.gcpbasedot.mapper.EntityMapper;
import com.dot.gcpbasedot.mapper.EntityMapperImpl;
import com.lacv.mercando.model.dtos.InventoryOrderDto;
import com.lacv.mercando.model.entities.InventoryOrder;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * @author lcastrillo
 */
@Component("inventoryOrderMapper")
public class InventoryOrderMapper extends EntityMapperImpl<InventoryOrder, InventoryOrderDto> implements EntityMapper<InventoryOrder, InventoryOrderDto> {
    
    @Autowired
    SupplierMapper supplierMapper;
    
    @Autowired
    UserMapper userMapper;

    
    @Override
    public InventoryOrderDto entityToDto(InventoryOrder entity) {
        InventoryOrderDto dto= new InventoryOrderDto();
        if(entity!=null){
            dto.setId(entity.getId());
            dto.setNumber(entity.getNumber());
            dto.setRecordTime(entity.getRecordTime());
            dto.setRegistrationDate(entity.getRegistrationDate());
            dto.setStatus(entity.getStatus());
            dto.setSupplier(supplierMapper.entityToDto(entity.getSupplier()));
            dto.setTotal(entity.getTotal());
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
    public List<InventoryOrderDto> listEntitiesToListDtos(List<InventoryOrder> entities){
        List<InventoryOrderDto> dtos= new ArrayList<>();
        if(entities!=null){
            for(InventoryOrder entity: entities){
                dtos.add(entityToDto(entity));
            }
        }
        return dtos;
    }
    
}
