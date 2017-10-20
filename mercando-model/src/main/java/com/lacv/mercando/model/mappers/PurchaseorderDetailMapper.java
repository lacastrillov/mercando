/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.dot.gcpbasedot.mapper.EntityMapper;
import com.dot.gcpbasedot.mapper.EntityMapperImpl;
import com.lacv.mercando.model.dtos.PurchaseorderDetailDto;
import com.lacv.mercando.model.entities.PurchaseorderDetail;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * @author nalvarez
 */
@Component("purchaseorderDetailMapper")
public class PurchaseorderDetailMapper extends EntityMapperImpl<PurchaseorderDetail, PurchaseorderDetailDto> implements EntityMapper<PurchaseorderDetail, PurchaseorderDetailDto> {
    
    @Autowired
    ProductMapper productMapper;
    
    @Autowired
    PurchaseOrderMapper purchaseOrderMapper;

    
    @Override
    public PurchaseorderDetailDto entityToDto(PurchaseorderDetail entity) {
        PurchaseorderDetailDto dto= new PurchaseorderDetailDto();
        if(entity!=null){
            dto.setId(entity.getId());
            dto.setProduct(productMapper.entityToDto(entity.getProduct()));
            dto.setPurchaseOrder(purchaseOrderMapper.entityToDto(entity.getPurchaseOrder()));
            dto.setQuantity(entity.getQuantity());
            dto.setUnitPrice(entity.getUnitPrice());
            dto.setSubTotal(entity.getSubTotal());
            dto.setDiscount(entity.getDiscount());
            dto.setIva(entity.getIva());
            dto.setTotal(entity.getTotal());
        }
        return dto;
    }
    
    /**
     *
     * @param entities
     * @return
     */
    @Override
    public List<PurchaseorderDetailDto> listEntitiesToListDtos(List<PurchaseorderDetail> entities){
        List<PurchaseorderDetailDto> dtos= new ArrayList<>();
        if(entities!=null){
            for(PurchaseorderDetail entity: entities){
                dtos.add(entityToDto(entity));
            }
        }
        return dtos;
    }
    
}
