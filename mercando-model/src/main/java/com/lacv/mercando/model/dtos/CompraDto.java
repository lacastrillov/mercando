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
import com.lacv.jmagrexs.annotation.ReadOnly;
import com.lacv.jmagrexs.annotation.Size;
import com.lacv.jmagrexs.annotation.TextField;
import com.lacv.jmagrexs.annotation.TypeFormField;
import com.lacv.jmagrexs.domain.BaseDto;
import com.lacv.jmagrexs.enums.FieldType;
import java.sql.Time;
import java.util.Date;
import java.util.List;

/**
 *
 * @author lcastrillo
 */
@LabelField("id")
public class CompraDto implements BaseDto {

    private static final long serialVersionUID = 1L;
    
    @Order(1)
    @ReadOnly
    @ColumnWidth(100)
    @TextField("Id")
    private Integer id;
    
    @Order(2)
    @NotNull
    @Size(min=1,max=45)
    @ColumnWidth(200)
    @TextField("Num Factura")
    private String numFactura;
    
    @Order(3)
    @ColumnWidth(200)
    @TextField("Fecha Compra")
    private Date fechaCompra;
    
    @Order(4)
    @ColumnWidth(200)
    @TextField("Fecha Pago")
    private Date fechaPago;
    
    @Order(5)
    @Size(max=20)
    @ColumnWidth(200)
    @TypeFormField(value = FieldType.LIST, data = {"Contado", "Credito"})
    @TextField("Forma Pago")
    private String formaPago;
    
    @Order(6)
    @ColumnWidth(200)
    @TextField("Sub Category")
    private SubCategoryDto subCategory;
    
    @Order(7)
    @ColumnWidth(200)
    @TextField("Product")
    private ProductDto product;
    
    @Order(8)
    @ColumnWidth(200)
    @TextField("Porcentaje Iva")
    private Double porcentajeIva;
    
    @Order(9)
    @ColumnWidth(200)
    @TextField("Valor Unitario")
    private Double valorUnitario;
    
    @Order(10)
    @ColumnWidth(200)
    @TextField("Subtotal Unidad")
    private Double subtotalUnidad;
    
    @Order(11)
    @ColumnWidth(200)
    @TextField("Iva Unidad")
    private Double ivaUnidad;
    
    @Order(12)
    @ColumnWidth(200)
    @TextField("Cantidad")
    private Integer cantidad;
    
    @Order(13)
    @ColumnWidth(200)
    @TextField("Valor Total")
    private Double valorTotal;
    
    @Order(14)
    @ColumnWidth(200)
    @TextField("Subtotal")
    private Double subtotal;
    
    @Order(15)
    @ColumnWidth(200)
    @TextField("Iva Total")
    private Double ivaTotal;
    

    public CompraDto() {
    }

    @Override
    public Integer getId() {
        return id;
    }

    @Override
    public void setId(Object id) {
        this.id = (Integer) id;
    }

    public Date getFechaCompra() {
        return fechaCompra;
    }

    public void setFechaCompra(Date fechaCompra) {
        this.fechaCompra =  fechaCompra;
    }

    public Date getFechaPago() {
        return fechaPago;
    }

    public void setFechaPago(Date fechaPago) {
        this.fechaPago =  fechaPago;
    }

    public String getFormaPago() {
        return formaPago;
    }

    public void setFormaPago(String formaPago) {
        this.formaPago =  formaPago;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad =  cantidad;
    }

    public Double getIvaTotal() {
        return ivaTotal;
    }

    public void setIvaTotal(Double ivaTotal) {
        this.ivaTotal =  ivaTotal;
    }

    public Double getIvaUnidad() {
        return ivaUnidad;
    }

    public void setIvaUnidad(Double ivaUnidad) {
        this.ivaUnidad =  ivaUnidad;
    }

    public String getNumFactura() {
        return numFactura;
    }

    public void setNumFactura(String numFactura) {
        this.numFactura =  numFactura;
    }

    public Double getPorcentajeIva() {
        return porcentajeIva;
    }

    public void setPorcentajeIva(Double porcentajeIva) {
        this.porcentajeIva =  porcentajeIva;
    }

    public ProductDto getProduct() {
        return product;
    }

    public void setProduct(ProductDto product) {
        this.product =  product;
    }

    public SubCategoryDto getSubCategory() {
        return subCategory;
    }

    public void setSubCategory(SubCategoryDto subCategory) {
        this.subCategory =  subCategory;
    }

    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal =  subtotal;
    }

    public Double getSubtotalUnidad() {
        return subtotalUnidad;
    }

    public void setSubtotalUnidad(Double subtotalUnidad) {
        this.subtotalUnidad =  subtotalUnidad;
    }

    public Double getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(Double valorTotal) {
        this.valorTotal =  valorTotal;
    }

    public Double getValorUnitario() {
        return valorUnitario;
    }

    public void setValorUnitario(Double valorUnitario) {
        this.valorUnitario =  valorUnitario;
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
        if (!(object instanceof CompraDto)) {
            return false;
        }
        CompraDto other = (CompraDto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.lacv.mercando.model.dtos.CompraDto[ id=" + id + " ]";
    }
    
}
