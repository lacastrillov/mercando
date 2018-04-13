/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.system.model.dtos;

import com.dot.gcpbasedot.annotation.ColumnWidth;
import com.dot.gcpbasedot.annotation.HideField;
import com.dot.gcpbasedot.annotation.Order;
import com.dot.gcpbasedot.annotation.ReadOnly;
import com.dot.gcpbasedot.annotation.Size;
import com.dot.gcpbasedot.annotation.TextField;
import com.dot.gcpbasedot.domain.BaseEntity;
import com.dot.gcpbasedot.enums.HideView;
import java.util.Date;
import java.util.List;

/**
 *
 * @author lacastrillov
 */
public class WebObjectDto implements BaseEntity {

    private static final long serialVersionUID = 1L;
    
    @Order(1)
    @ReadOnly
    @ColumnWidth(100)
    private Long id;
    
    @Order(2)
    @Size(max = 255)
    @TextField("Nombre")
    private String name;
    
    @Order(3)
    @ReadOnly
    @Size(max = 255)
    @TextField("Tipo Clase")
    private String typeClass;
    
    @Order(4)
    @ReadOnly
    @Size(max = 100)
    @TextField("Tipo Nombre")
    private String typeName;
    
    
    @Order(5)
    @TextField("Path")
    @ReadOnly
    private String path;
    
    @Order(6)
    @ReadOnly
    @TextField("Fecha creaci&oacute;n")
    private Date creationDate;
    
    @Order(7)
    @TextField("Fecha creaci&oacute;n")
    @ReadOnly
    private Date modificationDate;
    
    @Order(8)
    @ReadOnly
    @Size(max = 255)
    @TextField("Icono")
    private String icon;
    
    @Order(9)
    @Size(max = 100)
    @TextField("Id Objeto")
    private String objectId;
    
    @Order(10)
    @TextField("Orden Objeto")
    private Integer objectOrder;
    
    @Order(11)
    @Size(max = 45)
    @TextField("Id Objeto")
    private String status;
    
    @Order(12)
    @Size(max = 255)
    @TextField("Autor")
    private String author;
    
    @TextField("Archivo padre")
    @ReadOnly
    @HideField({HideView.FILTER, HideView.GRID, HideView.FORM})
    private WebObjectDto webObject;

    private List<WebObjectDto> webObjectList;
    
    
    public WebObjectDto() {
    }

    public WebObjectDto(Long id) {
        this.id = id;
    }

    @Override
    public Long getId() {
        return id;
    }

    @Override
    public void setId(Object id) {
        this.id = (Long) id;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Date getModificationDate() {
        return modificationDate;
    }

    public void setModificationDate(Date modificationDate) {
        this.modificationDate = modificationDate;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTypeClass() {
        return typeClass;
    }

    public void setTypeClass(String typeClass) {
        this.typeClass = typeClass;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getObjectId() {
        return objectId;
    }

    public void setObjectId(String objectId) {
        this.objectId = objectId;
    }

    public Integer getObjectOrder() {
        return objectOrder;
    }

    public void setObjectOrder(Integer objectOrder) {
        this.objectOrder = objectOrder;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public List<WebObjectDto> getWebObjectList() {
        return webObjectList;
    }

    public void setWebObjectList(List<WebObjectDto> webObjectList) {
        this.webObjectList = webObjectList;
    }

    public WebObjectDto getWebObject() {
        return webObject;
    }

    public void setWebObject(WebObjectDto webObject) {
        this.webObject = webObject;
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
        if (!(object instanceof WebObjectDto)) {
            return false;
        }
        WebObjectDto other = (WebObjectDto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.lacv.system.model.entities.WebObject[ id=" + id + " ]";
    }
    
}
