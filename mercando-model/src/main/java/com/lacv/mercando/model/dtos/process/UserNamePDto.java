/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.dtos.process;

import com.lacv.jmagrexs.annotation.NotNull;

/**
 *
 * @author grupot
 */
public class UserNamePDto {
    
    @NotNull
    private String username;
    
    public UserNamePDto(){
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    
}
