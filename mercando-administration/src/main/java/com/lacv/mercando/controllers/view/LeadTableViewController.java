/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.view;

import com.lacv.mercando.model.dtos.LeadTableDto;
import com.lacv.mercando.model.mappers.LeadTableMapper;
import com.lacv.mercando.services.LeadTableService;
import com.dot.gcpbasedot.controller.ExtEntityController;
import com.dot.gcpbasedot.dto.MenuItem;
import com.dot.gcpbasedot.dto.config.EntityConfig;
import com.lacv.mercando.model.entities.TableColumn;
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
@RequestMapping(value="/leadTable")
public class LeadTableViewController extends ExtEntityController {
    
    @Autowired
    LeadTableService leadTableService;
    
    @Autowired
    LeadTableMapper leadTableMapper;
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        EntityConfig view= new EntityConfig("leadTable", leadTableService, LeadTableDto.class);
        view.setSingularEntityTitle("Tabla Lead");
        view.setPluralEntityTitle("Tablas Lead");
        view.addChildExtView("tableColumn", TableColumn.class, EntityConfig.TCV_1_TO_N);
        super.addControlMapping(view);
        
        MenuItem menuParent= new MenuItem("Sistema");
        MenuItem menuParent1= new MenuItem("Tablas Lead");
        MenuItem menuItem= new MenuItem("leadTable", "Gestionar Tablas Lead");
        menuParent1.addSubMenu(menuItem);
        menuParent.addSubMenu(menuParent1);
        menuComponent.addItemMenu(menuParent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
}
