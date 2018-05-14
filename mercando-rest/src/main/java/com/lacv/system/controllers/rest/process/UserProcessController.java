/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.system.controllers.rest.process;


import com.dot.gcpbasedot.annotation.DoProcess;
import com.dot.gcpbasedot.controller.RestProcessController;
import com.dot.gcpbasedot.util.AESEncrypt;
import com.lacv.mercando.model.constants.WebConstants;
import com.lacv.system.model.dtos.process.BasicResultDto;
import com.lacv.system.model.dtos.process.CreatePasswordDto;
import com.lacv.system.model.entities.LogProcess;
import com.lacv.system.model.entities.User;
import com.lacv.system.services.LogProcessService;
import com.lacv.system.services.UserService;
import com.lacv.system.services.security.SecurityService;
import com.lacv.system.model.constants.SystemConstants;
import com.lacv.system.model.dtos.process.ContactUserPDto;
import com.lacv.system.model.dtos.process.RegisterUserPDto;
import com.lacv.system.model.entities.Role;
import com.lacv.system.model.entities.UserRole;
import com.lacv.system.services.PropertyService;
import com.lacv.system.services.RoleService;
import com.lacv.system.services.UserRoleService;
import com.lacv.system.services.mail.MailingService;
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
@RequestMapping(value="/processUser")
public class UserProcessController extends RestProcessController {
    
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
    
    AESEncrypt myInstance= AESEncrypt.getDefault(SystemConstants.SECURITY_SALT);
    
    @PostConstruct
    public void init(){
        super.addControlProcess("processUser", LogProcess.class, logProcessService);
    }
    
    @Override
    public String getClientId(){
        User user= securityService.getCurrentUser();
        return user.getUsername();
    }
    
    @DoProcess
    public BasicResultDto createPassword(CreatePasswordDto createPassword){
        BasicResultDto result= new BasicResultDto();
        result.setUsername(createPassword.getUsername());
        
        User user= userService.loadByParameter("username", createPassword.getUsername());
        
        result.setSuccess(false);
        if(user!=null){
            if(createPassword.getPassword().equals(createPassword.getConfirmPassword())){
                user.setPassword(myInstance.encrypt(createPassword.getPassword(), SystemConstants.SECURITY_SEED_PASSW));
                userService.update(user);
                result.setMessage("La contraseña se ha creado correctamente");
                result.setSuccess(true);
            }else{
                result.setMessage("Las contraseñas no coinciden");
            }
        }else{
            result.setMessage("No se encontro el usuario");
        }
        
        return result;
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
            user.setPassword(myInstance.encrypt(registerUserPDto.getPassword(), SystemConstants.SECURITY_SEED_PASSW));
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
