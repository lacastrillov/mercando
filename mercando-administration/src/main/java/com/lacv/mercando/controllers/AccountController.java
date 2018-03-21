package com.lacv.mercando.controllers;

import com.dot.gcpbasedot.dao.Parameters;
import com.dot.gcpbasedot.util.Util;
import com.lacv.system.model.dtos.RoleDto;
import com.lacv.system.model.dtos.UserDto;
import com.lacv.system.model.dtos.UserRoleDto;
import com.lacv.system.model.dtos.security.UserAndRolesDto;
import com.lacv.system.model.entities.User;
import com.lacv.system.model.entities.UserRole;
import com.lacv.system.model.mappers.UserMapper;
import com.lacv.system.model.mappers.UserRoleMapper;
import com.lacv.system.services.UserRoleService;
import com.lacv.system.services.security.SecurityService;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/account")
public class AccountController {
    
    @Autowired
    SecurityService securityService;
    
    @Autowired
    UserRoleService userRoleService;
    
    @Autowired
    UserMapper userMapper;
    
    @Autowired
    UserRoleMapper userRoleMapper;
    
    
    
    @RequestMapping(value = "/home", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView getHome(HttpServletRequest request, HttpServletResponse response, @RequestParam(required = false) String redirect) {
        if(redirect!=null && !redirect.equals("user")){
            try {
                response.sendRedirect(new String(Base64.decodeBase64(redirect), StandardCharsets.UTF_8));
            } catch (IOException ex) {
                Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
            }
            return null;
        }else{
            UserAndRolesDto userAndRoles= getUserAndRoles();
            if(userAndRoles!=null){
                String homePage=null;
                for(RoleDto role: userAndRoles.getRoles()){
                    if(role.getHomePage()!=null){
                        homePage= role.getHomePage();
                        break;
                    }
                }
                if(homePage!=null){
                    return new ModelAndView("redirect:"+homePage);
                } else {
                    return new ModelAndView("redirect:/vista/product/entity.htm");
                }
            }else{
                return new ModelAndView("redirect:/account/login");
            }
        }
    }
    
    @RequestMapping(value = "/ajax/authenticate", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public String authenticate(
            @RequestParam(required = false) String j_username,
            @RequestParam(required = false) String j_password,
            @RequestParam(required = false) String basicAuthorization) {
        
        Map data= new HashMap();
        try{
            if(j_username!=null && j_password!=null){
                securityService.connect(j_username, j_password);
            }else{
                securityService.connect(basicAuthorization);
            }
            UserAndRolesDto userAndRoles= getUserAndRoles();
            data.put("success", true);
            data.put("user", userAndRoles.getUser());
            data.put("roles", userAndRoles.getRoles());
            
            return Util.objectToJson(data);
        }catch(AuthenticationException ex){
            data.put("success", false);
            data.put("message", "Usuario y/o contraseña incorrectos");
        }
        return Util.objectToJson(data);
    }
    
    @RequestMapping(value = "/ajax/logout", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public String logout(HttpSession session) {
        Map data= new HashMap();
        try{
            session.invalidate();
            data.put("success", true);
            data.put("message", "Logout done");
            return Util.objectToJson(data);
        }catch(AuthenticationException ex){
            data.put("success", false);
            data.put("message", "Logout Error");
        }
        return Util.objectToJson(data);
    }
    
    @RequestMapping(value = "/ajax/userInSession", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public String userInSession() {
        Map data= new HashMap();
        UserAndRolesDto userAndRoles= getUserAndRoles();
        if(userAndRoles!=null){
            data.put("session", true);
            data.put("ba", securityService.getBasicAuthorization());
            data.put("user", userAndRoles.getUser());
            data.put("roles", userAndRoles.getRoles());
            
            return Util.objectToJson(data);
        }else{
            data.put("session", false);
            data.put("message", "No hay usuario en sesion");
        }
        return Util.objectToJson(data);
    }
    
    @RequestMapping(value = "/login", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView loginPage(HttpServletRequest request, HttpServletResponse response) {
        User user= securityService.getCurrentUser();
        if(user!=null){
            return getHome(request, response, "user");
        }
        return new ModelAndView("login");
    }

    @RequestMapping(value = "/denied", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView getDenied() {
        ModelAndView mav = new ModelAndView("denied");
        return mav;
    }
    
    private UserAndRolesDto getUserAndRoles(){
        UserAndRolesDto userAndRoles= new UserAndRolesDto();
        User user= securityService.getCurrentUser();
        if(user!=null){
            UserDto userDto= (UserDto) userMapper.entityToDto(user);
            Parameters p= new Parameters();
            p.whereEqual("user", user);
            p.orderBy("role.priorityCheck", "ASC");
            List<UserRole> userRoles= userRoleService.findByParameters(p);
            List<UserRoleDto> userRolesDto= (List<UserRoleDto>) userRoleMapper.listEntitiesToListDtos(userRoles);
            List<RoleDto> roles= new ArrayList<>();
            for(UserRoleDto userRole: userRolesDto){
                roles.add(userRole.getRole());
            }
            userAndRoles.setUser(userDto);
            userAndRoles.setRoles(roles);
            
            return userAndRoles;
        }else{
            return null;
        }
    }
    
}
