/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.lacv.jmagrexs.mapper.EntityMapper;
import com.lacv.jmagrexs.mapper.EntityMapperImpl;
import com.lacv.mercando.model.dtos.PurchaseorderDetailDto;
import com.lacv.mercando.model.entities.PurchaseorderDetail;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * @author lcastrillo
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
            dto.setDiscount(entity.getDiscount());
            dto.setId(entity.getId());
            dto.setIva(entity.getIva());
            dto.setProduct(productMapper.entityToDto(entity.getProduct()));
            dto.setPurchaseOrder(purchaseOrderMapper.entityToDto(entity.getPurchaseOrder()));
            dto.setQuantity(entity.getQuantity());
            dto.setSubTotal(entity.getSubTotal());
            dto.setTotal(entity.getTotal());
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
    public List<PurchaseorderDetailDto> listEntitiesToListDtos(List<PurchaseorderDetail> entities){
        List<PurchaseorderDetailDto> dtos= new ArrayList<>();
        if(entities!=null){
            for(PurchaseorderDetail entity: entities){
                dtos.add(entityToDto(entity));
            }
        }
        return dtos;
    }
    
    @Override
    public PurchaseorderDetail dtoToEntity(PurchaseorderDetailDto dto) {
        PurchaseorderDetail entity= new PurchaseorderDetail();
        if(dto!=null){
            entity.setDiscount(dto.getDiscount());
            entity.setId(dto.getId());
            entity.setIva(dto.getIva());
            entity.setProduct(productMapper.dtoToEntity(dto.getProduct()));
            entity.setPurchaseOrder(purchaseOrderMapper.dtoToEntity(dto.getPurchaseOrder()));
            entity.setQuantity(dto.getQuantity());
            entity.setSubTotal(dto.getSubTotal());
            entity.setTotal(dto.getTotal());
            entity.setUnitPrice(dto.getUnitPrice());
        }
        return entity;
    }
    
    /**
     *
     * @return
     */
    @Override
    public List<PurchaseorderDetail> listDtosToListEntities(List<PurchaseorderDetailDto> dtos){
        List<PurchaseorderDetail> entities= new ArrayList<>();
        if(entities!=null){
            for(PurchaseorderDetailDto dto: dtos){
                entities.add(dtoToEntity(dto));
            }
        }
        return entities;
    }

}
