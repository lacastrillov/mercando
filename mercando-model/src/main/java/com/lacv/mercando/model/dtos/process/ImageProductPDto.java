/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.dtos.process;

import com.dot.gcpbasedot.annotation.Order;
import com.dot.gcpbasedot.annotation.TextField;
import com.dot.gcpbasedot.annotation.TypeFormField;
import com.dot.gcpbasedot.enums.FieldType;

/**
 *
 * @author grupot
 */
public class ImageProductPDto {
    
    @Order(1)
    @TextField("Imagen")
    @TypeFormField(FieldType.IMAGE_FILE_UPLOAD)
    private String image;
    
    @Order(2)
    @TextField("Orden")
    private Integer order;

    /**
     * @return the image
     */
    public String getImage() {
        return image;
    }

    /**
     * @param image the image to set
     */
    public void setImage(String image) {
        this.image = image;
    }

    /**
     * @return the order
     */
    public Integer getOrder() {
        return order;
    }

    /**
     * @param order the order to set
     */
    public void setOrder(Integer order) {
        this.order = order;
    }
}
