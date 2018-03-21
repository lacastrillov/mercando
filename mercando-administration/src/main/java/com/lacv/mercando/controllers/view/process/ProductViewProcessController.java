/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.view.process;

import com.lacv.system.model.dtos.LogProcessDto;
import com.lacv.system.model.dtos.process.BasicResultDto;
import com.dot.gcpbasedot.controller.ExtProcessController;
import com.dot.gcpbasedot.dto.MenuItem;
import com.dot.gcpbasedot.dto.config.ProcessConfig;
import com.dot.gcpbasedot.enums.PageType;
import com.lacv.mercando.model.dtos.process.ActivationProductPDto;
import com.lacv.mercando.model.dtos.process.BasicPDto;
import com.lacv.mercando.model.dtos.process.ProductListResultDto;
import com.lacv.mercando.model.dtos.process.ProductBasicDataPDto;
import com.lacv.system.services.security.SecurityService;
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
@RequestMapping(value="/processProduct")
public class ProductViewProcessController extends ExtProcessController {
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        ProcessConfig process= new ProcessConfig("processProduct", "logProcess", LogProcessDto.class);
        process.setMainProcessTitle("Gestionar Procesos de Producto");
        process.addControlProcessView("activarProducto", "Activar Producto", ActivationProductPDto.class, BasicResultDto.class);
        process.addControlProcessView("adicionarFotos", "Adicionar Fotos", ProductBasicDataPDto.class, BasicResultDto.class);
        process.addControlProcessView("listarProductosJoin", "Listar Productos Join", BasicPDto.class, ProductListResultDto.class);
        process.addMultipartFormProcess("adicionarFotos");
        
        super.addControlMapping(process);
        
        MenuItem menuParent= new MenuItem("Procesos de Negocio");
        MenuItem menuItem= new MenuItem("processProduct", "Gestionar Procesos de Producto");
        menuItem.setPageType(PageType.PROCESS);
        menuParent.addSubMenu(menuItem);
        menuComponent.addItemMenu(menuParent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
    
}
