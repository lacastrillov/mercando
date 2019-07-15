/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.rest;


import com.lacv.mercando.model.mappers.ProductMapper;
import com.lacv.mercando.services.ProductService;
import com.lacv.jmagrexs.controller.rest.RestSessionController;
import com.lacv.jmagrexs.domain.BaseEntity;
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
@RequestMapping(value="/rest/product")
public class ProductRestController extends RestSessionController {
    
    @Autowired
    ProductService productService;
    
    @Autowired
    ProductMapper productMapper;
    
    
    @PostConstruct
    public void init(){
        super.addControlMapping("product", productService, productMapper);
    }

    @Override
    public JSONObject addSessionSearchFilter(JSONObject jsonFilters) {
        return jsonFilters;
    }

    @Override
    public JSONObject addSessionReportFilter(String reportName, JSONObject jsonFilters) {
        return jsonFilters;
    }

    @Override
    public boolean canSessionLoad(BaseEntity entity) {
        return true;
    }

    @Override
    public boolean canSessionCreate(BaseEntity entity) {
        return false;
    }

    @Override
    public boolean canSessionUpdate(BaseEntity entity) {
        return false;
    }

    @Override
    public boolean canSessionDelete(BaseEntity entity) {
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
