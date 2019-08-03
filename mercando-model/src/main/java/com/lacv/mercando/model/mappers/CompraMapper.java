/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.lacv.jmagrexs.mapper.EntityMapper;
import com.lacv.jmagrexs.mapper.EntityMapperImpl;
import com.lacv.mercando.model.dtos.CompraDto;
import com.lacv.mercando.model.entities.Compra;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author lcastrillo
 */
@Component("compraMapper")
public class CompraMapper extends EntityMapperImpl<Compra, CompraDto> implements EntityMapper<Compra, CompraDto> {
    
    @Autowired
    ProductMapper productMapper;
    
    @Autowired
    SubCategoryMapper subCategoryMapper;

    
    @Override
    public CompraDto entityToDto(Compra entity) {
        CompraDto dto= new CompraDto();
        if(entity!=null){
            dto.setCantidad(entity.getCantidad());
            dto.setFechaCompra(entity.getFechaCompra());
            dto.setFechaPago(entity.getFechaPago());
            dto.setFormaPago(entity.getFormaPago());
            dto.setId(entity.getId());
            dto.setIvaTotal(entity.getIvaTotal());
            dto.setIvaUnidad(entity.getIvaUnidad());
            dto.setNumFactura(entity.getNumFactura());
            dto.setPorcentajeIva(entity.getPorcentajeIva());
            dto.setProduct(productMapper.entityToDto(entity.getProduct()));
            dto.setSubCategory(subCategoryMapper.entityToDto(entity.getSubCategory()));
            dto.setSubtotal(entity.getSubtotal());
            dto.setSubtotalUnidad(entity.getSubtotalUnidad());
            dto.setValorTotal(entity.getValorTotal());
            dto.setValorUnitario(entity.getValorUnitario());
        }
        return dto;
    }
    
    /**
     *
     * @param entities
     * @return
     */
    @Override
    public List<CompraDto> listEntitiesToListDtos(List<Compra> entities){
        List<CompraDto> dtos= new ArrayList<>();
        if(entities!=null){
            for(Compra entity: entities){
                dtos.add(entityToDto(entity));
            }
        }
        return dtos;
    }
    
    @Override
    public Compra dtoToEntity(CompraDto dto) {
        Compra entity= new Compra();
        if(dto!=null){
            entity.setCantidad(dto.getCantidad());
            entity.setFechaCompra(dto.getFechaCompra());
            entity.setFechaPago(dto.getFechaPago());
            entity.setFormaPago(dto.getFormaPago());
            entity.setId(dto.getId());
            entity.setIvaTotal(dto.getIvaTotal());
            entity.setIvaUnidad(dto.getIvaUnidad());
            entity.setNumFactura(dto.getNumFactura());
            entity.setPorcentajeIva(dto.getPorcentajeIva());
            entity.setProduct(productMapper.dtoToEntity(dto.getProduct()));
            entity.setSubCategory(subCategoryMapper.dtoToEntity(dto.getSubCategory()));
            entity.setSubtotal(dto.getSubtotal());
            entity.setSubtotalUnidad(dto.getSubtotalUnidad());
            entity.setValorTotal(dto.getValorTotal());
            entity.setValorUnitario(dto.getValorUnitario());
        }
        return entity;
    }
    
    /**
     *
     * @return
     */
    @Override
    public List<Compra> listDtosToListEntities(List<CompraDto> dtos){
        List<Compra> entities= new ArrayList<>();
        if(entities!=null){
            for(CompraDto dto: dtos){
                entities.add(dtoToEntity(dto));
            }
        }
        return entities;
    }

}
