/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.dot.gcpbasedot.mapper.EntityMapper;
import com.dot.gcpbasedot.mapper.EntityMapperImpl;
import com.lacv.mercando.model.dtos.PaymentDto;
import com.lacv.mercando.model.entities.Payment;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * @author nalvarez
 */
@Component("paymentMapper")
public class PaymentMapper extends EntityMapperImpl<Payment, PaymentDto> implements EntityMapper<Payment, PaymentDto> {
    
    @Autowired
    InventoryOrderMapper inventoryOrderMapper;
    
    @Autowired
    PurchaseOrderMapper purchaseOrderMapper;
    
    @Autowired
    UserMapper userMapper;

    
    @Override
    public PaymentDto entityToDto(Payment entity) {
        PaymentDto dto= new PaymentDto();
        if(entity!=null){
            dto.setId(entity.getId());
            dto.setAmount(entity.getAmount());
            dto.setInventoryOrder(inventoryOrderMapper.entityToDto(entity.getInventoryOrder()));
            dto.setPaymentDate(entity.getPaymentDate());
            dto.setPaymentMethod(entity.getPaymentMethod());
            dto.setPaymentResult(entity.getPaymentResult());
            dto.setPurchaseOrder(purchaseOrderMapper.entityToDto(entity.getPurchaseOrder()));
            dto.setReferenceNumber(entity.getReferenceNumber());
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
    public List<PaymentDto> listEntitiesToListDtos(List<Payment> entities){
        List<PaymentDto> dtos= new ArrayList<>();
        if(entities!=null){
            for(Payment entity: entities){
                dtos.add(entityToDto(entity));
            }
        }
        return dtos;
    }
    
}
