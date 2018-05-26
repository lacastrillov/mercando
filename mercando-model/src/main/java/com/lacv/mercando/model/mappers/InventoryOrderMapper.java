/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.lacv.jmagrexs.mapper.EntityMapper;
import com.lacv.jmagrexs.mapper.EntityMapperImpl;
import com.lacv.jmagrexs.modules.security.model.mappers.UserMapper;
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
    
    @Override
    public InventoryOrder dtoToEntity(InventoryOrderDto dto) {
        InventoryOrder entity= new InventoryOrder();
        if(dto!=null){
            entity.setId(dto.getId());
            entity.setNumber(dto.getNumber());
            entity.setRecordTime(dto.getRecordTime());
            entity.setRegistrationDate(dto.getRegistrationDate());
            entity.setStatus(dto.getStatus());
            entity.setSupplier(supplierMapper.dtoToEntity(dto.getSupplier()));
            entity.setTotal(dto.getTotal());
            entity.setUser(userMapper.dtoToEntity(dto.getUser()));
        }
        return entity;
    }
    
    /**
     *
     * @return
     */
    @Override
    public List<InventoryOrder> listDtosToListEntities(List<InventoryOrderDto> dtos){
        List<InventoryOrder> entities= new ArrayList<>();
        if(entities!=null){
            for(InventoryOrderDto dto: dtos){
                entities.add(dtoToEntity(dto));
            }
        }
        return entities;
    }

}
