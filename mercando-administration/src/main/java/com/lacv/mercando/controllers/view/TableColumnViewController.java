/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.view;

import com.lacv.mercando.model.dtos.TableColumnDto;
import com.lacv.mercando.model.mappers.TableColumnMapper;
import com.lacv.mercando.services.TableColumnService;
import com.dot.gcpbasedot.controller.ExtEntityController;
import com.dot.gcpbasedot.components.MenuComponent;
import com.dot.gcpbasedot.dto.MenuItem;
import com.dot.gcpbasedot.dto.config.EntityConfig;
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
@RequestMapping(value="/tableColumn")
public class TableColumnViewController extends ExtEntityController {
    
    @Autowired
    TableColumnService tableColumnService;
    
    @Autowired
    MenuComponent menuComponent;
    
    @Autowired
    TableColumnMapper tableColumnMapper;
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        EntityConfig view= new EntityConfig("tableColumn", "name", tableColumnService, TableColumnDto.class);
        view.setSingularEntityTitle("Columna de la tabla");
        view.setPluralEntityTitle("Columnas de la tabla");
        view.setDefaultOrder("columnOrder", "ASC");
        super.addControlMapping(view);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
}
