/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.services.external;

import com.lacv.jmagrexs.service.ExternalService;
import com.lacv.mercando.model.dtos.process.BasicPDto;
import com.lacv.mercando.model.dtos.process.PlayerUserPDto;
import com.lacv.mercando.model.dtos.process.UserNamePDto;

/**
 *
 * @author grupot
 */
public interface BackbaseTrainingService extends ExternalService {
    
    String getBestScore(UserNamePDto userName);
    
    String getPlayer(UserNamePDto userName);
    
    String getAllPlayers(BasicPDto basic);
    
    String createPlayer(PlayerUserPDto playerUser);
    
}
