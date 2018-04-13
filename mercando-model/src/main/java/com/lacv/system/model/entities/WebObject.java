/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.system.model.entities;

import com.dot.gcpbasedot.domain.BaseEntity;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

/**
 *
 * @author lacastrillov
 */
@Entity
@Table(name = "web_object")
@NamedQueries({
    @NamedQuery(name = "WebObject.findAll", query = "SELECT w FROM WebObject w")})
public class WebObject implements BaseEntity {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Size(max = 255)
    @Column(name = "author")
    private String author;
    @Column(name = "creation_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date creationDate;
    @Column(name = "modification_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date modificationDate;
    @Size(max = 255)
    @Column(name = "icon")
    private String icon;
    @Size(max = 255)
    @Column(name = "name")
    private String name;
    @Size(max = 255)
    @Column(name = "type_class")
    private String typeClass;
    @Size(max = 100)
    @Column(name = "type_name")
    private String typeName;
    @Size(max = 100)
    @Column(name = "object_id")
    private String objectId;
    @Column(name = "object_order")
    private Integer objectOrder;
    @Size(max = 45)
    @Column(name = "status")
    private String status;
    @OneToMany(mappedBy = "webObject")
    private List<WebObject> webObjectList;
    @JoinColumn(name = "parent_id", referencedColumnName = "id")
    @ManyToOne
    private WebObject webObject;

    public WebObject() {
    }

    public WebObject(Long id) {
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

    public List<WebObject> getWebObjectList() {
        return webObjectList;
    }

    public void setWebObjectList(List<WebObject> webObjectList) {
        this.webObjectList = webObjectList;
    }

    public WebObject getWebObject() {
        return webObject;
    }

    public void setWebObject(WebObject webObject) {
        this.webObject = webObject;
    }
    
    public String getPath(){
        String path="";
        WebObject parent= getWebObject();
        while(parent!=null){
            path= parent.getName()+"/"+path;
            parent= parent.getWebObject();
        }
        
        return path;
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
        if (!(object instanceof WebObject)) {
            return false;
        }
        WebObject other = (WebObject) object;
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
