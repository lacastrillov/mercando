/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.portal;

import com.lacv.mercando.model.mappers.CategoryMapper;
import com.lacv.mercando.services.CategoryService;
import com.lacv.mercando.model.entities.Category;
import com.lacv.mercando.services.SubCategoryService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author lacastrillov
 */
@Controller
@RequestMapping(value="/category")
public class CategoryController {
    
    @Autowired
    CategoryService categoryService;
    
    @Autowired
    SubCategoryService subCategoryService;
    
    @Autowired
    CategoryMapper categoryMapper;
    
    
    @RequestMapping(value = "/component/menu-categories-subcategories", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView getMenuCategoriesSubcategories() {
        ModelAndView mav = new ModelAndView("market/menu_categories_subcategories");
        
        List<Category> categories= categoryService.listAll();
        for(Category category: categories){
            category.setSubCategoryList(subCategoryService.findByParameter("category", category));
        }
        
        Map<Integer, Long> countProductsByCategories= new HashMap<>();
        List<Map<String, Object>> listCountProductsByCategories= categoryService.findByNameQuery("countProductsByCategories", new HashMap<>());
        for(Map<String, Object> item: listCountProductsByCategories){
            countProductsByCategories.put((Integer)item.get("category_id"), (Long)item.get("count"));
        }
        
        Map<Integer, Long> countProductsBySubcategories= new HashMap<>();
        List<Map<String, Object>> listCountProductsBySubcategories= categoryService.findByNameQuery("countProductsBySubcategories", new HashMap<>());
        for(Map<String, Object> item: listCountProductsBySubcategories){
            countProductsBySubcategories.put((Integer)item.get("subcategory_id"), (Long)item.get("count"));
        }
        
        mav.addObject("categories", categories);
        mav.addObject("countProductsByCategories", countProductsByCategories);
        mav.addObject("countProductsBySubcategories", countProductsBySubcategories);
        
        return mav;
    }
    
}
