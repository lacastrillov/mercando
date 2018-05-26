/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.lacv.jmagrexs.mapper.EntityMapper;
import com.lacv.jmagrexs.mapper.EntityMapperImpl;
import com.lacv.jmagrexs.modules.security.model.mappers.UserMapper;
import com.lacv.mercando.model.dtos.PurchaseOrderDto;
import com.lacv.mercando.model.entities.PurchaseOrder;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * @author lcastrillo
 */
@Component("purchaseOrderMapper")
public class PurchaseOrderMapper extends EntityMapperImpl<PurchaseOrder, PurchaseOrderDto> implements EntityMapper<PurchaseOrder, PurchaseOrderDto> {
    
    @Autowired
    UserMapper userMapper;

    
    @Override
    public PurchaseOrderDto entityToDto(PurchaseOrder entity) {
        PurchaseOrderDto dto= new PurchaseOrderDto();
        if(entity!=null){
            dto.setDeliveryDate(entity.getDeliveryDate());
            dto.setDiscount(entity.getDiscount());
            dto.setId(entity.getId());
            dto.setIva(entity.getIva());
            dto.setNumber(entity.getNumber());
            dto.setRecordTime(entity.getRecordTime());
            dto.setRegistrationDate(entity.getRegistrationDate());
            dto.setStatus(entity.getStatus());
            dto.setSubTotal(entity.getSubTotal());
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
    public List<PurchaseOrderDto> listEntitiesToListDtos(List<PurchaseOrder> entities){
        List<PurchaseOrderDto> dtos= new ArrayList<>();
        if(entities!=null){
            for(PurchaseOrder entity: entities){
                dtos.add(entityToDto(entity));
            }
        }
        return dtos;
    }
    
    @Override
    public PurchaseOrder dtoToEntity(PurchaseOrderDto dto) {
        PurchaseOrder entity= new PurchaseOrder();
        if(dto!=null){
            entity.setDeliveryDate(dto.getDeliveryDate());
            entity.setDiscount(dto.getDiscount());
            entity.setId(dto.getId());
            entity.setIva(dto.getIva());
            entity.setNumber(dto.getNumber());
            entity.setRecordTime(dto.getRecordTime());
            entity.setRegistrationDate(dto.getRegistrationDate());
            entity.setStatus(dto.getStatus());
            entity.setSubTotal(dto.getSubTotal());
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
    public List<PurchaseOrder> listDtosToListEntities(List<PurchaseOrderDto> dtos){
        List<PurchaseOrder> entities= new ArrayList<>();
        if(entities!=null){
            for(PurchaseOrderDto dto: dtos){
                entities.add(dtoToEntity(dto));
            }
        }
        return entities;
    }

}
