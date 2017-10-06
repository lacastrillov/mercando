/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.services.security.impl;

import com.dot.gcpbasedot.dto.ConnectionResponse;
import com.dot.gcpbasedot.dto.ExternalServiceDto;
import com.dot.gcpbasedot.util.AESEncrypt;
import com.dot.gcpbasedot.util.ExternalServiceConnection;
import com.lacv.mercando.model.constants.WebConstants;
import com.lacv.mercando.model.entities.User;
import com.lacv.mercando.services.security.SecurityService;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

/**
 *
 * @author grupot
 */
@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
    
    private final String[] CONTEXT_APPS= {"/rest","/vista"};
    
    @Autowired
    SecurityService securityService;
    
    AESEncrypt myInstance= AESEncrypt.getDefault(WebConstants.SECURITY_SALT);
 
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        User user = securityService.getCurrentUser();
        String username= user.getUsername();
        String password= myInstance.decrypt(user.getPassword(), WebConstants.SECURITY_SEED_PASSW);
        
        System.out.println("onAuthenticationSuccess "+username);
        for(String contextApp: CONTEXT_APPS){
            String endpoint= request.getRequestURL().toString().replaceAll(request.getRequestURI(), "");
            if(request.getRequestURI().startsWith(contextApp)){
                endpoint= "/ajax/account/authenticate";
            }else{
                endpoint= contextApp+"/ajax/account/authenticate";
            }
            System.out.println("Login + "+endpoint);
            ExternalServiceDto service= new ExternalServiceDto("login", endpoint, HttpMethod.POST, null);
            ExternalServiceConnection authenticateConn= new ExternalServiceConnection(service);
            
            Map<String, String> parameters= new HashMap<>();
            parameters.put("j_username", username);
            parameters.put("j_password", password);
            ConnectionResponse connResponse= authenticateConn.post(null, null, parameters);
            System.out.println("Login Response: "+connResponse.getRawBody());
        }
    }
    
}
