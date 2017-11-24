/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.dtos.process;

import com.dot.gcpbasedot.annotation.NotNull;
import com.dot.gcpbasedot.annotation.Order;
import com.dot.gcpbasedot.annotation.TextField;
import java.util.List;

/**
 *
 * @author grupot
 */
public class ProductBasicDataPDto {
    
    @NotNull
    @Order(1)
    @TextField("Id Producto")
    private Integer productId;
    
    @TextField("Fotos")
    private List<ImageProductPDto> photos;

    /**
     * @return the productId
     */
    public Integer getProductId() {
        return productId;
    }

    /**
     * @param productId the productId to set
     */
    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    /**
     * @return the photos
     */
    public List<ImageProductPDto> getPhotos() {
        return photos;
    }

    /**
     * @param photos the photos to set
     */
    public void setPhotos(List<ImageProductPDto> photos) {
        this.photos = photos;
    }
    
}
