/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.dtos;

import com.lacv.jmagrexs.annotation.ColumnWidth;
import com.lacv.jmagrexs.annotation.HideField;
import com.lacv.jmagrexs.annotation.LabelField;
import com.lacv.jmagrexs.annotation.NotNull;
import com.lacv.jmagrexs.annotation.Order;
import com.lacv.jmagrexs.annotation.ReadOnly;
import com.lacv.jmagrexs.annotation.TextField;
import com.lacv.jmagrexs.annotation.TypeFormField;
import com.lacv.jmagrexs.domain.BaseEntity;
import com.lacv.jmagrexs.enums.FieldType;
import com.lacv.jmagrexs.enums.HideView;
import java.util.List;

/**
 *
 * @author lacastrillov
 */
@LabelField("name")
public class CategoryDto implements BaseEntity {

    private static final long serialVersionUID = 1L;
    
    @Order(1)
    @ColumnWidth(100)
    @ReadOnly
    private Integer id;
    
    @Order(2)
    @NotNull
    @TextField("Nombre")
    private String name;
    
    @TextField("Descripci&oacute;n")
    @TypeFormField(FieldType.TEXT_AREA)
    private String description;
    
    @TextField("Imagen")
    @TypeFormField(FieldType.IMAGE_FILE_UPLOAD)
    @HideField({HideView.FILTER})
    @ColumnWidth(300)
    private String image;
    
    private List<ProductDto> productList;

    public CategoryDto() {
    }

    public CategoryDto(Integer id) {
        this.id = id;
    }

    public CategoryDto(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    @Override
    public Integer getId() {
        return id;
    }

    @Override
    public void setId(Object id) {
        this.id = (Integer) id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public List<ProductDto> getProductList() {
        return productList;
    }

    public void setProductList(List<ProductDto> productList) {
        this.productList = productList;
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
        if (!(object instanceof CategoryDto)) {
            return false;
        }
        CategoryDto other = (CategoryDto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.lacv.marketplatform.entities.CategoryDto[ id=" + id + " ]";
    }
    
}
