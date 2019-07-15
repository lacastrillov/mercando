/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.rest;


import com.lacv.mercando.model.mappers.PurchaseOrderMapper;
import com.lacv.mercando.services.PurchaseOrderService;
import com.lacv.jmagrexs.controller.rest.RestSessionController;
import com.lacv.jmagrexs.domain.BaseEntity;
import com.lacv.mercando.model.entities.PurchaseOrder;
import com.lacv.jmagrexs.modules.security.services.bussiness.SecurityService;
import java.util.List;
import javax.annotation.PostConstruct;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author lcastrillo
 */
@Controller
@RequestMapping(value="/rest/purchaseOrder")
public class PurchaseOrderRestController extends RestSessionController {
    
    @Autowired
    PurchaseOrderService purchaseOrderService;
    
    @Autowired
    PurchaseOrderMapper purchaseOrderMapper;
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        super.addControlMapping("purchaseOrder", purchaseOrderService, purchaseOrderMapper);
    }
    
    @Override
    public JSONObject addSessionSearchFilter(JSONObject jsonFilters){
        jsonFilters.getJSONObject("eq").put("user", securityService.getCurrentUser().getId());
                
        return jsonFilters;
    }
    
    @Override
    public JSONObject addSessionReportFilter(String reportName, JSONObject jsonFilters) {
        return jsonFilters;
    }
    
    @Override
    public boolean canSessionLoad(BaseEntity entity){
        PurchaseOrder purchaseOrder= (PurchaseOrder) entity;
        return securityService.getCurrentUser().getId().equals(purchaseOrder.getUser().getId());
    }
    
    @Override
    public boolean canSessionCreate(BaseEntity entity){
        return false;
    }
    
    @Override
    public boolean canSessionUpdate(BaseEntity entity){
        return false;
    }
    
    @Override
    public boolean canSessionDelete(BaseEntity entity){
        return false;
    }

    @Override
    public boolean canSessionUpdateByFilters(JSONObject jsonFilters) {
        return false;
    }

    @Override
    public boolean canSessionDeleteByFilters(JSONObject jsonFilters) {
        return false;
    }
    
    @Override
    public boolean canSessionImportData(List<BaseEntity> entities) {
        return false;
    }
    
}
