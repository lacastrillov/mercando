/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.lacv.system.model.mappers.UserMapper;
import com.dot.gcpbasedot.mapper.EntityMapper;
import com.dot.gcpbasedot.mapper.EntityMapperImpl;
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
            dto.setId(entity.getId());
            dto.setAddress(entity.getAddress());
            dto.setCity(entity.getCity());
            dto.setCompanyName(entity.getCompanyName());
            dto.setContactName(entity.getContactName());
            dto.setContactTitle(entity.getContactTitle());
            dto.setCountry(entity.getCountry());
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
    
}
