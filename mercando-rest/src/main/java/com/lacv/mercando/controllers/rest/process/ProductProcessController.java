/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.rest.process;


import com.lacv.mercando.model.dtos.process.BasicResultDto;
import com.lacv.mercando.model.entities.LogProcess;
import com.lacv.mercando.model.entities.User;
import com.lacv.mercando.services.LogProcessService;
import com.lacv.mercando.services.UserService;
import com.lacv.mercando.services.security.SecurityService;
import com.dot.gcpbasedot.annotation.DoProcess;
import com.dot.gcpbasedot.controller.RestProcessController;
import com.lacv.mercando.model.dtos.process.ActivationProductPDto;
import com.lacv.mercando.model.dtos.process.ProductBasicDataPDto;
import com.lacv.mercando.model.entities.Product;
import com.lacv.mercando.model.entities.WebFile;
import com.lacv.mercando.services.ProductService;
import com.lacv.mercando.services.WebFileService;
import com.lacv.mercando.services.mail.MailingService;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.PostConstruct;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author nalvarez
 */
@Controller
@RequestMapping(value="/processProduct")
public class ProductProcessController extends RestProcessController {
    
    @Autowired
    ProductService productService;
    
    @Autowired
    UserService userService;
    
    @Autowired
    LogProcessService logProcessService;
    
    @Autowired
    SecurityService securityService;
    
    @Autowired
    MailingService mailingService;
    
    @Autowired
    WebFileService webFileService;
    
    
    @PostConstruct
    public void init(){
        super.addControlProcess("processProduct", LogProcess.class, logProcessService);
    }
    
    @Override
    public String getClientId(){
        User user= securityService.getCurrentUser();
        return user.getUsername();
    }
    
    @DoProcess
    public BasicResultDto activarProducto(ActivationProductPDto activationProductPDto){
        BasicResultDto result= new BasicResultDto();
        
        Map<String, String> data= new HashMap<>();
        data.put("nombreUsuario", activationProductPDto.getContactUser().getUserName());
        data.put("correoUsuario", activationProductPDto.getContactUser().getMail());
        data.put("numeroCelular", activationProductPDto.getContactUser().getCellPhone());
        String comments= activationProductPDto.getContactUser().getComments();
        comments+="<br><br><b>productId:</b> "+activationProductPDto.getProductId();
        comments+="<br><br><b>productCode:</b> "+activationProductPDto.getProductCode();
        comments+="<br><br><b>brand:</b> "+activationProductPDto.getBrand();
        comments+="<br><br><b>registerDate:</b> "+activationProductPDto.getRegisterDate().toString();
        data.put("comentarios", comments);
        
        boolean sent= mailingService.sendTemplateMail(activationProductPDto.getContactUser().getMail(), "contact_user", "Contacto de Usuario", data);
        
        result.setUsername(activationProductPDto.getContactUser().getMail());
        result.setSuccess(sent);
        if(sent){
            result.setMessage("Producto Activado Correctamente");
        }else{
            result.setMessage("Error al activar el Producto");
        }
        
        return result;
    }
    
    @DoProcess
    public BasicResultDto adicionarFotos(ProductBasicDataPDto productBasicDataPDto){
        BasicResultDto result= new BasicResultDto();
        
        Product product= productService.loadById(productBasicDataPDto.getProductId());
        if(productBasicDataPDto.getPhotos()!=null && product!=null){
            result.setMessage("Se han adicionado "+productBasicDataPDto.getPhotos().size()+" fotos al producto "+product.getName());
            result.setSuccess(true);
        }else{
            result.setMessage("No se han adicionado fotos");
            result.setSuccess(false);
        }
        result.setUsername(getClientId());
                
        return result;
    }
    
    public String adicionarFotosFiles(ProductBasicDataPDto productBasicDataPDto, String fieldName, String fileName, String fileType, int fileSize, InputStream is){
        String path= "imagenes/fotosProducto/";
        WebFile parentWebFile= webFileService.findByPath(path);
        
        try {
            Product product= productService.loadById(productBasicDataPDto.getProductId());
            if(product!=null){
                String imageName=fileName;
                imageName= product.getName().replaceAll(" ", "_") + "_"+fieldName+"."+FilenameUtils.getExtension(fileName);
                WebFile webFile= webFileService.createByFileData(parentWebFile, 0, imageName, fileType, fileSize, is);

                return webFile.getLocation();
            }else{
                return "";
            }
        } catch (Exception ex) {
            return ex.getMessage();
        }
    }
    
}
