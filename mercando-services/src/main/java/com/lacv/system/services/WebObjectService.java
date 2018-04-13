/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.system.services;

import com.lacv.system.model.entities.WebObject;
import com.dot.gcpbasedot.service.EntityService;



/**
 *
 * @author lacastrillov
 */
public interface WebObjectService extends EntityService<WebObject> {
    
    WebObject findByPath(String path);
    
    WebObject createFolder(WebObject parentWebObject, String folderName);
    
    WebObject createEmptyFile(WebObject parentWebObject, String fileName);
    
    WebObject createDirectoriesIfMissing(String path);
    
    boolean deleteIfExist(WebObject parentWebObject, String fileName);
    
}
