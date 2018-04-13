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
import com.dot.gcpbasedot.util.FileService;
import com.dot.gcpbasedot.util.Util;
import com.google.gson.Gson;
import com.lacv.system.model.constants.WebConstants;
import com.lacv.system.model.dtos.WebEntityDto;
import com.lacv.system.model.entities.User;
import java.io.File;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
            WebEntity webEntity = null;
            WebEntity parentWebEntity = null;
            if(jsonObject.has("webEntity")){
                parentWebEntity= webEntityService.loadById(jsonObject.getLong("webEntity"));
            }

            if (jsonObject.getString("entityRef").equals("folder")) {
                webEntity = webEntityService.createFolder(parentWebEntity, jsonObject.getString("name"));
            } else {
                webEntity = webEntityService.createEmptyFile(parentWebEntity, jsonObject.getString("name"));
            }

            WebEntityDto dto = (WebEntityDto) mapper.entityToDto(webEntity);
            resultData = Util.getOperationCallback(dto, "Creaci&oacute;n de " + entityRef + " realizada...", true);
        } catch (Exception e) {
            LOGGER.error("create " + entityRef, e);
            resultData = Util.getOperationCallback(null, "Error en creaci&oacute;n de " + entityRef + ": " + e.getMessage(), false);
        }
        return Util.getStringBytes(resultData);
    }

    @RequestMapping(value = "/update.htm")
    @ResponseBody
    @Override
    public byte[] update(@RequestParam String data, HttpServletRequest request) {
        JSONObject jsonObject = new JSONObject(data);

        if (jsonObject.has("id") && jsonObject.has("name")) {
            WebEntity webEntity = webEntityService.loadById(jsonObject.getLong("id"));
            if (!webEntity.getName().equals(jsonObject.getString("name"))) {
                String location = webConstants.LOCAL_DIR + WebConstants.ROOT_FOLDER + webEntity.getPath();
                FileService.renameFile(location + webEntity.getName(), location + jsonObject.getString("name"));
            }
        }

        return super.update(data, request);
    }
    
    @RequestMapping(value = "/update/byfilter.htm")
    @ResponseBody
    @Override
    public byte[] updateByFilter(@RequestParam(required= false) String filter, HttpServletRequest request) {
        JSONObject jsonObject = new JSONObject(filter);
        String resultData;
        try{
            Long destWebEntityId= jsonObject.getJSONObject("uv").getLong("webEntity");
            WebEntity destWebEntity= webEntityService.loadById(destWebEntityId);
            String destLocation= webConstants.LOCAL_DIR + WebConstants.ROOT_FOLDER + ((destWebEntity!=null)?destWebEntity.getPath():"");
            
            JSONArray fileIdToMove= jsonObject.getJSONObject("in").getJSONArray("id");
            for(int i=0; i<fileIdToMove.length(); i++){
                WebEntity sourceWebEntity= webEntityService.loadById(fileIdToMove.getLong(i));
                String sourceLocation= webConstants.LOCAL_DIR + WebConstants.ROOT_FOLDER + sourceWebEntity.getPath();
                File sourceFile= new File(sourceLocation + sourceWebEntity.getName());
                File destFile= new File(destLocation + ((destWebEntity!=null)?destWebEntity.getName():""));
                
                FileService.move(sourceFile, destFile);
            }
            
            return super.updateByFilter(filter, request);
        }catch(Exception e){
            resultData= Util.getOperationCallback(null, "Error moviendo los archivos " + e.getMessage(), false);
        }
        return Util.getStringBytes(resultData);
    }

    @RequestMapping(value = "/delete/byfilter.htm", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    @Override
    public String deleteByFilter(@RequestParam String filter) {
        String result = super.deleteByFilter(filter);
        JSONObject jsonResult = new JSONObject(result);
        if (jsonResult.getBoolean("success")) {
            JSONArray webEntitys = jsonResult.getJSONArray("data");
            for (int i = 0; i < webEntitys.length(); i++) {
                JSONObject webEntity = webEntitys.getJSONObject(i);
                String path = (webEntity.has("path")) ? webEntity.getString("path") : "";
                LOGGER.info("path: " + path);
                String location = webConstants.LOCAL_DIR + WebConstants.ROOT_FOLDER + path;

                FileService.deleteFile(location + webEntity.getString("name"));
            }
        }

        return result;
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
