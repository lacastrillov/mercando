/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.dtos;

import com.lacv.jmagrexs.annotation.ColumnWidth;
import com.lacv.jmagrexs.annotation.LabelField;
import com.lacv.jmagrexs.annotation.Order;
import com.lacv.jmagrexs.annotation.ReadOnly;
import com.lacv.jmagrexs.annotation.TextField;
import com.lacv.jmagrexs.annotation.TypeFormField;
import com.lacv.jmagrexs.domain.BaseDto;
import com.lacv.jmagrexs.enums.FieldType;
import com.lacv.jmagrexs.modules.security.model.dtos.UserDto;
import java.sql.Time;
import java.util.Date;
import java.util.List;

/**
 *
 * @author lacastrillov
 */
@LabelField("number")
public class PurchaseOrderDto implements BaseDto {

    private static final long serialVersionUID = 1L;
    
    @Order(1)
    @ColumnWidth(100)
    @ReadOnly
    private Integer id;
    
    @Order(2)
    @TextField("N&uacute;mero")
    @ReadOnly
    private Long number;
    
    @Order(3)
    @TextField("Fecha Registro")
    @TypeFormField(value = FieldType.DATETIME)
    private Date registrationDate;
    
    @Order(4)
    @TextField("Hora Registro")
    private Time recordTime;
    
    @Order(5)
    @TextField("Fecha entrega")
    private Date deliveryDate;
    
    @Order(6)
    @ColumnWidth(150)
    @TextField("Sub total")
    @TypeFormField(FieldType.PRICE)
    private Integer subTotal;
    
    @Order(7)
    @ColumnWidth(150)
    @TextField("Descuento")
    @TypeFormField(FieldType.PRICE)
    private Integer discount;
    
    @Order(8)
    @ColumnWidth(150)
    @TextField("IVA")
    @TypeFormField(FieldType.PRICE)
    private Integer iva;
    
    @Order(9)
    @ColumnWidth(150)
    @TextField("Total")
    @TypeFormField(FieldType.PRICE)
    private Integer total;
    
    @Order(10)
    @TextField("Estado")
    @TypeFormField(value = FieldType.LIST, data = {"Pendiente", "Pagada", "Con Saldo", "Impagable", "Cancelada", "Rechazada"})
    private String status;
    
    @Order(11)
    @TextField("Usuario")
    private UserDto user;
    
    private List<PurchaseorderDetailDto> purchaseorderDetailList;
    
    private List<PaymentDto> paymentList;

    public PurchaseOrderDto() {
    }

    public PurchaseOrderDto(Integer id) {
        this.id = id;
    }

    public PurchaseOrderDto(Integer id, long number) {
        this.id = id;
        this.number = number;
    }

    @Override
    public Integer getId() {
        return id;
    }

    @Override
    public void setId(Object id) {
        this.id = (Integer) id;
    }

    public Long getNumber() {
        return number;
    }

    public void setNumber(Long number) {
        this.number = number;
    }

    public Date getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }

    public Time getRecordTime() {
        return recordTime;
    }

    public void setRecordTime(Time recordTime) {
        this.recordTime = recordTime;
    }
    
    public Date getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public UserDto getUser() {
        return user;
    }

    public void setUser(UserDto user) {
        this.user = user;
    }

    public List<PurchaseorderDetailDto> getPurchaseorderDetailList() {
        return purchaseorderDetailList;
    }

    public void setPurchaseorderDetailList(List<PurchaseorderDetailDto> purchaseorderDetailList) {
        this.purchaseorderDetailList = purchaseorderDetailList;
    }

    public List<PaymentDto> getPaymentList() {
        return paymentList;
    }

    public void setPaymentList(List<PaymentDto> paymentList) {
        this.paymentList = paymentList;
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
        if (!(object instanceof PurchaseOrderDto)) {
            return false;
        }
        PurchaseOrderDto other = (PurchaseOrderDto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.lacv.marketplatform.entities.PurchaseOrderDto[ id=" + id + " ]";
    }
    
}
