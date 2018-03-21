/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lacv.mercando.controllers.rest.process;


import com.lacv.mercando.model.dtos.process.MainLocationPDto;
import com.lacv.mercando.model.dtos.process.ProductoPDto;
import com.lacv.mercando.model.dtos.process.ResultadoPDto;
import com.lacv.mercando.model.dtos.process.UsuarioPDto;
import com.lacv.system.model.entities.LogProcess;
import com.lacv.system.services.LogProcessService;
import com.dot.gcpbasedot.annotation.DoProcess;
import com.dot.gcpbasedot.controller.RestProcessController;
import com.lacv.system.model.dtos.PropertyDto;
import com.lacv.system.model.dtos.process.BasicResultDto;
import com.lacv.system.model.entities.Property;
import com.lacv.system.model.entities.WebFile;
import com.lacv.system.services.PropertyService;
import com.lacv.system.services.WebFileService;
import java.io.InputStream;
import java.util.Date;
import javax.annotation.PostConstruct;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author lcastrillo
 */
@Controller
@RequestMapping(value="/processMainLocation")
public class MainLocationProcessController extends RestProcessController {
    
    @Autowired
    LogProcessService logProcessService;
    
    @Autowired
    WebFileService webFileService;
    
    @Autowired
    PropertyService propertyService;
    
    
    @PostConstruct
    public void init(){
        super.addControlProcess("processMainLocation", LogProcess.class, logProcessService);
    }
    
    @Override
    public String getClientId(){
        return "Admin Radar";
    }
    
    @DoProcess
    public ResultadoPDto crearMainLocation(MainLocationPDto mainLocation){
        ResultadoPDto result= new ResultadoPDto();
        
        mainLocation.setId((int)(Math.random()*100));
        mainLocation.setUuid("AB"+Math.random()*100);
        mainLocation.getProducto().setCantidad(mainLocation.getProducto().getCantidad()+10);
        mainLocation.getUsuario().setFechaRegistro(new Date());
        mainLocation.getUsuario().getRol().setEstado("Pendiente");
        result.setMainLocation(mainLocation);
        result.setMessage("Proceso realizado correctamente");
        result.setSuccess(true);
        
        return result;
    }
    
    public String crearMainLocationFiles(MainLocationPDto mainLocation, String fieldName, String fileName, String fileType, int fileSize, InputStream is){
        String path= "imagenes/ubicacionesPrincipales/";
        WebFile parentWebFile= webFileService.findByPath(path);
        
        try {
            String imageName=fileName;
            if(fieldName.equals("mlImage")){
                imageName= mainLocation.getMlName().replaceAll(" ", "_") + "_image."+FilenameUtils.getExtension(fileName);
            }
            WebFile webFile= webFileService.createByFileData(parentWebFile, 0, imageName, fileType, fileSize, is);
            
            return webFile.getLocation();
        } catch (Exception ex) {
            return ex.getMessage();
        }
    }
    
    @DoProcess
    public ProductoPDto activarUsuario(UsuarioPDto usuario){
        ProductoPDto result= new ProductoPDto();
        
        result.setActivo(false);
        result.setNombre("Portatil "+usuario.getNombre());
        result.setCantidad(22);
        result.setPrecio(55000);
        result.setCodigoDeBarra(usuario.getTelefono());
        
        return result;
    }
    
    @DoProcess
    public BasicResultDto insertarPropiedad(PropertyDto propertyDto){
        BasicResultDto result= new BasicResultDto();
        Property property= new Property();
        property.setId(propertyDto.getId());
        property.setKey(propertyDto.getKey());
        property.setStatus(propertyDto.getStatus());
        property.setType(propertyDto.getType());
        property.setValue(propertyDto.getValue());
        
        propertyService.insert(property);
        
        result.setUsername(getClientId());
        result.setMessage("Propiedad Insertada");
        result.setSuccess(true);
        
        return result;
    }
    
}
