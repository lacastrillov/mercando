/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.services.external.impl;

import com.dot.gcpbasedot.dto.SOAPServiceDto;
import com.dot.gcpbasedot.service.ExternalServiceImpl;
import com.lacv.mercando.model.dtos.process.BasicPDto;
import com.lacv.mercando.model.dtos.process.PlayerUserPDto;
import com.lacv.mercando.model.dtos.process.UserNamePDto;
import com.lacv.mercando.services.external.BackbaseTrainingService;
import javax.annotation.PostConstruct;
import org.springframework.stereotype.Service;

/**
 *
 * @author grupot
 */
@Service
public class BackbaseTrainingServiceImpl extends ExternalServiceImpl implements BackbaseTrainingService {
    
    public String ENDPOINT="http://0.0.0.0:9999/training-server/PlayerManager";
    
    @PostConstruct
    public void init(){
        super.setBaseEnvelopeFile("backbaseTraining");
        
        SOAPServiceDto service1= new SOAPServiceDto("getBestScore", ENDPOINT, UserNamePDto.class);
        super.enableSOAPClient(service1);
        
        SOAPServiceDto service2= new SOAPServiceDto("getPlayer", ENDPOINT, UserNamePDto.class);
        super.enableSOAPClient(service2);
        
        SOAPServiceDto service3= new SOAPServiceDto("getAllPlayers", ENDPOINT, BasicPDto.class);
        super.enableSOAPClient(service3);
        
        SOAPServiceDto service4= new SOAPServiceDto("createPlayer", ENDPOINT, PlayerUserPDto.class);
        super.enableSOAPClient(service4);
    }

    @Override
    public String getBestScore(UserNamePDto userName) {
        return (String) super.callService("getBestScore", userName);
    }

    @Override
    public String getPlayer(UserNamePDto userName) {
        return (String) super.callService("getPlayer", userName);
    }

    @Override
    public String getAllPlayers(BasicPDto basic) {
        return (String) super.callService("getAllPlayers", basic);
    }

    @Override
    public String createPlayer(PlayerUserPDto playerUser) {
        return (String) super.callService("createPlayer", playerUser);
    }
    
}
