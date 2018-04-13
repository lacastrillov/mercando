/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.system.model.entities;

import com.dot.gcpbasedot.components.MenuComponent;
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
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoader;

/**
 *
 * @author lacastrillov
 */
@Entity
@Table(name = "web_entity")
@NamedQueries({
    @NamedQuery(name = "WebEntity.findAll", query = "SELECT w FROM WebEntity w")})
public class WebEntity implements BaseEntity {

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
    @Column(name = "entity_ref")
    private String entityRef;
    @Size(max = 100)
    @Column(name = "entity_name")
    private String entityName;
    @Size(max = 100)
    @Column(name = "entity_id")
    private String entityId;
    @Column(name = "entity_order")
    private Integer entityOrder;
    @Size(max = 45)
    @Column(name = "status")
    private String status;
    @OneToMany(mappedBy = "webEntity")
    private List<WebEntity> webEntityList;
    @JoinColumn(name = "parent_id", referencedColumnName = "id")
    @ManyToOne
    private WebEntity webEntity;

    public WebEntity() {
    }

    public WebEntity(Long id) {
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

    public String getEntityRef() {
        return entityRef;
    }

    public void setEntityRef(String entityRef) {
        this.entityRef = entityRef;
    }

    public String getEntityName() {
        return entityName;
    }

    public void setEntityName(String entityName) {
        this.entityName = entityName;
    }

    public String getEntityId() {
        return entityId;
    }

    public void setEntityId(String entityId) {
        this.entityId = entityId;
    }

    public Integer getEntityOrder() {
        return entityOrder;
    }

    public void setEntityOrder(Integer entityOrder) {
        this.entityOrder = entityOrder;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<WebEntity> getWebEntityList() {
        return webEntityList;
    }

    public void setWebEntityList(List<WebEntity> webEntityList) {
        this.webEntityList = webEntityList;
    }

    public WebEntity getWebEntity() {
        return webEntity;
    }

    public void setWebEntity(WebEntity webEntity) {
        this.webEntity = webEntity;
    }
    
    public String getLocation() {
        ApplicationContext ctx = ContextLoader.getCurrentWebApplicationContext();
        MenuComponent menuComponent= (MenuComponent) ctx.getBean("menuComponent");
        String location= menuComponent.getContextPath() + menuComponent.getBasePath() + "/" + this.entityRef + "/entity.htm" ;
        return location+"#?id="+this.entityId+"&tab=1";
    }
    
    public String getPath(){
        String path="";
        WebEntity parent= getWebEntity();
        while(parent!=null){
            path= parent.getName()+"/"+path;
            parent= parent.getWebEntity();
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
        if (!(object instanceof WebEntity)) {
            return false;
        }
        WebEntity other = (WebEntity) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.lacv.system.model.entities.WebEntity[ id=" + id + " ]";
    }
    
}
