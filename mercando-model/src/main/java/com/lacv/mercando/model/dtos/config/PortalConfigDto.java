/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.dtos.config;

import com.dot.gcpbasedot.annotation.Order;
import com.dot.gcpbasedot.annotation.TextField;
import com.dot.gcpbasedot.annotation.TypeFormField;
import com.dot.gcpbasedot.enums.FieldType;
import java.util.List;

/**
 *
 * @author lacastrillov
 */
public class PortalConfigDto {
    
    @Order(1)
    @TextField("Nombre")
    private String name;
    
    @Order(2)
    @TextField("Lenguaje")
    private String language;
    
    @Order(3)
    @TextField("Banner")
    @TypeFormField(FieldType.IMAGE_FILE_UPLOAD)
    private String banner;
    
    @TextField("Ubicaciones")
    private List<String> locations;

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the language
     */
    public String getLanguage() {
        return language;
    }

    /**
     * @param language the language to set
     */
    public void setLanguage(String language) {
        this.language = language;
    }

    /**
     * 
     * @return the banner
     */
    public String getBanner() {
        return banner;
    }

    /**
     * 
     * @param banner 
     */
    public void setBanner(String banner) {
        this.banner = banner;
    }

    /**
     * @return the locations
     */
    public List<String> getLocations() {
        return locations;
    }

    /**
     * @param locations the locations to set
     */
    public void setLocations(List<String> locations) {
        this.locations = locations;
    }
    
}
