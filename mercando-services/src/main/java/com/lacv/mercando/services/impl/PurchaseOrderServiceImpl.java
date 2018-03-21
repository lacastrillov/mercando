/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.services.impl;


import com.lacv.mercando.daos.PurchaseOrderJpa;
import com.lacv.mercando.model.entities.PurchaseOrder;
import com.lacv.mercando.model.mappers.PurchaseOrderMapper;
import com.lacv.mercando.services.PurchaseOrderService;
import com.dot.gcpbasedot.dao.GenericDao;
import com.dot.gcpbasedot.service.EntityServiceImpl1;
import com.dot.gcpbasedot.util.Util;
import com.lacv.mercando.model.dtos.process.ShippingCartItemPDto;
import com.lacv.mercando.model.dtos.process.ShoppingCartPDto;
import com.lacv.mercando.model.entities.Product;
import com.lacv.mercando.model.entities.PurchaseorderDetail;
import com.lacv.system.model.entities.User;
import com.lacv.mercando.services.ProductService;
import com.lacv.system.services.PropertyService;
import com.lacv.mercando.services.PurchaseorderDetailService;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author lcastrillo
 */
@Service("purchaseOrderService")
public class PurchaseOrderServiceImpl extends EntityServiceImpl1<PurchaseOrder> implements PurchaseOrderService {
    
    @Autowired
    public PurchaseOrderJpa purchaseOrderJpa;
    
    @Autowired
    public PurchaseOrderMapper purchaseOrderMapper;
    
    @Autowired
    ProductService productService;
    
    @Autowired
    PurchaseorderDetailService purchaseorderDetailService;
    
    @Autowired
    PropertyService propertyService;
    
    
    @Override
    public GenericDao getGenericDao(){
        return purchaseOrderJpa;
    }
    
    /**
     * 
     * @param shoppingCartPDto
     * @param buyerUser
     * @return 
     */
    @Override
    @Transactional(value = TRANSACTION_MANAGER, propagation = Propagation.REQUIRED)
    public Long generatePurchaseOrder(ShoppingCartPDto shoppingCartPDto, User buyerUser){
        PurchaseOrder purchaseOrder= new PurchaseOrder();
        Long number= (new Date()).getTime() + buyerUser.getId();
        
        purchaseOrder.setUser(buyerUser);
        purchaseOrder.setNumber(number);
        purchaseOrder.setRegistrationDate(new Date());
        purchaseOrder.setRecordTime(Util.getCurrentTime(0));
        purchaseOrder.setStatus("Pendiente");
        purchaseOrder.setSubTotal(0);
        purchaseOrder.setDiscount(0);
        purchaseOrder.setIva(0);
        purchaseOrder.setTotal(0);
        
        List<PurchaseorderDetail> purchaseorderDetailList= new ArrayList<>();
        for(ShippingCartItemPDto shippingCartItemPDto: shoppingCartPDto.getItems()){
            Product product= productService.loadById(shippingCartItemPDto.getProductId());
            
            PurchaseorderDetail purchaseorderDetail= new PurchaseorderDetail();
            purchaseorderDetail.setProduct(product);
            purchaseorderDetail.setUnitPrice(product.getBuyUnitPrice());
            purchaseorderDetail.setQuantity(shippingCartItemPDto.getQuantity());
            purchaseorderDetail.setSubTotal(product.getBuyUnitPrice() * shippingCartItemPDto.getQuantity());
            purchaseorderDetail.setDiscount((product.getBuyUnitPrice() * product.getDiscount() * shippingCartItemPDto.getQuantity()) / 100);
            purchaseorderDetail.setIva(((purchaseorderDetail.getSubTotal() - purchaseorderDetail.getDiscount()) * propertyService.getInteger("IVA")) / 100);
            purchaseorderDetail.setTotal(purchaseorderDetail.getSubTotal() - purchaseorderDetail.getDiscount() + purchaseorderDetail.getIva());
            
            purchaseOrder.setSubTotal(purchaseOrder.getSubTotal() + purchaseorderDetail.getSubTotal());
            purchaseOrder.setDiscount(purchaseOrder.getDiscount() + purchaseorderDetail.getDiscount());
            purchaseOrder.setIva(purchaseOrder.getIva() + purchaseorderDetail.getIva());
            purchaseOrder.setTotal(purchaseOrder.getSubTotal() - purchaseOrder.getDiscount() + purchaseOrder.getIva());
            
            purchaseorderDetailList.add(purchaseorderDetail);
        }
        
        super.create(purchaseOrder);
        for(PurchaseorderDetail purchaseorderDetail: purchaseorderDetailList){
            purchaseorderDetail.setPurchaseOrder(purchaseOrder);
            purchaseorderDetailService.create(purchaseorderDetail);
        }
        
        return number;
    }
    
}
