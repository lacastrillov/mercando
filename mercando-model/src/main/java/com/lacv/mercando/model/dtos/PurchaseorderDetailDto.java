/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.dtos;

import com.lacv.jmagrexs.annotation.ColumnWidth;
import com.lacv.jmagrexs.annotation.Order;
import com.lacv.jmagrexs.annotation.ReadOnly;
import com.lacv.jmagrexs.annotation.TextField;
import com.lacv.jmagrexs.annotation.TypeFormField;
import com.lacv.jmagrexs.domain.BaseEntity;
import com.lacv.jmagrexs.enums.FieldType;

/**
 *
 * @author lacastrillov
 */
public class PurchaseorderDetailDto implements BaseEntity {

    private static final long serialVersionUID = 1L;
    
    @Order(1)
    @ColumnWidth(100)
    @ReadOnly
    private Integer id;
    
    @Order(2)
    @TextField("Producto")
    private ProductDto product;
    
    @Order(3)
    @ColumnWidth(100)
    @TextField("Cantidad")
    private Integer quantity;
    
    @Order(4)
    @ColumnWidth(150)
    @TextField("Precio Unitario")
    @TypeFormField(FieldType.PRICE)
    private Integer unitPrice;
    
    @Order(5)
    @ColumnWidth(150)
    @TextField("Sub total")
    @TypeFormField(FieldType.PRICE)
    private Integer subTotal;
    
    @Order(6)
    @ColumnWidth(150)
    @TextField("Descuento")
    @TypeFormField(FieldType.PRICE)
    private Integer discount;
    
    @Order(7)
    @ColumnWidth(150)
    @TextField("IVA")
    @TypeFormField(FieldType.PRICE)
    private Integer iva;
    
    @Order(8)
    @ColumnWidth(150)
    @TextField("Total")
    @TypeFormField(FieldType.PRICE)
    private Integer total;
    
    @TextField("Orden de Compra")
    private PurchaseOrderDto purchaseOrder;
    

    public PurchaseorderDetailDto() {
    }

    public PurchaseorderDetailDto(Integer id) {
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

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Integer unitPrice) {
        this.unitPrice = unitPrice;
    }
    
    public Integer getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(Integer subTotal) {
        this.subTotal = subTotal;
    }

    public Integer getDiscount() {
        return discount;
    }

    public void setDiscount(Integer discount) {
        this.discount = discount;
    }
    
    public Integer getIva() {
        return iva;
    }

    public void setIva(Integer iva) {
        this.iva = iva;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public ProductDto getProduct() {
        return product;
    }

    public void setProduct(ProductDto product) {
        this.product = product;
    }

    public PurchaseOrderDto getPurchaseOrder() {
        return purchaseOrder;
    }

    public void setPurchaseOrder(PurchaseOrderDto purchaseOrder) {
        this.purchaseOrder = purchaseOrder;
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
        if (!(object instanceof PurchaseorderDetailDto)) {
            return false;
        }
        PurchaseorderDetailDto other = (PurchaseorderDetailDto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.lacv.marketplatform.entities.PurchaseorderDetailDto[ id=" + id + " ]";
    }
    
}
