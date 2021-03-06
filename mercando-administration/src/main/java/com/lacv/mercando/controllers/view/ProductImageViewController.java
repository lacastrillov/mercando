/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.view;

import com.lacv.mercando.model.dtos.ProductImageDto;
import com.lacv.mercando.model.mappers.ProductImageMapper;
import com.lacv.mercando.services.ProductImageService;
import com.lacv.jmagrexs.controller.view.ExtEntityController;
import com.lacv.jmagrexs.dto.config.ReportConfig;
import com.lacv.jmagrexs.dto.config.EntityConfig;
import com.lacv.mercando.model.dtos.reports.ProductImageReportDto;
import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author lacastrillov
 */
@Controller
@RequestMapping(value="/vista/productImage")
public class ProductImageViewController extends ExtEntityController {
    
    @Autowired
    ProductImageService productImageService;
    
    @Autowired
    ProductImageMapper productImageMapper;
    
    
    @PostConstruct
    public void init(){
        EntityConfig view= new EntityConfig("productImage", productImageService, ProductImageDto.class);
        view.setSingularEntityTitle("Imagen");
        view.setPluralEntityTitle("Imagenes");
        view.setMultipartFormData(true);
        view.setVisibleSeeAllButton(true);
        view.setDefaultOrder("order", "ASC");
        super.addControlMapping(view);
        
        ReportConfig report = new ReportConfig("productImage", "reporteImagenesProducto", productImageService, ProductImageReportDto.class);
        report.setPluralReportTitle("Reporte Imagenes de Productos");
        report.setDefaultOrder("order_level", "ASC");
        report.setVisibleSeeAllButton(true);
        super.addReportMapping(report);
    }
    
}
