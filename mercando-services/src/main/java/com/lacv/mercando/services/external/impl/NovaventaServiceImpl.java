/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.services.external.impl;

import com.dot.gcpbasedot.dto.RESTServiceDto;
import com.dot.gcpbasedot.service.ExternalServiceImpl;
import com.lacv.mercando.model.dtos.process.BasicPDto;
import com.lacv.mercando.model.dtos.process.NetworkPDto;
import com.lacv.mercando.model.dtos.process.ProductoPDto;
import com.lacv.mercando.model.dtos.process.SolicitudePDto;
import com.lacv.mercando.model.dtos.process.UsuarioPDto;
import com.lacv.mercando.services.external.NovaventaService;
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
        RESTServiceDto service0= new RESTServiceDto("maquinasNovaventaXml", "https://portal-contenido-novaventa.appspot.com/rest/{entity}/find/xml.htm", HttpMethod.GET, SolicitudePDto.class);
        service0.setResponseDataFormat(RESTServiceDto.XML);
        super.enableRESTService(service0);
        
        RESTServiceDto service1= new RESTServiceDto("maquinasNovaventa", "https://portal-contenido-novaventa.appspot.com/rest/{entity}/find.htm", HttpMethod.GET, SolicitudePDto.class);
        super.enableRESTService(service1);
        
        RESTServiceDto service2= new RESTServiceDto("merakiDevices", "https://dashboard.meraki.com/api/v0/networks/{networkId}/devices", HttpMethod.GET, NetworkPDto.class);
        super.enableRESTService(service2);
        
        RESTServiceDto service3= new RESTServiceDto("noticiasCarroya", "http://www.carroya.com/noticias/", HttpMethod.POST, BasicPDto.class);
        service3.setResponseDataFormat(RESTServiceDto.HTML);
        super.enableRESTService(service3);
        
        RESTServiceDto service4= new RESTServiceDto("estaInBody", "http://localhost:8084/tempprocess/ajax/inbody", HttpMethod.POST, UsuarioPDto.class);
        service4.setModeSendingData(RESTServiceDto.IN_BODY);
        super.enableRESTService(service4);
        
        RESTServiceDto service5= new RESTServiceDto("estaInParameters", "http://localhost:8084/tempprocess/ajax/inparameters", HttpMethod.POST, ProductoPDto.class);
        super.enableRESTService(service5);
    }
    
    @Override
    public String maquinasNovaventaXml(SolicitudePDto solicitude) {
        return (String) super.callService("maquinasNovaventaXml", solicitude);
    }
    
    @Override
    public String maquinasNovaventa(SolicitudePDto solicitude) {
        return (String) super.callService("maquinasNovaventa", solicitude);
    }
    
    @Override
    public String merakiDevices(NetworkPDto network) {
        return (String) super.callService("merakiDevices", network);
    }
    
    @Override
    public String noticiasCarroya(BasicPDto basic) {
        return (String) super.callService("noticiasCarroya", basic);
    }
    
    @Override
    public String estaInBody(UsuarioPDto usuario) {
        return (String) super.callService("estaInBody", usuario);
    }
    
    @Override
    public String estaInParameters(ProductoPDto producto) {
        return (String) super.callService("estaInParameters", producto);
    }
    
}
