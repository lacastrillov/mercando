/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.lacv.jmagrexs.mapper.EntityMapper;
import com.lacv.jmagrexs.mapper.EntityMapperImpl;
import com.lacv.jmagrexs.modules.security.mappers.UserMapper;
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
            dto.setId(entity.getId());
            dto.setNumber(entity.getNumber());
            dto.setRecordTime(entity.getRecordTime());
            dto.setRegistrationDate(entity.getRegistrationDate());
            dto.setDeliveryDate(entity.getDeliveryDate());
            dto.setStatus(entity.getStatus());
            dto.setSubTotal(entity.getSubTotal());
            dto.setDiscount(entity.getDiscount());
            dto.setIva(entity.getIva());
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
    
}
