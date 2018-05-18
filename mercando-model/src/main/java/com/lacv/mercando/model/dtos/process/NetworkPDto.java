/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.dtos.process;

import com.lacv.jmagrexs.annotation.HttpHeader;
import com.lacv.jmagrexs.annotation.NotNull;
import com.lacv.jmagrexs.annotation.Order;
import com.lacv.jmagrexs.annotation.PathVar;
import com.lacv.jmagrexs.annotation.TextField;

/**
 *
 * @author grupot
 */
public class NetworkPDto {
    
    @Order(1)
    @NotNull
    @TextField("Cisco Meraki API Key")
    @HttpHeader("X-Cisco-Meraki-API-Key")
    private String merakiAPIKey;
    
    @Order(2)
    @NotNull
    @PathVar
    @TextField("Network Id")
    private String networkId;

    /**
     * @return the merakiAPIKey
     */
    public String getMerakiAPIKey() {
        return merakiAPIKey;
    }

    /**
     * @param merakiAPIKey the merakiAPIKey to set
     */
    public void setMerakiAPIKey(String merakiAPIKey) {
        this.merakiAPIKey = merakiAPIKey;
    }

    /**
     * @return the networkId
     */
    public String getNetworkId() {
        return networkId;
    }

    /**
     * @param networkId the networkId to set
     */
    public void setNetworkId(String networkId) {
        this.networkId = networkId;
    }

    
    
        
}
