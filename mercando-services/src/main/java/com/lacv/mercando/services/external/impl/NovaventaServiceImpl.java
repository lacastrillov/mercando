/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.services.external.impl;

import com.dot.gcpbasedot.dto.ExternalServiceDto;
import com.dot.gcpbasedot.service.ExternalServiceImpl;
import com.lacv.mercando.model.dtos.process.BasicPDto;
import com.lacv.mercando.model.dtos.process.NetworkPDto;
import com.lacv.mercando.model.dtos.process.ProductoPDto;
import com.lacv.mercando.model.dtos.process.SolicitudePDto;
import com.lacv.mercando.model.dtos.process.UsuarioPDto;
import com.lacv.mercando.services.external.NovaventaService;
import java.io.IOException;
import javax.annotation.PostConstruct;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;

/**
 *
 * @author grupot
 */
@Service
public class NovaventaServiceImpl extends ExternalServiceImpl implements NovaventaService {
    
    @PostConstruct
    public void init(){
        ExternalServiceDto service0= new ExternalServiceDto("maquinasNovaventaXml", "https://portal-contenido-novaventa.appspot.com/rest/{entity}/find/xml.htm", HttpMethod.GET, SolicitudePDto.class);
        service0.setResponseDataFormat(ExternalServiceDto.XML);
        super.enableExternalService(service0);
        
        ExternalServiceDto service1= new ExternalServiceDto("maquinasNovaventa", "https://portal-contenido-novaventa.appspot.com/rest/{entity}/find.htm", HttpMethod.GET, SolicitudePDto.class);
        super.enableExternalService(service1);
        
        ExternalServiceDto service2= new ExternalServiceDto("merakiDevices", "https://dashboard.meraki.com/api/v0/networks/{networkId}/devices", HttpMethod.GET, NetworkPDto.class);
        super.enableExternalService(service2);
        
        ExternalServiceDto service3= new ExternalServiceDto("noticiasCarroya", "http://www.carroya.com/noticias/", HttpMethod.POST, BasicPDto.class);
        service3.setResponseDataFormat(ExternalServiceDto.HTML);
        super.enableExternalService(service3);
        
        ExternalServiceDto service4= new ExternalServiceDto("estaInBody", "http://localhost:8084/tempprocess/ajax/inbody", HttpMethod.POST, UsuarioPDto.class);
        service4.setModeSendingData(ExternalServiceDto.IN_BODY);
        super.enableExternalService(service4);
        
        ExternalServiceDto service5= new ExternalServiceDto("estaInParameters", "http://localhost:8084/tempprocess/ajax/inparameters", HttpMethod.POST, ProductoPDto.class);
        super.enableExternalService(service5);
    }
    
    public String maquinasNovaventaXml(SolicitudePDto solicitude) throws IOException{
        return super.callExternalService("maquinasNovaventaXml", solicitude);
    }
    
    public String maquinasNovaventa(SolicitudePDto solicitude) throws IOException{
        return super.callExternalService("maquinasNovaventa", solicitude);
    }
    
}
