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
import com.lacv.jmagrexs.domain.BaseEntity;
import com.lacv.jmagrexs.enums.FieldType;
import java.util.List;

/**
 *
 * @author grupot
 */
@LabelField("mlName")
public class MainLocationDto implements BaseEntity {

    private static final long serialVersionUID = 1L;
    
    @Order(1)
    @ColumnWidth(100)
    private Integer id;
    
    @Order(2)
    @NotNull
    @Size(max=100)
    @TextField("Nombre")
    private String mlName;
    
    @Size(max=500)
    @TypeFormField(FieldType.TEXT_AREA)
    @TextField("Descripci&oacute;n")
    private String mlDescription;
    
    @Size(max=200)
    @TextField("Localizaci&oacute;n")
    @TypeFormField(FieldType.GOOGLE_MAP)
    private String mlLocation;
    
    private List<CommerceDto> commerceList;

    public MainLocationDto() {
    }

    public MainLocationDto(Integer idMainLocation) {
        this.id = idMainLocation;
    }

    @Override
    public Integer getId() {
        return id;
    }

    @Override
    public void setId(Object id) {
        this.id = (Integer) id;
    }

    public String getMlDescription() {
        return mlDescription;
    }

    public void setMlDescription(String mlDescription) {
        this.mlDescription = mlDescription;
    }

    public String getMlLocation() {
        return mlLocation;
    }

    public void setMlLocation(String mlLocation) {
        this.mlLocation = mlLocation;
    }

    public String getMlName() {
        return mlName;
    }

    public void setMlName(String mlName) {
        this.mlName = mlName;
    }

    public List<CommerceDto> getCommerceList() {
        return commerceList;
    }

    public void setCommerceList(List<CommerceDto> commerceList) {
        this.commerceList = commerceList;
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
        if (!(object instanceof MainLocationDto)) {
            return false;
        }
        MainLocationDto other = (MainLocationDto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.lacv.marketplatform.entities.MainLocationDto[ idMainLocation=" + id + " ]";
    }
    
}
