/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.services.external;

import com.dot.gcpbasedot.service.ExternalService;
import com.lacv.mercando.model.dtos.process.BasicPDto;
import com.lacv.mercando.model.dtos.process.NetworkPDto;
import com.lacv.mercando.model.dtos.process.ProductoPDto;
import com.lacv.mercando.model.dtos.process.SolicitudePDto;
import com.lacv.mercando.model.dtos.process.UsuarioPDto;


/**
 *
 * @author grupot
 */
public interface NovaventaService extends ExternalService {
    
    String maquinasNovaventaXml(SolicitudePDto solicitude);
    
    String maquinasNovaventa(SolicitudePDto solicitude);
    
    String merakiDevices(NetworkPDto network);
    
    String noticiasCarroya(BasicPDto basic);
    
    String estaInBody(UsuarioPDto usuario);
    
    String estaInParameters(ProductoPDto producto);
            
}
