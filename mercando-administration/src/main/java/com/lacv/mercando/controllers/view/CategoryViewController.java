/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.view;

import com.lacv.mercando.model.dtos.CategoryDto;
import com.lacv.mercando.model.mappers.CategoryMapper;
import com.lacv.mercando.services.CategoryService;
import com.dot.gcpbasedot.controller.ExtEntityController;
import com.dot.gcpbasedot.dto.MenuItem;
import com.dot.gcpbasedot.dto.config.EntityConfig;
import com.lacv.mercando.model.entities.SubCategory;
import com.lacv.mercando.services.SubCategoryService;
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
@RequestMapping(value="/category")
public class CategoryViewController extends ExtEntityController {
    
    @Autowired
    CategoryService categoryService;
    
    @Autowired
    SubCategoryService subCategoryService;
    
    @Autowired
    CategoryMapper categoryMapper;
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        EntityConfig view= new EntityConfig("category", categoryService, CategoryDto.class);
        view.setSingularEntityTitle("Categoria");
        view.setPluralEntityTitle("Categorias");
        view.setMultipartFormData(true);
        view.setVisibleSeeAllButton(true);
        view.addChildExtView("subCategory", SubCategory.class, EntityConfig.TCV_1_TO_N);
        view.addInternalViewButton("product", "Ver productos");
        super.addControlMapping(view);
        
        MenuItem menuParent= new MenuItem("Productos", 7);
        MenuItem menuItem= new MenuItem("category", "Gestionar Categorias");
        menuParent.addSubMenu(menuItem);
        menuComponent.addItemMenu(menuParent);
    }
    
    @Override
    public List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData){
        return securityService.configureVisibilityMenu(menuData);
    }
    
}
