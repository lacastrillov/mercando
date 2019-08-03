/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.lacv.jmagrexs.mapper.EntityMapper;
import com.lacv.jmagrexs.mapper.EntityMapperImpl;
import com.lacv.mercando.model.dtos.VentaDto;
import com.lacv.mercando.model.entities.Venta;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author lcastrillo
 */
@Component("ventaMapper")
public class VentaMapper extends EntityMapperImpl<Venta, VentaDto> implements EntityMapper<Venta, VentaDto> {
    
    @Autowired
    ProductMapper productMapper;
    
    @Autowired
    SubCategoryMapper subCategoryMapper;

    
    @Override
    public VentaDto entityToDto(Venta entity) {
        VentaDto dto= new VentaDto();
        if(entity!=null){
            dto.setCantidad(entity.getCantidad());
            dto.setFechaPago(entity.getFechaPago());
            dto.setFechaVenta(entity.getFechaVenta());
            dto.setFormaPago(entity.getFormaPago());
            dto.setId(entity.getId());
            dto.setIvaTotal(entity.getIvaTotal());
            dto.setIvaUnidad(entity.getIvaUnidad());
            dto.setNumPedido(entity.getNumPedido());
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
    public List<VentaDto> listEntitiesToListDtos(List<Venta> entities){
        List<VentaDto> dtos= new ArrayList<>();
        if(entities!=null){
            for(Venta entity: entities){
                dtos.add(entityToDto(entity));
            }
        }
        return dtos;
    }
    
    @Override
    public Venta dtoToEntity(VentaDto dto) {
        Venta entity= new Venta();
        if(dto!=null){
            entity.setCantidad(dto.getCantidad());
            entity.setFechaPago(dto.getFechaPago());
            entity.setFechaVenta(dto.getFechaVenta());
            entity.setFormaPago(dto.getFormaPago());
            entity.setId(dto.getId());
            entity.setIvaTotal(dto.getIvaTotal());
            entity.setIvaUnidad(dto.getIvaUnidad());
            entity.setNumPedido(dto.getNumPedido());
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
    public List<Venta> listDtosToListEntities(List<VentaDto> dtos){
        List<Venta> entities= new ArrayList<>();
        if(entities!=null){
            for(VentaDto dto: dtos){
                entities.add(dtoToEntity(dto));
            }
        }
        return entities;
    }

}
