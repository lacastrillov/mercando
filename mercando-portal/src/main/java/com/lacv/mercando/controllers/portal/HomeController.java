package com.lacv.mercando.controllers.portal;

import com.dot.gcpbasedot.dao.Parameters;
import com.lacv.mercando.model.entities.Product;
import com.lacv.mercando.services.ProductImageService;
import com.lacv.mercando.services.ProductService;
import com.lacv.mercando.services.security.SecurityService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;

@Controller
@RequestMapping(value = "/")
public class HomeController {
    
    @Autowired
    SecurityService securityService;
    
    @Autowired
    ProductService productService;
    
    @Autowired
    ProductImageService productImageService;
    
    
    @RequestMapping(value = "/", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView getIndex(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView("market/index");
        
        Parameters p0= new Parameters();
        p0.whereEqual("featured", true);
        p0.whereEqual("status", "Publicado");
        p0.orderBy("registerDate", "DESC");
        p0.setMaxResults(12L);
        
        List<Product> lastFeatured = productService.findByParameters(p0);
        lastFeatured.forEach((product) -> {
            product.setProductImageList(productImageService.findByParameter("product", product));
        });
        
        Parameters p1= new Parameters();
        p1.whereEqual("status", "Publicado");
        p1.orderBy("registerDate", "DESC");
        p1.setMaxResults(6L);
        
        List<Product> lastProducts = productService.findByParameters(p1);
        lastProducts.forEach((product) -> {
            product.setProductImageList(productImageService.findByParameter("product", product));
        });
        
        mav.addObject("parametersFeatured", p0);
        mav.addObject("lastFeatured", lastFeatured);
        mav.addObject("lastProducts", lastProducts);

        return mav;
    }
    
}
