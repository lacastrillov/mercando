/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.system.controllers.rest;

import com.lacv.system.model.entities.WebEntity;
import com.lacv.system.model.mappers.WebEntityMapper;
import com.dot.gcpbasedot.controller.RestEntityController;
import com.dot.gcpbasedot.dao.Parameters;
import com.dot.gcpbasedot.util.Util;
import com.google.gson.Gson;
import com.lacv.system.model.constants.WebConstants;
import com.lacv.system.model.dtos.WebEntityDto;
import com.lacv.system.model.entities.User;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.lacv.system.services.WebEntityService;
import com.lacv.system.services.security.SecurityService;

/**
 *
 * @author lcastrillo
 */
@Controller
@RequestMapping(value = "/webEntity")
public class WebEntityRestController extends RestEntityController {

    @Autowired
    WebEntityService webEntityService;

    @Autowired
    WebEntityMapper webEntityMapper;
    
    @Autowired
    SecurityService securityService;
    
    @Autowired
    WebConstants webConstants;
    

    @PostConstruct
    public void init() {
        super.addControlMapping("webEntity", webEntityService, webEntityMapper);
    }
    
    public String getClientId(){
        User user= securityService.getCurrentUser();
        return user.getUsername();
    }

    @RequestMapping(value = "/create.htm")
    @ResponseBody
    @Override
    public byte[] create(@RequestParam String data, HttpServletRequest request) {
        String resultData;
        try {
            JSONObject jsonObject = new JSONObject(data);
            jsonObject.put("author", getClientId());
            WebEntity webEntity;
            WebEntity parentWebEntity = null;
            if(jsonObject.has("webEntity")){
                parentWebEntity= webEntityService.loadById(jsonObject.getLong("webEntity"));
            }

            if (jsonObject.getString("entityRef").equals("folder")) {
                webEntity = webEntityService.createFolder(parentWebEntity, jsonObject.getString("name"));
            } else {
                webEntity = webEntityService.create(parentWebEntity, jsonObject.getString("name"), jsonObject.getString("entityRef"), jsonObject.getString("entityName"));
            }

            WebEntityDto dto = (WebEntityDto) mapper.entityToDto(webEntity);
            resultData = Util.getOperationCallback(dto, "Creaci&oacute;n de " + entityRef + " realizada...", true);
        } catch (Exception e) {
            LOGGER.error("create " + entityRef, e);
            resultData = Util.getOperationCallback(null, "Error en creaci&oacute;n de " + entityRef + ": " + e.getMessage(), false);
        }
        return Util.getStringBytes(resultData);
    }
    
    @RequestMapping(value = "/getNavigationTreeData.htm")
    @ResponseBody
    public byte[] getNavigationTreeData() {
        String resultData;
        try {
            Gson gson= new Gson();
            Map tree = new LinkedHashMap();
            Map childs= new LinkedHashMap();
            Parameters p= new Parameters();
            p.whereIsNull("webEntity");
            p.whereEqual("entityRef", "folder");
            p.orderBy("name", "ASC");
            List<WebEntity> webEntitys= webEntityService.findByParameters(p);
            for(WebEntity webEntity: webEntitys){
                childs.put(webEntity.getId()+"::"+webEntity.getName(), exploreInDepth(webEntity));
            }
            tree.put("0::Raíz", childs);
            resultData=gson.toJson(tree);
        } catch (Exception e) {
            LOGGER.error("getNavigationTreeData " + entityRef, e);
            resultData = "Error in getNavigationTreeData";
        }
        return Util.getStringBytes(resultData);
    }
    
    private Map exploreInDepth(WebEntity webEntity){
        Map child= new LinkedHashMap();
        Parameters p= new Parameters();
        p.whereEqual("webEntity", webEntity);
        p.whereEqual("entityRef", "folder");
        p.orderBy("name", "ASC");
        List<WebEntity> webEntitys= webEntityService.findByParameters(p);
        for(WebEntity childWebEntity: webEntitys){
            child.put(childWebEntity.getId()+"::"+childWebEntity.getName(), exploreInDepth(childWebEntity));
        }
        return child;
    }

}
