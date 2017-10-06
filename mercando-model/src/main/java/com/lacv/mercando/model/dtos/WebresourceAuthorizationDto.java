/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.dtos;

import com.dot.gcpbasedot.domain.BaseEntity;

/**
 *
 * @author grupot
 */
public class WebresourceAuthorizationDto implements BaseEntity {

    private static final long serialVersionUID = 1L;
    
    private Integer id;
    
    private WebResourceDto webResource;
    
    private AuthorizationDto authorization;

    public WebresourceAuthorizationDto() {
    }

    public WebresourceAuthorizationDto(Integer id) {
        this.id = id;
    }

    @Override
    public Integer getId() {
        return id;
    }

    @Override
    public void setId(Object id) {
        this.id = (Integer) id;
    }

    public WebResourceDto getWebResource() {
        return webResource;
    }

    public void setWebResource(WebResourceDto webResource) {
        this.webResource = webResource;
    }

    public AuthorizationDto getAuthorization() {
        return authorization;
    }

    public void setAuthorization(AuthorizationDto authorization) {
        this.authorization = authorization;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof WebresourceAuthorizationDto)) {
            return false;
        }
        WebresourceAuthorizationDto other = (WebresourceAuthorizationDto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.lacv.marketplatform.entities.WebresourceAuthorizationDto[ id=" + id + " ]";
    }
    
}
