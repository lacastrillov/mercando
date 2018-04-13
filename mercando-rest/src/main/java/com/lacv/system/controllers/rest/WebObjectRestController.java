/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.system.controllers.rest;

import com.lacv.system.model.entities.WebObject;
import com.lacv.system.model.mappers.WebObjectMapper;
import com.lacv.system.services.WebObjectService;
import com.dot.gcpbasedot.controller.RestEntityController;
import com.dot.gcpbasedot.dao.Parameters;
import com.dot.gcpbasedot.util.FileService;
import com.dot.gcpbasedot.util.Util;
import com.google.gson.Gson;
import com.lacv.system.model.constants.WebConstants;
import com.lacv.system.model.dtos.WebObjectDto;
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

/**
 *
 * @author lcastrillo
 */
@Controller
@RequestMapping(value = "/webObject")
public class WebObjectRestController extends RestEntityController {

    @Autowired
    WebObjectService webObjectService;

    @Autowired
    WebObjectMapper webObjectMapper;
    
    @Autowired
    WebConstants webConstants;
    

    @PostConstruct
    public void init() {
        super.addControlMapping("webObject", webObjectService, webObjectMapper);
    }

    @RequestMapping(value = "/create.htm")
    @ResponseBody
    @Override
    public byte[] create(@RequestParam String data, HttpServletRequest request) {
        String resultData;
        try {
            JSONObject jsonObject = new JSONObject(data);
            WebObject webObject = null;
            WebObject parentWebObject = null;
            if(jsonObject.has("webObject")){
                parentWebObject= webObjectService.loadById(jsonObject.getLong("webObject"));
            }

            if (jsonObject.getString("type").equals("folder")) {
                webObject = webObjectService.createFolder(parentWebObject, jsonObject.getString("name"));
            } else if (jsonObject.getString("type").equals("file")) {
                webObject = webObjectService.createEmptyFile(parentWebObject, jsonObject.getString("name"));
            }

            WebObjectDto dto = (WebObjectDto) mapper.entityToDto(webObject);
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
            WebObject webObject = webObjectService.loadById(jsonObject.getLong("id"));
            if (!webObject.getName().equals(jsonObject.getString("name"))) {
                String location = webConstants.LOCAL_DIR + WebConstants.ROOT_FOLDER + webObject.getPath();
                FileService.renameFile(location + webObject.getName(), location + jsonObject.getString("name"));
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
            Long destWebObjectId= jsonObject.getJSONObject("uv").getLong("webObject");
            WebObject destWebObject= webObjectService.loadById(destWebObjectId);
            String destLocation= webConstants.LOCAL_DIR + WebConstants.ROOT_FOLDER + ((destWebObject!=null)?destWebObject.getPath():"");
            
            JSONArray fileIdToMove= jsonObject.getJSONObject("in").getJSONArray("id");
            for(int i=0; i<fileIdToMove.length(); i++){
                WebObject sourceWebObject= webObjectService.loadById(fileIdToMove.getLong(i));
                String sourceLocation= webConstants.LOCAL_DIR + WebConstants.ROOT_FOLDER + sourceWebObject.getPath();
                File sourceFile= new File(sourceLocation + sourceWebObject.getName());
                File destFile= new File(destLocation + ((destWebObject!=null)?destWebObject.getName():""));
                
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
            JSONArray webObjects = jsonResult.getJSONArray("data");
            for (int i = 0; i < webObjects.length(); i++) {
                JSONObject webObject = webObjects.getJSONObject(i);
                String path = (webObject.has("path")) ? webObject.getString("path") : "";
                LOGGER.info("path: " + path);
                String location = webConstants.LOCAL_DIR + WebConstants.ROOT_FOLDER + path;

                FileService.deleteFile(location + webObject.getString("name"));
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
            p.whereIsNull("webObject");
            p.whereEqual("typeClass", "folder");
            p.orderBy("name", "ASC");
            List<WebObject> webObjects= webObjectService.findByParameters(p);
            for(WebObject webObject: webObjects){
                childs.put(webObject.getId()+"::"+webObject.getName(), exploreInDepth(webObject));
            }
            tree.put("0::Raíz", childs);
            resultData=gson.toJson(tree);
        } catch (Exception e) {
            LOGGER.error("getNavigationTreeData " + entityRef, e);
            resultData = "Error in getNavigationTreeData";
        }
        return Util.getStringBytes(resultData);
    }
    
    private Map exploreInDepth(WebObject webObject){
        Map child= new LinkedHashMap();
        Parameters p= new Parameters();
        p.whereEqual("webObject", webObject);
        p.whereEqual("typeClass", "folder");
        p.orderBy("name", "ASC");
        List<WebObject> webObjects= webObjectService.findByParameters(p);
        for(WebObject childWebObject: webObjects){
            child.put(childWebObject.getId()+"::"+childWebObject.getName(), exploreInDepth(childWebObject));
        }
        return child;
    }

}
