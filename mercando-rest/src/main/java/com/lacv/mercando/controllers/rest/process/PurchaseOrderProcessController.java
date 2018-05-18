/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.controllers.rest.process;

import com.lacv.jmagrexs.annotation.DoProcess;
import com.lacv.jmagrexs.controller.rest.RestProcessController;
import com.lacv.jmagrexs.modules.common.dtos.BasicResultDto;
import com.lacv.jmagrexs.modules.common.entities.LogProcess;
import com.lacv.jmagrexs.modules.common.services.LogProcessService;
import com.lacv.jmagrexs.modules.security.entities.User;
import com.lacv.jmagrexs.modules.security.entities.UserRole;
import com.lacv.jmagrexs.modules.security.services.UserRoleService;
import com.lacv.jmagrexs.modules.security.services.UserService;
import com.lacv.mercando.model.constants.WebConstants;
import com.lacv.mercando.model.dtos.process.ShoppingCartPDto;
import com.lacv.mercando.services.PurchaseOrderService;
import com.lacv.jmagrexs.modules.security.services.bussiness.SecurityService;
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
@RequestMapping(value="/rest/processPurchaseOrder")
public class PurchaseOrderProcessController extends RestProcessController  {
    
    @Autowired
    PurchaseOrderService purchaseOrderService;
    
    @Autowired
    UserService userService;
    
    @Autowired
    UserRoleService userRoleService;
    
    @Autowired
    LogProcessService logProcessService;
    
    @Autowired
    SecurityService securityService;
    
    
    @PostConstruct
    public void init(){
        super.addControlProcess("processPurchaseOrder", LogProcess.class, logProcessService);
    }
    
    @Override
    public String getClientId(){
        User user= securityService.getCurrentUser();
        return user.getUsername();
    }
    
    @DoProcess
    public BasicResultDto generarOrdenCompra(ShoppingCartPDto shoppingCartPDto){
        BasicResultDto result= new BasicResultDto();
        User user= securityService.getCurrentUser();
        User buyerUser= null;
        boolean isClient= false;
        
        List<UserRole> userRoles= userRoleService.findByParameter("user", user);
        if(userRoles.size()==1 && userRoles.get(0).getRole().getName().equals(WebConstants.CLIENT_ROLE)){
            isClient= true;
        }
        if(isClient || shoppingCartPDto.getUserId()==null){
            buyerUser= user;
        }else if(shoppingCartPDto.getUserId()!=null){
            buyerUser= userService.loadById(shoppingCartPDto.getUserId());
        }
        
        Long number= purchaseOrderService.generatePurchaseOrder(shoppingCartPDto, buyerUser);
        
        result.setSuccess(true);
        result.setUsername(buyerUser.getUsername());
        result.setMessage("La Orden de Compra n&uacute;mero "+number+" fue creada");
        
        return result;
    }
    
}
