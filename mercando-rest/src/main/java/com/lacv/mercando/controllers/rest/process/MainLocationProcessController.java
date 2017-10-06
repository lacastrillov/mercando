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
import com.lacv.mercando.model.entities.LogProcess;
import com.lacv.mercando.services.LogProcessService;
import com.dot.gcpbasedot.annotation.DoProcess;
import com.dot.gcpbasedot.controller.RestProcessController;
import java.util.Date;
import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author nalvarez
 */
@Controller
@RequestMapping(value="/processMainLocation")
public class MainLocationProcessController extends RestProcessController {
    
    @Autowired
    LogProcessService logProcessService;
    
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
    
}
