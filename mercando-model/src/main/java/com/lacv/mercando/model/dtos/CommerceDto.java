/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.dtos;

import com.lacv.jmagrexs.annotation.ColumnWidth;
import com.lacv.jmagrexs.annotation.LabelField;
import com.lacv.jmagrexs.annotation.NotNull;
import com.lacv.jmagrexs.annotation.Order;
import com.lacv.jmagrexs.annotation.Size;
import com.lacv.jmagrexs.annotation.TextField;
import com.lacv.jmagrexs.annotation.TypeFormField;
import com.lacv.jmagrexs.domain.BaseDto;
import com.lacv.jmagrexs.enums.FieldType;
import com.lacv.jmagrexs.modules.security.model.dtos.UserDto;
import java.util.Date;

/**
 *
 * @author grupot
 */
@LabelField("commerceName")
public class CommerceDto implements BaseDto {

    private static final long serialVersionUID = 1L;
    
    @Order(1)
    @ColumnWidth(100)
    private Integer id;
    
    @Size(max=100)
    @Order(2)
    @TextField("Nombre")
    @NotNull
    private String commerceName;
    
    @Size(max=500)
    @TypeFormField(FieldType.TEXT_AREA)
    @TextField("Descripci&oacute;n")
    private String commerceDescription;
    
    @Size(max=200)
    @TypeFormField(FieldType.IMAGE_FILE_UPLOAD)
    @TextField("Imagen")
    @ColumnWidth(320)
    private String commerceImage;
    
    @Size(max=200)
    @TextField("Tag")
    private String commerceTag;
    
    @TextField("Fecha Creaci&oacute;n")
    private Date creationDate;
    
    @TextField("Ubicaci&oacute;n Principal")
    @TypeFormField(value = FieldType.MULTI_SELECT)
    private MainLocationDto mainLocation;
    
    @TextField("Usuario")
    private UserDto user;
    

    public CommerceDto() {
    }

    public CommerceDto(Integer commerceId) {
        this.id = commerceId;
    }

    @Override
    public Integer getId() {
        return id;
    }

    @Override
    public void setId(Object id) {
        this.id = (Integer) id;
    }

    public String getCommerceDescription() {
        return commerceDescription;
    }

    public void setCommerceDescription(String commerceDescription) {
        this.commerceDescription = commerceDescription;
    }

    public String getCommerceImage() {
        return commerceImage;
    }

    public void setCommerceImage(String commerceImage) {
        this.commerceImage = commerceImage;
    }

    public String getCommerceName() {
        return commerceName;
    }

    public void setCommerceName(String commerceName) {
        this.commerceName = commerceName;
    }

    public String getCommerceTag() {
        return commerceTag;
    }

    public void setCommerceTag(String commerceTag) {
        this.commerceTag = commerceTag;
    }
    
    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public MainLocationDto getMainLocation() {
        return mainLocation;
    }

    public void setMainLocation(MainLocationDto mainLocation) {
        this.mainLocation = mainLocation;
    }

    public UserDto getUser() {
        return user;
    }

    public void setUser(UserDto user) {
        this.user = user;
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
        if (!(object instanceof CommerceDto)) {
            return false;
        }
        CommerceDto other = (CommerceDto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.lacv.marketplatform.entities.CommerceDto[ commerceId=" + id + " ]";
    }
    
}
