/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

util.importJS('/js/web/extlib/CommonExtView.js');

function ProductExtStore(){
    
    var Instance = this;
    
    var commonExtView= new CommonExtView();
    
    var baseAction= "";
    

    Instance.find= function(filter, params, func){
        Ext.Ajax.request({
            url: Ext.restContext+'/rest/product/'+baseAction+'find.htm',
            method: "GET",
            params: ((filter!==null && filter!=="")?"filter="+encodeURIComponent(filter):"") + params,
            success: function(response){
                var responseText= Ext.decode(response.responseText);
                func(responseText);
            },
            failure: function(response){
                commonExtView.processFailure(response);
            }
        });
    };
    
    Instance.save= function(operation, data, func){
        Ext.MessageBox.show({
            msg: 'Guardando...',
            width:200,
            wait:true,
            waitConfig: {interval:200}
        });
        Ext.Ajax.request({
            url: Ext.restContext+'/rest/product/'+baseAction+operation+'.htm',
            method: "POST",
            params: "data="+encodeURIComponent(data),
            success: function(response){
                Ext.MessageBox.hide();
                var responseText= Ext.decode(response.responseText);
                func(responseText);
            },
            failure: function(response){
                commonExtView.processFailure(response);
            }
        });
    };
    
    Instance.load= function(idEntity, func){
        Ext.Ajax.request({
            url: Ext.restContext+'/rest/product/'+baseAction+'load.htm',
            method: "GET",
            params: 'idEntity='+idEntity,
            success: function(response){
                var responseText= Ext.decode(response.responseText);
                func(responseText.data);
            },
            failure: function(response){
                commonExtView.processFailure(response);
            }
        });
    };
    
    Instance.upload= function(form, idEntity, func){
        form.submit({
            url: Ext.restContext+'/rest/product/'+baseAction+'diskupload/'+idEntity+'.htm',
            waitMsg: 'Subiendo archivo...',
            success: function(form, action) {
                func(action.result);
            },
            failure: function(response){
                commonExtView.processFailure(response);
            }
        });
    };
    
    Instance.import= function(form, typeReport, func){
        form.submit({
            url: Ext.restContext+'/rest/product/'+baseAction+'import/'+typeReport+'.htm',
            waitMsg: 'Importando archivo...',
            success: function(form, action) {
                func(action.result);
            },
            failure: function(response){
                commonExtView.processFailure(response);
            }
        });
    };
    
    Instance.doProcess= function(mainProcessRef, processName, data, func){
        Ext.MessageBox.show({
            msg: 'Ejecutando...',
            width:200,
            wait:true,
            waitConfig: {interval:200}
        });
        Ext.Ajax.request({
            url: Ext.restContext+"/rest/"+mainProcessRef+"/doProcess.htm",
            method: "POST",
            headers: {
                'Content-Type' : 'application/json'
            },
            jsonData: {'processName': processName, 'data': util.remakeJSONObject(data)},
            success: function(response){
                Ext.MessageBox.hide();
                func(response.responseText);
            },
            failure: function(response){
                commonExtView.processFailure(response);
            }
        });
    };
    
    Instance.deleteByFilter= function(filter, func){
        Ext.MessageBox.show({
            msg: 'Eliminando...',
            width:200,
            wait:true,
            waitConfig: {interval:200}
        });
        Ext.Ajax.request({
            url: Ext.restContext+'/rest/product/'+baseAction+'delete/byfilter.htm',
            method: "GET",
            params: (filter!==null && filter!=="")?"filter="+encodeURIComponent(filter):"",
            success: function(response){
                var responseText= Ext.decode(response.responseText);
                func(responseText);
                Ext.MessageBox.hide();
            },
            failure: function(response){
                commonExtView.processFailure(response);
            }
        });
    };

}