/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.controllers.view;

import com.lacv.mercando.model.dtos.ProductDto;
import com.lacv.mercando.services.ProductService;
import com.dot.gcpbasedot.controller.ExtEntityController;
import com.dot.gcpbasedot.dto.MenuItem;
import com.dot.gcpbasedot.dto.ProcessButton;
import com.dot.gcpbasedot.dto.config.ReportConfig;
import com.dot.gcpbasedot.dto.config.EntityConfig;
import com.dot.gcpbasedot.enums.PageType;
import com.lacv.mercando.model.dtos.process.ActivationProductPDto;
import com.lacv.mercando.model.dtos.reports.ProductReportDto;
import com.lacv.mercando.model.entities.ProductImage;
import com.lacv.mercando.services.security.SecurityService;
import java.util.List;
import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author lacastrillov
 */
@Controller
@RequestMapping(value = "/product")
public class ProductViewController extends ExtEntityController {

    @Autowired
    ProductService productService;
    
    @Autowired
    SecurityService securityService;

    
    @PostConstruct
    public void init() {
        EntityConfig view = new EntityConfig("product", productService, ProductDto.class);
        view.setSingularEntityTitle("Producto");
        view.setPluralEntityTitle("Productos");
        view.addChildExtView("productImage", ProductImage.class, EntityConfig.TCV_1_TO_N);
        view.addComboboxChildDependent("category", "subCategory");
        super.addControlMapping(view);
        
        ReportConfig report = new ReportConfig("product", "reporteProductos", productService, ProductReportDto.class);
        report.setPluralReportTitle("Reporte de Productos");
        report.addChildExtReport("productImage", "reporteImagenesProducto", "product_id");
        report.setMaxResultsPerPage(100L);
        report.setDefaultOrderBy("id");
        report.setDefaultOrderDir("DESC");
        
        ProcessButton setPasswordButton= new ProcessButton();
        setPasswordButton.setMainProcessRef("processProduct");
        setPasswordButton.setProcessName("activarProducto");
        setPasswordButton.setProcessTitle("Activar Producto");
        setPasswordButton.addSourceByDestinationField("id", "productId");
        setPasswordButton.addSourceByDestinationField("code", "productCode");
        setPasswordButton.addSourceByDestinationField("brand", "brand");
        setPasswordButton.addSourceByDestinationField("registerDate", "registerDate");
        setPasswordButton.setDtoClass(ActivationProductPDto.class);
        report.addProcessButton(setPasswordButton);
        
        super.addReportMapping(report);
        
        MenuItem menuParent= new MenuItem("Productos");
        
        MenuItem menuItem= new MenuItem("product", "Gestionar Productos");
        menuParent.addSubMenu(menuItem);
        menuParent.addSubMenu(menuItem);
        
        MenuItem menuItem2= new MenuItem("product", "Reporte de Productos");
        menuItem2.setReportName("reporteProductos");
        menuItem2.setPageType(PageType.REPORT);
        menuParent.addSubMenu(menuItem2);
        
        menuComponent.addItemMenu(menuParent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }

}
