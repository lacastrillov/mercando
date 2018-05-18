/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.dtos.process;

import com.lacv.jmagrexs.annotation.NotNull;
import com.lacv.jmagrexs.annotation.TextField;

/**
 *
 * @author lacastrillov
 */
public class BasicPDto {
    
    @NotNull
    @TextField("Referencia")
    private String refCode;

    /**
     * @return the refCode
     */
    public String getRefCode() {
        return refCode;
    }

    /**
     * @param refCode the refCode to set
     */
    public void setRefCode(String refCode) {
        this.refCode = refCode;
    }
    
    
}
