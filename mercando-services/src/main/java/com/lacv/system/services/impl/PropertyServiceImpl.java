/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.system.services.impl;


import com.lacv.system.daos.PropertyJpa;
import com.lacv.system.model.entities.Property;
import com.lacv.system.model.mappers.PropertyMapper;
import com.lacv.system.services.PropertyService;
import com.dot.gcpbasedot.dao.GenericDao;
import com.dot.gcpbasedot.service.EntityServiceImpl1;
import com.dot.gcpbasedot.util.Formats;
import java.math.BigInteger;
import java.sql.Time;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lcastrillo
 */
@Service("propertyService")
public class PropertyServiceImpl extends EntityServiceImpl1<Property> implements PropertyService {
    
    @Autowired
    public PropertyJpa propertyJpa;
    
    @Autowired
    public PropertyMapper propertyMapper;
    
    @Override
    public GenericDao getGenericDao(){
        return propertyJpa;
    }
    
    @Override
    public String getString(String propertyName){
        Property property= super.loadByParameter("key", propertyName);
        if(property!=null && property.getStatus().equals("Activa")){
            return property.getValue();
        }else{
            return null;
        }
    }
    
    @Override
    public Character getCharacter(String propertyName){
        String value= getString(propertyName);
        if(value!=null){
            return value.charAt(0);
        }else{
            return null;
        }
    }
    
    @Override
    public Integer getInteger(String propertyName){
        String value= getString(propertyName);
        if(value!=null){
            return new Integer(value);
        }else{
            return null;
        }
    }
    
    @Override
    public Long getLong(String propertyName){
        String value= getString(propertyName);
        if(value!=null){
            return new Long(value);
        }else{
            return null;
        }
    }
    
    @Override
    public Double getDouble(String propertyName){
        String value= getString(propertyName);
        if(value!=null){
            return new Double(value);
        }else{
            return null;
        }
    }
    
    @Override
    public Float getFloat(String propertyName){
        String value= getString(propertyName);
        if(value!=null){
            return new Float(value);
        }else{
            return null;
        }
    }
    
    @Override
    public BigInteger getBigInteger(String propertyName){
        String value= getString(propertyName);
        if(value!=null){
            return new BigInteger(value);
        }else{
            return null;
        }
    }
    
    @Override
    public Boolean getBoolean(String propertyName){
        String value= getString(propertyName);
        if(value!=null){
            return Formats.stringToBoolean(value);
        }else{
            return null;
        }
    }
    
    @Override
    public Date getDate(String propertyName){
        String value= getString(propertyName);
        if(value!=null){
            return Formats.stringToDate(value);
        }else{
            return null;
        }
    }
    
    @Override
    public Time getTime(String propertyName){
        String value= getString(propertyName);
        if(value!=null){
            return Formats.stringToTime(value);
        }else{
            return null;
        }
    }
    
}
