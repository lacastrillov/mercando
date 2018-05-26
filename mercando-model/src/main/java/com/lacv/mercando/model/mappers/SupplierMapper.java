/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.lacv.jmagrexs.mapper.EntityMapper;
import com.lacv.jmagrexs.mapper.EntityMapperImpl;
import com.lacv.jmagrexs.modules.security.model.mappers.UserMapper;
import com.lacv.mercando.model.dtos.SupplierDto;
import com.lacv.mercando.model.entities.Supplier;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * @author lcastrillo
 */
@Component("supplierMapper")
public class SupplierMapper extends EntityMapperImpl<Supplier, SupplierDto> implements EntityMapper<Supplier, SupplierDto> {
    
    @Autowired
    UserMapper userMapper;

    
    @Override
    public SupplierDto entityToDto(Supplier entity) {
        SupplierDto dto= new SupplierDto();
        if(entity!=null){
            dto.setAddress(entity.getAddress());
            dto.setCity(entity.getCity());
            dto.setCompanyName(entity.getCompanyName());
            dto.setContactName(entity.getContactName());
            dto.setContactTitle(entity.getContactTitle());
            dto.setCountry(entity.getCountry());
            dto.setId(entity.getId());
            dto.setMail(entity.getMail());
            dto.setPhoneMobile(entity.getPhoneMobile());
            dto.setPhoneOffice(entity.getPhoneOffice());
            dto.setRegion(entity.getRegion());
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
    public List<SupplierDto> listEntitiesToListDtos(List<Supplier> entities){
        List<SupplierDto> dtos= new ArrayList<>();
        if(entities!=null){
            for(Supplier entity: entities){
                dtos.add(entityToDto(entity));
            }
        }
        return dtos;
    }
    
    @Override
    public Supplier dtoToEntity(SupplierDto dto) {
        Supplier entity= new Supplier();
        if(dto!=null){
            entity.setAddress(dto.getAddress());
            entity.setCity(dto.getCity());
            entity.setCompanyName(dto.getCompanyName());
            entity.setContactName(dto.getContactName());
            entity.setContactTitle(dto.getContactTitle());
            entity.setCountry(dto.getCountry());
            entity.setId(dto.getId());
            entity.setMail(dto.getMail());
            entity.setPhoneMobile(dto.getPhoneMobile());
            entity.setPhoneOffice(dto.getPhoneOffice());
            entity.setRegion(dto.getRegion());
            entity.setUser(userMapper.dtoToEntity(dto.getUser()));
        }
        return entity;
    }
    
    /**
     *
     * @return
     */
    @Override
    public List<Supplier> listDtosToListEntities(List<SupplierDto> dtos){
        List<Supplier> entities= new ArrayList<>();
        if(entities!=null){
            for(SupplierDto dto: dtos){
                entities.add(dtoToEntity(dto));
            }
        }
        return entities;
    }

}
