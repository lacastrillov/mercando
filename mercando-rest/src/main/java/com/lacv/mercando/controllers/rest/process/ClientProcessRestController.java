/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.rest.process;


import com.lacv.jmagrexs.annotation.DoProcess;
import com.lacv.jmagrexs.controller.rest.RestProcessController;
import com.lacv.jmagrexs.modules.common.model.dtos.BasicResultDto;
import com.lacv.jmagrexs.modules.common.model.entities.LogProcess;
import com.lacv.jmagrexs.modules.common.services.LogProcessService;
import com.lacv.jmagrexs.modules.common.services.PropertyService;
import com.lacv.jmagrexs.modules.mail.services.MailingService;
import com.lacv.jmagrexs.modules.security.constants.SecurityConstants;
import com.lacv.jmagrexs.modules.security.model.entities.Role;
import com.lacv.jmagrexs.modules.security.model.entities.User;
import com.lacv.jmagrexs.modules.security.model.entities.UserRole;
import com.lacv.jmagrexs.modules.security.services.RoleService;
import com.lacv.jmagrexs.modules.security.services.UserRoleService;
import com.lacv.jmagrexs.modules.security.services.UserService;
import com.lacv.jmagrexs.modules.security.services.bussiness.SecurityService;
import com.lacv.jmagrexs.util.AESEncrypt;
import com.lacv.mercando.model.constants.WebConstants;
import com.lacv.mercando.model.dtos.process.ContactUserPDto;
import com.lacv.mercando.model.dtos.process.RegisterUserPDto;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author lcastrillo
 */
@Controller
@RequestMapping(value="/rest/processClient")
public class ClientProcessRestController extends RestProcessController {
    
    @Autowired
    UserService userService;
    
    @Autowired
    RoleService roleService;
    
    @Autowired
    UserRoleService userRoleService;
    
    @Autowired
    LogProcessService logProcessService;
    
    @Autowired
    SecurityService securityService;
    
    @Autowired
    MailingService mailingService;
    
    @Autowired
    PropertyService propertyService;
    
    AESEncrypt myInstance= AESEncrypt.getDefault(SecurityConstants.SECURITY_SALT);
    
    @PostConstruct
    public void init(){
        super.addControlProcess("processClient", LogProcess.class, logProcessService);
    }
    
    @Override
    public String getClientId(){
        User user= securityService.getCurrentUser();
        return user.getUsername();
    }
    
    @DoProcess
    public BasicResultDto contactUser(ContactUserPDto contactUserPDto){
        BasicResultDto result= new BasicResultDto();
        
        Map<String, String> data= new HashMap<>();
        data.put("nombreUsuario", contactUserPDto.getUserName());
        data.put("correoUsuario", contactUserPDto.getMail());
        data.put("numeroCelular", contactUserPDto.getCellPhone());
        data.put("comentarios", contactUserPDto.getComments());
        
        String contactRecipient= propertyService.getString("CONTACT_RECIPIENT");
        boolean sent= mailingService.sendTemplateMail(contactRecipient, "contact_user", "Contacto de Usuario", data);
        
        result.setUsername(contactUserPDto.getMail());
        result.setSuccess(sent);
        if(sent){
            result.setMessage("Tu mensaje ha sido enviado, pronto nos pondremos en contacto contigo");
        }else{
            result.setMessage("Error al enviar el correo");
        }
        
        return result;
    }
    
    @DoProcess
    public BasicResultDto registerUser(RegisterUserPDto registerUserPDto){
        BasicResultDto result= new BasicResultDto();
        
        User user= userService.loadByParameter("email", registerUserPDto.getEmail());
        result.setUsername(registerUserPDto.getEmail());
        if(user==null){
            user= new User();
            user.setFirstName(registerUserPDto.getFirstName());
            user.setLastName(registerUserPDto.getLastName());
            user.setCell(registerUserPDto.getCell());
            user.setEmail(registerUserPDto.getEmail());
            user.setPassword(myInstance.encrypt(registerUserPDto.getPassword(), SecurityConstants.SECURITY_SEED_PASSW));
            user.setRegistrationDate(new Date());
            user.setFailedAttempts(0);
            user.setUsername(registerUserPDto.getEmail());
            user.setVerified(false);
            user.setStatus("Active");
            
            userService.create(user);
            
            Role role= roleService.loadByParameter("name", WebConstants.CLIENT_ROLE);
            UserRole userRole= new UserRole();
            userRole.setUser(user);
            userRole.setRole(role);
            userRoleService.create(userRole);
            
            result.setSuccess(true);
            result.setMessage("Te has registrado correctamente, ahora puedes iniciar sesi&oacute;n en tu cuenta...");
        }else{
            result.setSuccess(false);
            result.setMessage("El usuario no se puede crear porque ya existe otro con el mismo correo electr&oacute;nico!!!");
        }
        
        return result;
    }
    
}
