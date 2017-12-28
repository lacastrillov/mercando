/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.dtos.process;

import com.lacv.mercando.model.dtos.ProductDto;
import java.util.List;
import org.json.JSONArray;

/**
 *
 * @author grupot
 */
public class ProductsListResultDto {
    
    private boolean success;
    
    private String message;
    
    private List<ProductDto> products;

    /**
     * @return the success
     */
    public boolean isSuccess() {
        return success;
    }

    /**
     * @param success the success to set
     */
    public void setSuccess(boolean success) {
        this.success = success;
    }

    /**
     * @return the message
     */
    public String getMessage() {
        return message;
    }

    /**
     * @param message the message to set
     */
    public void setMessage(String message) {
        this.message = message;
    }

    /**
     * @return the products
     */
    public List<ProductDto> getProducts() {
        return products;
    }

    /**
     * @param products the products to set
     */
    public void setProducts(List<ProductDto> products) {
        this.products = products;
    }

    

    
    
}
