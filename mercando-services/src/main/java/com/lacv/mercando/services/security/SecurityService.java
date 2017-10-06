package com.lacv.mercando.services.security;

import com.dot.gcpbasedot.dto.MenuItem;
import com.lacv.mercando.model.dtos.security.UserDetailsDto;
import com.lacv.mercando.model.entities.User;
import java.util.List;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;


/**
 *
 * Interfaz que expone los servicios de seguridad
 *
 * @author Harley Aranda / Edison Neira Todos los derechos reservados
 * @Version 1.0
 */
public interface SecurityService {

    Authentication authenticate(Authentication a) throws AuthenticationException;
    
    String connect(User user);
    
    String connect(String username, String password) throws AuthenticationException;
    
    UserDetailsDto getUserDetails();
    
    User getCurrentUser();
    
    boolean checkAccessResource(String requestURI);
    
    List<MenuItem> configureVisibilityMenu(List<MenuItem> menuData);
    
    void reconfigureAccessControl();

}
