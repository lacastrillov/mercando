/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.system.services;

import com.dot.gcpbasedot.dao.Parameters;
import com.lacv.system.model.entities.WebEntity;
import com.dot.gcpbasedot.service.EntityService;
import java.util.List;



/**
 *
 * @author lacastrillov
 */
public interface WebEntityService extends EntityService<WebEntity> {
    
    List<Object> findEntities(String path, Class type);
    
    List<Object> findEntities(String path, String status, Class type);
    
    List<Object> findEntities(Parameters p, Class type);
    
    Object loadEntity(String path, Class type);
    
    Object loadEntity(WebEntity webEntity, Class type);
    
    WebEntity findByPath(String path);
    
    WebEntity createFolder(WebEntity parentWebEntity, String folderName);
    
    WebEntity create(WebEntity parentWebEntity, String name, String entityRef, String entityName);
    
    WebEntity createDirectoriesIfMissing(String path);
    
    boolean deleteIfExist(WebEntity parentWebEntity, String fileName);
    
}
