/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.mappers;

import com.dot.gcpbasedot.domain.BaseEntity;
import com.dot.gcpbasedot.mapper.BasicEntityMapper;
import com.lacv.mercando.model.dtos.UserDto;
import com.lacv.mercando.model.entities.User;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Component;

/**
 *
 * @author nalvarez
 */
@Component("userMapper")
public class UserMapper implements BasicEntityMapper {

    
    @Override
    public BaseEntity entityToDto(BaseEntity baseEntity) {
        User entity= (User) baseEntity;
        UserDto dto= new UserDto();
        if(entity!=null){
            dto.setId(entity.getId());
            dto.setEmail(entity.getEmail());
            dto.setGender(entity.getGender());
            dto.setLink(entity.getLink());
            dto.setFirstName(entity.getFirstName());
            dto.setLastName(entity.getLastName());
            dto.setIdDocument(entity.getIdDocument());
            dto.setDocumentType(entity.getDocumentType());
            dto.setPhone(entity.getPhone());
            dto.setCell(entity.getCell());
            dto.setAddress(entity.getAddress());
            dto.setCity(entity.getCity());
            dto.setUsername(entity.getUsername());
            dto.setPassword(entity.getPassword());
            dto.setPasswordExpiration(entity.getPasswordExpiration());
            dto.setRegistrationDate(entity.getRegistrationDate());
            dto.setStatus(entity.getStatus());
            dto.setFailedAttempts(entity.getFailedAttempts());
            dto.setLastLogin(entity.getLastLogin());
            dto.setUrlPhoto(entity.getUrlPhoto());
            dto.setBirthday(entity.getBirthday());
            dto.setTokenUser(entity.getTokenUser());
            dto.setVerified(entity.getVerified());
        }
        return dto;
    }
    
    /**
     *
     * @param entities
     * @return
     */
    @Override
    public List<? extends BaseEntity> listEntitiesToListDtos(List <? extends BaseEntity> entities){
        ArrayList<UserDto> dtos= new ArrayList<>();
        if(entities!=null){
            for(BaseEntity entity: entities){
                dtos.add((UserDto) entityToDto(entity));
            }
        }
        return dtos;
    }
    
}
