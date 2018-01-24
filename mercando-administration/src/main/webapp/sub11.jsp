<%-- 
    Document   : sub11
    Created on : 24/01/2018, 06:20:28 PM
    Author     : grupot
--%>




<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos - Administraci&oacute;n MERCANDO</title>
        <link rel="icon" type="image/icon" href="/img/habitares.png" /> 
        
            
    <script src="http://maps.google.com/maps?file=api&amp;v=3&amp;key=AIzaSyD_IP-Js3_ETbJ9psH605u-4iqZihp_-Jg&sensor=true" type="text/javascript"></script>
    
    <script src="/vista/js/libs/jquery/jquery-3.1.0.min.js" type="text/javascript"></script>
    <script src="/vista/js/util/Util.js"></script>
    <script src="/vista/js/web/usuario/UserAuthentication.js"></script>
    
    <script src="/vista/js/util/FileUploader.js"></script>
    <script src="/vista/js/util/GoogleMaps.js"></script>
    <script src="/vista/js/util/vkbeautify.0.99.00.beta.js"></script>

    <link href="/vista/css/bootstrap.min2.css" rel="stylesheet" type="text/css"/>
    <link href="/vista/css/navegador.css" rel="stylesheet" type="text/css">
    <link href="/vista/css/gridTemplateStyles.css" rel="stylesheet" type="text/css">
        
        



    <script type="text/javascript">
        var ExtJSVersion=4;
        var ExtJSLib="http://localhost:8080/ext-4.2.1";
    </script>
    <script src="http://localhost:8080/ext-4.2.1/examples/shared/include-ext.js"></script>


    <script>
        Ext.context= "";
    </script>
        
        <style>
            .x-html-editor-input textarea{white-space: pre !important;}
        </style>
        
        <!-- ############################ IMPORT LAYOUTS ################################ -->
        
        
        <!-- ############################ IMPORT MODELS ################################### -->
        
        
<script>

function ProductExtModel(){
    
    var Instance = this;
    
    
    Instance.defineModel= function(modelName){
        Ext.define(modelName, {
            extend: 'Ext.data.Model',
            fields: [{"name":"brand","type":"string"},{"name":"buyUnitPrice","type":"int"},{"name":"category"},{"name":"code","type":"string"},{"name":"commerce"},{"name":"description","type":"string"},{"name":"discount","type":"int"},{"name":"featured","type":"bool"},{"useNull":true,"name":"id","type":"int"},{"name":"keywords","type":"string"},{"name":"name","type":"string"},{"name":"orderLevel","type":"int"},{"name":"quantityPerUnit","type":"string"},{"dateFormat":"d/m/Y","name":"registerDate","type":"date"},{"name":"seggestedUnitPrice","type":"int"},{"name":"status","type":"string"},{"name":"subCategory"},{"name":"supplier"},{"name":"unitsInOrder","type":"int"},{"name":"unitsInStock","type":"int"}],
            validations: []
        });
    };
    
    
    
}
</script>
        
            
<script>

function CategoryExtModel(){
    
    var Instance = this;
    
    
    Instance.defineModel= function(modelName){
        Ext.define(modelName, {
            extend: 'Ext.data.Model',
            fields: [{"name":"description","type":"string"},{"useNull":true,"name":"id","type":"int"},{"name":"image","type":"string"},{"name":"name","type":"string"}],
            validations: [{"min":1,"field":"name","type":"length"}]
        });
    };
    
    
    
}
</script>
        
            
<script>

function CommerceExtModel(){
    
    var Instance = this;
    
    
    Instance.defineModel= function(modelName){
        Ext.define(modelName, {
            extend: 'Ext.data.Model',
            fields: [{"name":"commerceDescription","type":"string"},{"name":"commerceImage","type":"string"},{"name":"commerceName","type":"string"},{"name":"commerceTag","type":"string"},{"dateFormat":"d/m/Y","name":"creationDate","type":"date"},{"useNull":true,"name":"id","type":"int"},{"name":"mainLocation"}],
            validations: [{"min":1,"field":"commerceName","max":100,"type":"length"},{"min":0,"field":"commerceTag","max":200,"type":"length"},{"min":0,"field":"commerceImage","max":200,"type":"length"},{"min":0,"field":"commerceDescription","max":500,"type":"length"}]
        });
    };
    
    
    
}
</script>
        
            
<script>

function SubCategoryExtModel(){
    
    var Instance = this;
    
    
    Instance.defineModel= function(modelName){
        Ext.define(modelName, {
            extend: 'Ext.data.Model',
            fields: [{"name":"category"},{"name":"description","type":"string"},{"useNull":true,"name":"id","type":"int"},{"name":"image","type":"string"},{"name":"name","type":"string"}],
            validations: [{"min":1,"field":"name","type":"length"}]
        });
    };
    
    
    
}
</script>
        
            
<script>

function SupplierExtModel(){
    
    var Instance = this;
    
    
    Instance.defineModel= function(modelName){
        Ext.define(modelName, {
            extend: 'Ext.data.Model',
            fields: [{"name":"address","type":"string"},{"name":"city","type":"string"},{"name":"companyName","type":"string"},{"name":"contactName","type":"string"},{"name":"contactTitle","type":"string"},{"name":"country","type":"string"},{"useNull":true,"name":"id","type":"int"},{"name":"mail","type":"string"},{"name":"phoneMobile","type":"string"},{"name":"phoneOffice","type":"string"},{"name":"region","type":"string"},{"name":"user"}],
            validations: []
        });
    };
    
    
    
}
</script>
        
            
<script>

function ProductImageExtModel(){
    
    var Instance = this;
    
    
    Instance.defineModel= function(modelName){
        Ext.define(modelName, {
            extend: 'Ext.data.Model',
            fields: [{"useNull":true,"name":"id","type":"int"},{"name":"image","type":"string"},{"name":"order","type":"int"},{"name":"product"}],
            validations: []
        });
    };
    
    
    
}
</script>
        
        
        <!-- ############################ IMPORT STORES ################################### -->
        
        
<script>

function ProductExtStore(){
    
    var Instance = this;
    
    var commonExtView= new CommonExtView();
    
    var baseAction= "";
    
    
    Instance.getStore= function(modelName){
        var store = Ext.create('Ext.data.Store', {
            model: modelName,
            autoLoad: false,
            autoSync: true,
            pageSize: 50,
            remoteSort: true,
            proxy: {
                type: 'ajax',
                batchActions: false,
                simpleSortMode: true,
                actionMethods : {
                    create : 'POST',
                    read   : 'GET',
                    update : 'POST',
                    destroy: 'GET'
                },
                api: {
                    read: Ext.context+'/rest/product/'+baseAction+'find.htm',
                    create: Ext.context+'/rest/product/'+baseAction+'create.htm',
                    update: Ext.context+'/rest/product/'+baseAction+'update.htm',
                    destroy: Ext.context+'/rest/product/'+baseAction+'delete.htm'
                },
                reader: {
                    type: 'json',
                    successProperty: 'success',
                    root: 'data',
                    totalProperty: 'totalCount',
                    messageProperty: 'message'
                },
                writer: {
                    type: 'json',
                    //encode: true,
                    writeAllFields: false
                    //root: 'data'
                },
                extraParams: {
                    filter: null,
                    idEntity: null
                },
                listeners: {
                    exception: function(proxy, response, operation){
                        var errorMsg= operation.getError();
                        if(typeof errorMsg === "object"){
                            commonExtView.processFailure(errorMsg);
                        }else{
                            commonExtView.showErrorMessage(errorMsg);
                        }
                    }
                }
            },
            listeners: {
                load: function() {
                    if(this.gridComponent!==null){
                        this.gridComponent.getSelectionModel().deselectAll();
                    }
                },
                write: function(proxy, operation){
                    if (operation.action === 'destroy') {
                        Ext.MessageBox.alert('Status', operation.resultSet.message);
                    }
                }
            },
            sorters: [{
                property: 'id',
                direction: 'DESC'
            }],
            formComponent: null,
            gridComponent: null
        });
        store.getOrderProperty= function(){
            if(ExtJSVersion===4){
                return store.sorters.items[0]["property"];
            }else{
                return store.getSorters().items[0]["_id"];
            }
        };
        store.getOrderDir= function(){
            if(ExtJSVersion===4){
                return store.sorters.items[0]["direction"];
            }else{
                return store.getSorters().items[0]["_direction"];
            }
        };
        store.sortBy= function(property, direction){
            if(ExtJSVersion===4){
                store.sorters.items[0]["property"]= property;
                store.sorters.items[0]["direction"]= direction;
            }else{
                store.getSorters().clear();
                store.setSorters([{property:property, direction:direction}]);
            }
        };
        
        return store;
    };
    
    

    Instance.find= function(filter, params, func){
        Ext.Ajax.request({
            url: Ext.context+'/rest/product/'+baseAction+'find.htm',
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
            url: Ext.context+'/rest/product/'+baseAction+operation+'.htm',
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
            url: Ext.context+'/rest/product/'+baseAction+'load.htm',
            method: "GET",
            params: 'data='+encodeURIComponent('{"id":'+idEntity+'}'),
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
            url: Ext.context+'/rest/product/'+baseAction+'diskupload/'+idEntity+'.htm',
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
            url: Ext.context+'/rest/product/'+baseAction+'import/'+typeReport+'.htm',
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
            url: Ext.context+"/rest/"+mainProcessRef+"/doProcess.htm",
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
            url: Ext.context+'/rest/product/'+baseAction+'delete/byfilter.htm',
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
</script>
        
            
                
            
<script>

function CategoryExtStore(){
    
    var Instance = this;
    
    var commonExtView= new CommonExtView();
    
    var baseAction= "";
    
    
    Instance.getStore= function(modelName){
        var store = Ext.create('Ext.data.Store', {
            model: modelName,
            autoLoad: false,
            autoSync: true,
            pageSize: 50,
            remoteSort: true,
            proxy: {
                type: 'ajax',
                batchActions: false,
                simpleSortMode: true,
                actionMethods : {
                    create : 'POST',
                    read   : 'GET',
                    update : 'POST',
                    destroy: 'GET'
                },
                api: {
                    read: Ext.context+'/rest/category/'+baseAction+'find.htm',
                    create: Ext.context+'/rest/category/'+baseAction+'create.htm',
                    update: Ext.context+'/rest/category/'+baseAction+'update.htm',
                    destroy: Ext.context+'/rest/category/'+baseAction+'delete.htm'
                },
                reader: {
                    type: 'json',
                    successProperty: 'success',
                    root: 'data',
                    totalProperty: 'totalCount',
                    messageProperty: 'message'
                },
                writer: {
                    type: 'json',
                    //encode: true,
                    writeAllFields: false
                    //root: 'data'
                },
                extraParams: {
                    filter: null,
                    idEntity: null
                },
                listeners: {
                    exception: function(proxy, response, operation){
                        var errorMsg= operation.getError();
                        if(typeof errorMsg === "object"){
                            commonExtView.processFailure(errorMsg);
                        }else{
                            commonExtView.showErrorMessage(errorMsg);
                        }
                    }
                }
            },
            listeners: {
                load: function() {
                    if(this.gridComponent!==null){
                        this.gridComponent.getSelectionModel().deselectAll();
                    }
                },
                write: function(proxy, operation){
                    if (operation.action === 'destroy') {
                        Ext.MessageBox.alert('Status', operation.resultSet.message);
                    }
                }
            },
            sorters: [{
                property: 'id',
                direction: 'DESC'
            }],
            formComponent: null,
            gridComponent: null
        });
        store.getOrderProperty= function(){
            if(ExtJSVersion===4){
                return store.sorters.items[0]["property"];
            }else{
                return store.getSorters().items[0]["_id"];
            }
        };
        store.getOrderDir= function(){
            if(ExtJSVersion===4){
                return store.sorters.items[0]["direction"];
            }else{
                return store.getSorters().items[0]["_direction"];
            }
        };
        store.sortBy= function(property, direction){
            if(ExtJSVersion===4){
                store.sorters.items[0]["property"]= property;
                store.sorters.items[0]["direction"]= direction;
            }else{
                store.getSorters().clear();
                store.setSorters([{property:property, direction:direction}]);
            }
        };
        
        return store;
    };
    
    

    Instance.find= function(filter, params, func){
        Ext.Ajax.request({
            url: Ext.context+'/rest/category/'+baseAction+'find.htm',
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
            url: Ext.context+'/rest/category/'+baseAction+operation+'.htm',
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
            url: Ext.context+'/rest/category/'+baseAction+'load.htm',
            method: "GET",
            params: 'data='+encodeURIComponent('{"id":'+idEntity+'}'),
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
            url: Ext.context+'/rest/category/'+baseAction+'diskupload/'+idEntity+'.htm',
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
            url: Ext.context+'/rest/category/'+baseAction+'import/'+typeReport+'.htm',
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
            url: Ext.context+"/rest/"+mainProcessRef+"/doProcess.htm",
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
            url: Ext.context+'/rest/category/'+baseAction+'delete/byfilter.htm',
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
</script>
        
            
                
            
<script>

function CommerceExtStore(){
    
    var Instance = this;
    
    var commonExtView= new CommonExtView();
    
    var baseAction= "";
    
    
    Instance.getStore= function(modelName){
        var store = Ext.create('Ext.data.Store', {
            model: modelName,
            autoLoad: false,
            autoSync: true,
            pageSize: 50,
            remoteSort: true,
            proxy: {
                type: 'ajax',
                batchActions: false,
                simpleSortMode: true,
                actionMethods : {
                    create : 'POST',
                    read   : 'GET',
                    update : 'POST',
                    destroy: 'GET'
                },
                api: {
                    read: Ext.context+'/rest/commerce/'+baseAction+'find.htm',
                    create: Ext.context+'/rest/commerce/'+baseAction+'create.htm',
                    update: Ext.context+'/rest/commerce/'+baseAction+'update.htm',
                    destroy: Ext.context+'/rest/commerce/'+baseAction+'delete.htm'
                },
                reader: {
                    type: 'json',
                    successProperty: 'success',
                    root: 'data',
                    totalProperty: 'totalCount',
                    messageProperty: 'message'
                },
                writer: {
                    type: 'json',
                    //encode: true,
                    writeAllFields: false
                    //root: 'data'
                },
                extraParams: {
                    filter: null,
                    idEntity: null
                },
                listeners: {
                    exception: function(proxy, response, operation){
                        var errorMsg= operation.getError();
                        if(typeof errorMsg === "object"){
                            commonExtView.processFailure(errorMsg);
                        }else{
                            commonExtView.showErrorMessage(errorMsg);
                        }
                    }
                }
            },
            listeners: {
                load: function() {
                    if(this.gridComponent!==null){
                        this.gridComponent.getSelectionModel().deselectAll();
                    }
                },
                write: function(proxy, operation){
                    if (operation.action === 'destroy') {
                        Ext.MessageBox.alert('Status', operation.resultSet.message);
                    }
                }
            },
            sorters: [{
                property: 'id',
                direction: 'DESC'
            }],
            formComponent: null,
            gridComponent: null
        });
        store.getOrderProperty= function(){
            if(ExtJSVersion===4){
                return store.sorters.items[0]["property"];
            }else{
                return store.getSorters().items[0]["_id"];
            }
        };
        store.getOrderDir= function(){
            if(ExtJSVersion===4){
                return store.sorters.items[0]["direction"];
            }else{
                return store.getSorters().items[0]["_direction"];
            }
        };
        store.sortBy= function(property, direction){
            if(ExtJSVersion===4){
                store.sorters.items[0]["property"]= property;
                store.sorters.items[0]["direction"]= direction;
            }else{
                store.getSorters().clear();
                store.setSorters([{property:property, direction:direction}]);
            }
        };
        
        return store;
    };
    
    

    Instance.find= function(filter, params, func){
        Ext.Ajax.request({
            url: Ext.context+'/rest/commerce/'+baseAction+'find.htm',
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
            url: Ext.context+'/rest/commerce/'+baseAction+operation+'.htm',
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
            url: Ext.context+'/rest/commerce/'+baseAction+'load.htm',
            method: "GET",
            params: 'data='+encodeURIComponent('{"id":'+idEntity+'}'),
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
            url: Ext.context+'/rest/commerce/'+baseAction+'diskupload/'+idEntity+'.htm',
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
            url: Ext.context+'/rest/commerce/'+baseAction+'import/'+typeReport+'.htm',
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
            url: Ext.context+"/rest/"+mainProcessRef+"/doProcess.htm",
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
            url: Ext.context+'/rest/commerce/'+baseAction+'delete/byfilter.htm',
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
</script>
        
            
                
            
<script>

function SubCategoryExtStore(){
    
    var Instance = this;
    
    var commonExtView= new CommonExtView();
    
    var baseAction= "";
    
    
    Instance.getStore= function(modelName){
        var store = Ext.create('Ext.data.Store', {
            model: modelName,
            autoLoad: false,
            autoSync: true,
            pageSize: 50,
            remoteSort: true,
            proxy: {
                type: 'ajax',
                batchActions: false,
                simpleSortMode: true,
                actionMethods : {
                    create : 'POST',
                    read   : 'GET',
                    update : 'POST',
                    destroy: 'GET'
                },
                api: {
                    read: Ext.context+'/rest/subCategory/'+baseAction+'find.htm',
                    create: Ext.context+'/rest/subCategory/'+baseAction+'create.htm',
                    update: Ext.context+'/rest/subCategory/'+baseAction+'update.htm',
                    destroy: Ext.context+'/rest/subCategory/'+baseAction+'delete.htm'
                },
                reader: {
                    type: 'json',
                    successProperty: 'success',
                    root: 'data',
                    totalProperty: 'totalCount',
                    messageProperty: 'message'
                },
                writer: {
                    type: 'json',
                    //encode: true,
                    writeAllFields: false
                    //root: 'data'
                },
                extraParams: {
                    filter: null,
                    idEntity: null
                },
                listeners: {
                    exception: function(proxy, response, operation){
                        var errorMsg= operation.getError();
                        if(typeof errorMsg === "object"){
                            commonExtView.processFailure(errorMsg);
                        }else{
                            commonExtView.showErrorMessage(errorMsg);
                        }
                    }
                }
            },
            listeners: {
                load: function() {
                    if(this.gridComponent!==null){
                        this.gridComponent.getSelectionModel().deselectAll();
                    }
                },
                write: function(proxy, operation){
                    if (operation.action === 'destroy') {
                        Ext.MessageBox.alert('Status', operation.resultSet.message);
                    }
                }
            },
            sorters: [{
                property: 'id',
                direction: 'DESC'
            }],
            formComponent: null,
            gridComponent: null
        });
        store.getOrderProperty= function(){
            if(ExtJSVersion===4){
                return store.sorters.items[0]["property"];
            }else{
                return store.getSorters().items[0]["_id"];
            }
        };
        store.getOrderDir= function(){
            if(ExtJSVersion===4){
                return store.sorters.items[0]["direction"];
            }else{
                return store.getSorters().items[0]["_direction"];
            }
        };
        store.sortBy= function(property, direction){
            if(ExtJSVersion===4){
                store.sorters.items[0]["property"]= property;
                store.sorters.items[0]["direction"]= direction;
            }else{
                store.getSorters().clear();
                store.setSorters([{property:property, direction:direction}]);
            }
        };
        
        return store;
    };
    
    

    Instance.find= function(filter, params, func){
        Ext.Ajax.request({
            url: Ext.context+'/rest/subCategory/'+baseAction+'find.htm',
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
            url: Ext.context+'/rest/subCategory/'+baseAction+operation+'.htm',
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
            url: Ext.context+'/rest/subCategory/'+baseAction+'load.htm',
            method: "GET",
            params: 'data='+encodeURIComponent('{"id":'+idEntity+'}'),
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
            url: Ext.context+'/rest/subCategory/'+baseAction+'diskupload/'+idEntity+'.htm',
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
            url: Ext.context+'/rest/subCategory/'+baseAction+'import/'+typeReport+'.htm',
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
            url: Ext.context+"/rest/"+mainProcessRef+"/doProcess.htm",
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
            url: Ext.context+'/rest/subCategory/'+baseAction+'delete/byfilter.htm',
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
</script>
        
            
                
            
<script>

function SupplierExtStore(){
    
    var Instance = this;
    
    var commonExtView= new CommonExtView();
    
    var baseAction= "";
    
    
    Instance.getStore= function(modelName){
        var store = Ext.create('Ext.data.Store', {
            model: modelName,
            autoLoad: false,
            autoSync: true,
            pageSize: 50,
            remoteSort: true,
            proxy: {
                type: 'ajax',
                batchActions: false,
                simpleSortMode: true,
                actionMethods : {
                    create : 'POST',
                    read   : 'GET',
                    update : 'POST',
                    destroy: 'GET'
                },
                api: {
                    read: Ext.context+'/rest/supplier/'+baseAction+'find.htm',
                    create: Ext.context+'/rest/supplier/'+baseAction+'create.htm',
                    update: Ext.context+'/rest/supplier/'+baseAction+'update.htm',
                    destroy: Ext.context+'/rest/supplier/'+baseAction+'delete.htm'
                },
                reader: {
                    type: 'json',
                    successProperty: 'success',
                    root: 'data',
                    totalProperty: 'totalCount',
                    messageProperty: 'message'
                },
                writer: {
                    type: 'json',
                    //encode: true,
                    writeAllFields: false
                    //root: 'data'
                },
                extraParams: {
                    filter: null,
                    idEntity: null
                },
                listeners: {
                    exception: function(proxy, response, operation){
                        var errorMsg= operation.getError();
                        if(typeof errorMsg === "object"){
                            commonExtView.processFailure(errorMsg);
                        }else{
                            commonExtView.showErrorMessage(errorMsg);
                        }
                    }
                }
            },
            listeners: {
                load: function() {
                    if(this.gridComponent!==null){
                        this.gridComponent.getSelectionModel().deselectAll();
                    }
                },
                write: function(proxy, operation){
                    if (operation.action === 'destroy') {
                        Ext.MessageBox.alert('Status', operation.resultSet.message);
                    }
                }
            },
            sorters: [{
                property: 'id',
                direction: 'DESC'
            }],
            formComponent: null,
            gridComponent: null
        });
        store.getOrderProperty= function(){
            if(ExtJSVersion===4){
                return store.sorters.items[0]["property"];
            }else{
                return store.getSorters().items[0]["_id"];
            }
        };
        store.getOrderDir= function(){
            if(ExtJSVersion===4){
                return store.sorters.items[0]["direction"];
            }else{
                return store.getSorters().items[0]["_direction"];
            }
        };
        store.sortBy= function(property, direction){
            if(ExtJSVersion===4){
                store.sorters.items[0]["property"]= property;
                store.sorters.items[0]["direction"]= direction;
            }else{
                store.getSorters().clear();
                store.setSorters([{property:property, direction:direction}]);
            }
        };
        
        return store;
    };
    
    

    Instance.find= function(filter, params, func){
        Ext.Ajax.request({
            url: Ext.context+'/rest/supplier/'+baseAction+'find.htm',
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
            url: Ext.context+'/rest/supplier/'+baseAction+operation+'.htm',
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
            url: Ext.context+'/rest/supplier/'+baseAction+'load.htm',
            method: "GET",
            params: 'data='+encodeURIComponent('{"id":'+idEntity+'}'),
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
            url: Ext.context+'/rest/supplier/'+baseAction+'diskupload/'+idEntity+'.htm',
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
            url: Ext.context+'/rest/supplier/'+baseAction+'import/'+typeReport+'.htm',
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
            url: Ext.context+"/rest/"+mainProcessRef+"/doProcess.htm",
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
            url: Ext.context+'/rest/supplier/'+baseAction+'delete/byfilter.htm',
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
</script>
        
            
                
            
<script>

function ProductImageExtStore(){
    
    var Instance = this;
    
    var commonExtView= new CommonExtView();
    
    var baseAction= "";
    
    
    Instance.getStore= function(modelName){
        var store = Ext.create('Ext.data.Store', {
            model: modelName,
            autoLoad: false,
            autoSync: true,
            pageSize: 50,
            remoteSort: true,
            proxy: {
                type: 'ajax',
                batchActions: false,
                simpleSortMode: true,
                actionMethods : {
                    create : 'POST',
                    read   : 'GET',
                    update : 'POST',
                    destroy: 'GET'
                },
                api: {
                    read: Ext.context+'/rest/productImage/'+baseAction+'find.htm',
                    create: Ext.context+'/rest/productImage/'+baseAction+'create.htm',
                    update: Ext.context+'/rest/productImage/'+baseAction+'update.htm',
                    destroy: Ext.context+'/rest/productImage/'+baseAction+'delete.htm'
                },
                reader: {
                    type: 'json',
                    successProperty: 'success',
                    root: 'data',
                    totalProperty: 'totalCount',
                    messageProperty: 'message'
                },
                writer: {
                    type: 'json',
                    //encode: true,
                    writeAllFields: false
                    //root: 'data'
                },
                extraParams: {
                    filter: null,
                    idEntity: null
                },
                listeners: {
                    exception: function(proxy, response, operation){
                        var errorMsg= operation.getError();
                        if(typeof errorMsg === "object"){
                            commonExtView.processFailure(errorMsg);
                        }else{
                            commonExtView.showErrorMessage(errorMsg);
                        }
                    }
                }
            },
            listeners: {
                load: function() {
                    if(this.gridComponent!==null){
                        this.gridComponent.getSelectionModel().deselectAll();
                    }
                },
                write: function(proxy, operation){
                    if (operation.action === 'destroy') {
                        Ext.MessageBox.alert('Status', operation.resultSet.message);
                    }
                }
            },
            sorters: [{
                property: 'order',
                direction: 'ASC'
            }],
            formComponent: null,
            gridComponent: null
        });
        store.getOrderProperty= function(){
            if(ExtJSVersion===4){
                return store.sorters.items[0]["property"];
            }else{
                return store.getSorters().items[0]["_id"];
            }
        };
        store.getOrderDir= function(){
            if(ExtJSVersion===4){
                return store.sorters.items[0]["direction"];
            }else{
                return store.getSorters().items[0]["_direction"];
            }
        };
        store.sortBy= function(property, direction){
            if(ExtJSVersion===4){
                store.sorters.items[0]["property"]= property;
                store.sorters.items[0]["direction"]= direction;
            }else{
                store.getSorters().clear();
                store.setSorters([{property:property, direction:direction}]);
            }
        };
        
        return store;
    };
    
    

    Instance.find= function(filter, params, func){
        Ext.Ajax.request({
            url: Ext.context+'/rest/productImage/'+baseAction+'find.htm',
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
            url: Ext.context+'/rest/productImage/'+baseAction+operation+'.htm',
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
            url: Ext.context+'/rest/productImage/'+baseAction+'load.htm',
            method: "GET",
            params: 'data='+encodeURIComponent('{"id":'+idEntity+'}'),
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
            url: Ext.context+'/rest/productImage/'+baseAction+'diskupload/'+idEntity+'.htm',
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
            url: Ext.context+'/rest/productImage/'+baseAction+'import/'+typeReport+'.htm',
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
            url: Ext.context+"/rest/"+mainProcessRef+"/doProcess.htm",
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
            url: Ext.context+'/rest/productImage/'+baseAction+'delete/byfilter.htm',
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
</script>
        
        
        <!-- ############################ IMPORT VIEWS ################################### -->
        
        
             
        

<script>

function ProductExtView(parentExtController, parentExtView){
    
    var Instance= this;
    
    Instance.id= "/product";
    
    Instance.modelName="ProductModel";
    
    var util= new Util();
    
    // MODELS **********************************************
    
    Instance.entityExtModel= new ProductExtModel();
    
    // STORES **********************************************
    
    Instance.entityExtStore= new ProductExtStore();
    
    // COMPONENTS *******************************************
    
    Instance.commonExtView= new CommonExtView(parentExtController, Instance, 'Product');
    
    //*******************************************************
    
    
    Instance.init= function(){
        Instance.typeView= "Parent";
        Instance.pluralEntityTitle= 'Productos';
        Instance.singularEntityTitle= 'Producto';
        Instance.entityExtModel.defineModel(Instance.modelName);
        Instance.store= Instance.entityExtStore.getStore(Instance.modelName);
        
        Instance.createMainView();
    };
    
    Instance.setFilterStore= function(filter){
        
            Instance.store.getProxy().extraParams.filter= filter;
        
        
    };
    
    Instance.reloadPageStore= function(page){
        
            Instance.store.loadPage(page);
        
        
    };
    
    
    
    
    function getFormContainer(childExtControllers){
        var formFields= [{"xtype":"numberfield","fieldLabel":"Id","name":"id","readOnly":true},{"fieldLabel":"C&oacute;digo","name":"code"},{"fieldLabel":"Nombre","name":"name"},{"fieldLabel":"Marca","name":"brand"},{"fieldLabel":"Cantidad por unidad","name":"quantityPerUnit"},{"xtype":"numberfield","fieldLabel":"Precio Sugerido","name":"seggestedUnitPrice"},{"xtype":"numberfield","fieldLabel":"Precio Unitario","name":"buyUnitPrice"},{"xtype":"numberfield","fieldLabel":"Descuento","name":"discount"},{"xtype":"numberfield","fieldLabel":"Unidades en Stock","name":"unitsInStock"},{"xtype":"numberfield","fieldLabel":"Unidades en Ordenes","name":"unitsInOrder"},{"xtype":"datefield","fieldLabel":"Fecha Registro","name":"registerDate","format":"d/m/Y","tooltip":"Seleccione la fecha"},{"fieldLabel":"Palabras clave","name":"keywords"},{"xtype":"numberfield","fieldLabel":"Orden","name":"orderLevel"},{"xtype":"textarea","fieldLabel":"Descripci&oacute;n","name":"description","height":200},{"xtype":"checkbox","uncheckedValue":"false","fieldLabel":"Destacado","name":"featured","inputValue":"true"},Instance.commonExtView.getSimpleCombobox('status','Estado','form',['Publicado','Agotado','Despublicado','Descontinuado','Eliminado']),(function(){ return Instance.formComboboxCategory;})(),(function(){ return Instance.formComboboxSubCategory;})(),(function(){ return Instance.formComboboxSupplier;})(),(function(){ return Instance.formComboboxCommerce;})()];

        var renderReplacements= [{"component":Instance.formComboboxCategory,"replace":{"field":"category","attribute":"id"}},{"component":Instance.formComboboxSubCategory,"replace":{"field":"subCategory","attribute":"id"}},{"component":Instance.formComboboxSupplier,"replace":{"field":"supplier","attribute":"id"}},{"component":Instance.formComboboxCommerce,"replace":{"field":"commerce","attribute":"id"}}];

        var additionalButtons= [];

        Instance.defineWriterForm(formFields, renderReplacements, additionalButtons);
        
        var itemsForm= [{
            itemId: 'formProduct',
            xtype: 'writerformProduct',
            border: false,
            width: '100%',
            listeners: {
                create: function(form, data){
                    Instance.entityExtStore.save('create', JSON.stringify(data), parentExtController.formSavedResponse);
                },
                update: function(form, data){
                    Instance.entityExtStore.save("update", JSON.stringify(data), parentExtController.formSavedResponse);
                },
                render: function(panel) {
                    Instance.commonExtView.enableManagementTabHTMLEditor();
                }
            }
        }];
        
        if(Instance.typeView==="Parent"){
            itemsForm.push(getChildsExtViewTabs(childExtControllers));
        }
        
        return Ext.create('Ext.container.Container', {
            id: 'formContainerProduct',
            title: 'Formulario',
            type: 'fit',
            align: 'stretch',
            items: itemsForm
        });
    };
    
    function getChildsExtViewTabs(childExtControllers){
        var items=[];
        var jsonTypeChildExtViews= {"productImage":"tcv_1_to_1"};
        childExtControllers.forEach(function(childExtController) {
            var itemTab= null;
            if(jsonTypeChildExtViews[childExtController.entityRef]==="tcv_standard"){
                itemTab= {
                    xtype:'tabpanel',
                    title: childExtController.entityExtView.pluralEntityTitle,
                    plain:true,
                    activeTab: 0,
                    style: 'background-color:#dfe8f6; padding:10px;',
                    defaults: {bodyStyle: 'padding:15px', autoScroll:true},
                    items:[
                        childExtController.entityExtView.gridContainer,

                        childExtController.entityExtView.formContainer
                    ]
                };
            }else if(jsonTypeChildExtViews[childExtController.entityRef]==="tcv_1_to_1"){
                itemTab= {
                    xtype:'tabpanel',
                    title: childExtController.entityExtView.singularEntityTitle,
                    plain:true,
                    activeTab: 0,
                    style: 'background-color:#dfe8f6; padding:10px;',
                    defaults: {bodyStyle: 'padding:15px', autoScroll:true},
                    items:[
                        childExtController.entityExtView.formContainer
                    ]
                };
            }else if(jsonTypeChildExtViews[childExtController.entityRef]==="tcv-n-n-multicheck"){
                itemTab= childExtController.entityExtView.checkboxGroupContainer;
            }
            
            items.push(itemTab);
        });
        
        var tabObect= {
            xtype:'tabpanel',
            plain:true,
            activeTab: 0,
            style: 'padding:25px 15px 45px 15px;',
            items:items
        };
        
        return tabObect;
    };
    
    Instance.setFormActiveRecord= function(record){
        Instance.formComponent.setActiveRecord(record || null);
    };
    
    Instance.defineWriterForm= function(fields, renderReplacements, additionalButtons){
        Ext.define('WriterFormProduct', {
            extend: 'Ext.form.Panel',
            alias: 'widget.writerformProduct',

            requires: ['Ext.form.field.Text'],

            initComponent: function(){
                //this.addEvents('create');
                
                var buttons= [];
                
                buttons= [{
                    iconCls: 'icon-save',
                    itemId: 'saveProduct',
                    text: 'Actualizar',
                    disabled: true,
                    scope: this,
                    handler: this.onSave
                },
                
                {
                    //iconCls: 'icon-user-add',
                    text: 'Crear',
                    scope: this,
                    handler: this.onCreate
                }, {
                    //iconCls: 'icon-reset',
                    text: 'Limpiar',
                    scope: this,
                    handler: this.onReset
                },
                
                {
                    text: '&#x25BC; Ver todo',
                    scope: this,
                    handler: this.onSeeAll
                },
                '|'];
                
                if(additionalButtons){
                    for(var i=0; i<additionalButtons.length; i++){
                        buttons.push(additionalButtons[i]);
                    }
                }
                Ext.apply(this, {
                    activeRecord: null,
                    //iconCls: 'icon-user',
                    frame: false,
                    defaultType: 'textfield',
                    bodyPadding: 15,
                    fieldDefaults: {
                        minWidth: 300,
                        anchor: '50%',
                        labelAlign: 'right'
                    },
                    items: fields,
                    dockedItems: [{
                        xtype: 'toolbar',
                        dock: 'bottom',
                        ui: 'footer',
                        items: buttons
                    }]
                });
                this.callParent();
            },

            setActiveRecord: function(record){
                this.activeRecord = record;
                if (this.activeRecord) {
                    if(this.down('#saveProduct')!==null){
                        this.down('#saveProduct').enable();
                    }
                    this.getForm().loadRecord(this.activeRecord);
                    //this.getForm().setValues(this.activeRecord.data);
                    this.renderReplaceActiveRecord(this.activeRecord);
                } else {
                    if(this.down('#saveProduct')!==null){
                        this.down('#saveProduct').disable();
                    }
                    this.getForm().reset();
                }
            },
                    
            getActiveRecord: function(){
                return this.activeRecord;
            },
            
            onSave: function(){
                var active = this.activeRecord,
                    form = this.getForm();
            
                if (!active) {
                    return;
                }
                if (form.isValid()) {
                    this.fireEvent('update', this, form.getValues());
                    //form.updateRecord(active);
                    //this.onReset();
                }
            },

            onCreate: function(){
                var form = this.getForm();

                if (form.isValid()) {
                    this.fireEvent('create', this, form.getValues());
                    //form.reset();
                }

            },

            onReset: function(){
                this.getForm().reset();
                parentExtController.loadFormData("");
            },
                    
            onSeeAll: function(){
                this.doLayout();
            },
            
            renderReplaceActiveRecord: function(record){
                if(renderReplacements){
                    for(var i=0; i<renderReplacements.length; i++){
                        var renderReplace= renderReplacements[i];
                        var replaceField= renderReplace.replace.field;
                        var replaceAttribute= renderReplace.replace.attribute;
                        var value="";
                        
                        if (typeof record.data[replaceField] === "object" && Object.getOwnPropertyNames(record.data[replaceField]).length === 0){
                            value= "";
                        }else if(replaceAttribute.indexOf(".")===-1 && replaceField in record.data){
                            value= record.data[replaceField][replaceAttribute];
                        }else{
                            var niveles= replaceAttribute.split(".");
                            try{
                                switch(niveles.length){
                                    case 2:
                                        value= record.data[replaceField][niveles[0]][niveles[1]];
                                        break;
                                    case 3:
                                        value= record.data[replaceField][niveles[0]][niveles[1]][niveles[2]];
                                        break;
                                    case 4:
                                        value= record.data[replaceField][niveles[0]][niveles[1]][niveles[2]][niveles[3]];
                                        break;
                                    case 5:
                                        value= record.data[replaceField][niveles[0]][niveles[1]][niveles[2]][niveles[3]][niveles[4]];
                                        break;
                                }
                            }catch(err){
                                console.log(err);
                            }
                            
                        }
                        if(typeof(value) !== 'undefined'){
                            renderReplace.component.setValue(value);
                        }
                    }
                }
                return record;
            }
    
        });
        
    };
    
    
    
    
    function getGridContainer(){
        var idGrid= 'gridProduct';
        var gridColumns= [{"dataIndex":"id","width":100,"header":"Id","sortable":true},{"field":{"type":"textfield"},"dataIndex":"code","width":200,"header":"C&oacute;digo","sortable":true},{"renderer":nameEntityRender,"field":{"type":"textfield"},"dataIndex":"name","width":200,"header":"Nombre","sortable":true},{"field":{"type":"textfield"},"dataIndex":"brand","width":200,"header":"Marca","sortable":true},{"field":{"type":"textfield"},"dataIndex":"quantityPerUnit","width":200,"header":"Cantidad por unidad","sortable":true},{"editor":{"xtype":"numberfield"},"dataIndex":"seggestedUnitPrice","width":200,"header":"Precio Sugerido","sortable":true},{"editor":{"xtype":"numberfield"},"dataIndex":"buyUnitPrice","width":200,"header":"Precio Unitario","sortable":true},{"editor":{"xtype":"numberfield"},"dataIndex":"discount","width":200,"header":"Descuento","sortable":true},{"editor":{"xtype":"numberfield"},"dataIndex":"unitsInStock","width":200,"header":"Unidades en Stock","sortable":true},{"editor":{"xtype":"numberfield"},"dataIndex":"unitsInOrder","width":200,"header":"Unidades en Ordenes","sortable":true},{"editor":{"xtype":"datefield","format":"d/m/Y"},"xtype":"datecolumn","dataIndex":"registerDate","width":200,"format":"d/m/Y","header":"Fecha Registro","sortable":true},{"field":{"type":"textfield"},"dataIndex":"keywords","width":200,"header":"Palabras clave","sortable":true},{"editor":{"xtype":"numberfield"},"dataIndex":"orderLevel","width":200,"header":"Orden","sortable":true},{"field":{"type":"textfield"},"dataIndex":"description","width":200,"header":"Descripci&oacute;n","sortable":true},{"editor":{"xtype":"checkbox","cls":"x-grid-checkheader-editor"},"dataIndex":"featured","width":200,"header":"Destacado","sortable":true},{"editor":Instance.commonExtView.getSimpleCombobox('status','Estado','grid',['Publicado','Agotado','Despublicado','Descontinuado','Eliminado']),"dataIndex":"status","width":200,"header":"Estado","sortable":true},{"editor":Instance.gridComboboxCategory,"renderer":Instance.comboboxCategoryRender,"dataIndex":"category","width":200,"header":"Categor&iacute;a"},{"editor":Instance.gridComboboxSubCategory,"renderer":Instance.comboboxSubCategoryRender,"dataIndex":"subCategory","width":200,"header":"Sub Categor&iacute;a"},{"editor":Instance.gridComboboxSupplier,"renderer":Instance.comboboxSupplierRender,"dataIndex":"supplier","width":200,"header":"Proveedor"},{"editor":Instance.gridComboboxCommerce,"renderer":Instance.comboboxCommerceRender,"dataIndex":"commerce","width":200,"header":"Comercio"}];
        
        Instance.emptyModel= {"unitsInStock":"","featured":"","subCategory":"","code":"","keywords":"","discount":"","description":"","quantityPerUnit":"","buyUnitPrice":"","commerce":"","seggestedUnitPrice":"","unitsInOrder":"","orderLevel":"","supplier":"","name":"","category":"","brand":"","registerDate":"","status":""};
        Instance.getEmptyRec= function(){
            return new ProductModel(Instance.emptyModel);
        };
        
        var store= Instance.store;
        

        Instance.defineWriterGrid('Productos', gridColumns);
        
        return Ext.create('Ext.container.Container', {
            id: 'gridContainerProduct',
            title: 'Listado',
            
            layout: {
                type: 'vbox',
                align: 'stretch'
            },
            items: [{
                itemId: idGrid,
                xtype: 'writergridProduct',
                style: 'border: 0px',
                flex: 1,
                store: store,
                disableSelection: false,
                trackMouseOver: !false,
                listeners: {
                    selectionchange: function(selModel, selected) {
                        if(selected[0]){
                            parentExtController.setFormData(selected[0]);
                        }
                    },
                    export: function(typeReport){
                        var filterData= JSON.stringify(parentExtController.filter);
                        filterData= filterData.replaceAll("{","(").replaceAll("}",")");
                        var data= "?filter="+filterData;
                        data+="&limit="+store.pageSize+"&page="+store.currentPage;
                        data+="&sort="+store.getOrderProperty()+"&dir="+store.getOrderDir();
                        
                        switch(typeReport){
                            case "json":
                                var urlFind= store.proxy.api.read;
                                window.open(urlFind+data,'_blank');
                                break;
                            case "xml":
                                var urlFind= store.proxy.api.read.replace("find.htm","find/xml.htm");
                                window.open(urlFind+data,'_blank');
                                break;
                            case "xls":
                                var urlFind= store.proxy.api.read.replace("find.htm","find/xls.htm");
                                window.open(urlFind+data,'_blank');
                                break;
                        }
                    }
                }
            }],
            listeners: {
                activate: function(panel) {
                    //store.loadPage(1);
                }
            }
        });
    };
    
    Instance.setValueInEmptyModel= function(fieldName, value){
        Instance.emptyModel[fieldName]= value;
        Instance.getEmptyRec= function(){
            return new ProductModel(Instance.emptyModel);
        };
    };
    
    function getComboboxLimit(store){
        var combobox= Instance.commonExtView.getSimpleCombobox('limit', 'L&iacute;mite', 'config', [50, 100, 200, 500]);
        combobox.addListener('change',function(record){
            if(record.getValue()!=="" && store.pageSize!==record.getValue()){
                store.pageSize=record.getValue();
                Instance.reloadPageStore(1);
            }
        }, this);
        combobox.labelWidth= 46;
        combobox.width= 125;
        combobox.setValue(50);
        
        return combobox;
    }
    
    function getComboboxOrderBy(store){
        var combobox= Instance.commonExtView.getSimpleCombobox('sort', 'Ordenar por', 'config', ["id:Id","code:C&oacute;digo","name:Nombre","brand:Marca","quantityPerUnit:Cantidad por unidad","seggestedUnitPrice:Precio Sugerido","buyUnitPrice:Precio Unitario","discount:Descuento","unitsInStock:Unidades en Stock","unitsInOrder:Unidades en Ordenes","registerDate:Fecha Registro","keywords:Palabras clave","orderLevel:Orden","description:Descripci&oacute;n","featured:Destacado","status:Estado","category:Categor&iacute;a","subCategory:Sub Categor&iacute;a","supplier:Proveedor","commerce:Comercio"]);
        combobox.addListener('change',function(record){
            if(record.getValue()!=="" && store.getOrderProperty()!==record.getValue()){
                var dir= store.getOrderDir();
                store.sortBy(record.getValue(), dir);
                Instance.reloadPageStore(1);
            }
        }, this);
        combobox.labelWidth= 80;
        combobox.width= 250;
        combobox.setValue("id");
        
        return combobox;
    }
    
    function getComboboxOrderDir(store){
        var combobox= Instance.commonExtView.getSimpleCombobox('dir', 'Direcci&oacute;n', 'config', ["ASC", "DESC"]);
        combobox.addListener('change',function(record){
            if(record.getValue()!=="" && store.getOrderDir()!==record.getValue()){
                var prop= store.getOrderProperty();
                store.sortBy(prop, record.getValue());
                Instance.reloadPageStore(1);
            }
        }, this);
        combobox.labelWidth= 60;
        combobox.width= 150;
        combobox.setValue("DESC");
        
        return combobox;
    }
    
    Instance.defineWriterGrid= function(modelText, columns){
        Ext.define('WriterGridProduct', {
            extend: 'Ext.grid.Panel',
            alias: 'widget.writergridProduct',

            requires: [
                'Ext.grid.plugin.CellEditing',
                'Ext.selection.CheckboxModel',
                'Ext.form.field.Text',
                'Ext.toolbar.TextItem'
            ],

            initComponent: function(){

                this.editing = Ext.create('Ext.grid.plugin.CellEditing');
                

                Ext.apply(this, {
                    //iconCls: 'icon-grid',
                    hideHeaders:false,
                    frame: false,
                    selType: 'checkboxmodel',
                    plugins: [this.editing],
                    dockedItems: [{
                        weight: 2,
                        xtype: 'toolbar',
                        dock: 'bottom',
                        items: [{
                            xtype: 'tbtext',
                            text: '<b>@lacv</b>'
                        }, '|',
                        
                        {
                            //iconCls: 'icon-add',
                            text: 'Agregar',
                            scope: this,
                            handler: this.onAddClick
                        },
                        
                        
                        {
                            //iconCls: 'icon-delete',
                            text: 'Eliminar',
                            
                            disabled: true,
                            
                            itemId: 'delete',
                            scope: this,
                            handler: this.onDeleteClick
                        },
                        
                        
                        {
                            text: 'Auto-Guardar',
                            enableToggle: true,
                            pressed: true,
                            tooltip: 'When enabled, Store will execute Ajax requests as soon as a Record becomes dirty.',
                            scope: this,
                            toggleHandler: function(btn, pressed){
                                this.store.autoSync = pressed;
                            }
                        }, {
                            iconCls: 'icon-save',
                            text: 'Guardar',
                            scope: this,
                            handler: this.onSync
                        },
                        
                        getComboboxLimit(this.store),
                        getComboboxOrderBy(this.store),
                        getComboboxOrderDir(this.store)
                        
                        ,{
                            text: 'Exportar',
                            //iconCls: 'add16',
                            menu: [
                                {text: 'A xls', handler: function(){this.exportTo('xls');}, scope: this},
                                {text: 'A json', handler: function(){this.exportTo('json');}, scope: this},
                                {text: 'A xml', handler: function(){this.exportTo('xml');}, scope: this}]
                        },{
                            itemId: 'importMenu',
                            text: 'Importar',
                            //iconCls: 'add16',
                            menu: [
                                {text: 'De json', handler: function(){this.importFrom('json');}, scope: this},
                                {text: 'De xml', handler: function(){this.importFrom('xml');}, scope: this}]
                        }
                        
                        ]
                    }, {
                        weight: 1,
                        xtype: 'pagingtoolbar',
                        dock: 'bottom',
                        ui: 'footer',
                        store: this.store,
                        displayInfo: true,
                        displayMsg: modelText+' {0} - {1} de {2}',
                        emptyMsg: "No hay "+modelText
                    }],
                    columns: columns
                });
                this.callParent();
                this.getSelectionModel().on('selectionchange', this.onSelectChange, this);
            },

            onSelectChange: function(selModel, selections){
                if(this.down('#delete')!==null){
                    this.down('#delete').setDisabled(selections.length === 0);
                }
            },

            onSync: function(){
                this.store.sync();
            },

            onDeleteClick: function(){
                var selection = this.getView().getSelectionModel().getSelection();
                if (selection.length>0) {
                    if(selection.length===1){
                        this.store.getProxy().extraParams.idEntity= selection[0].data.id;
                        this.store.remove(selection[0]);
                        parentExtController.loadFormData("");
                    }else{
                        var filter={"in":{"id":[]}};
                        for(var i=0; i<selection.length; i++){
                            filter.in.id.push(selection[i].data.id);
                        }
                        Instance.entityExtStore.deleteByFilter(JSON.stringify(filter), function(responseText){
                            Instance.reloadPageStore(Instance.store.currentPage);
                        });
                    }
                }else{
                    var check_items= document.getElementsByClassName("item_check");
                    var filter={"in":{"id":[]}};
                    for(var i=0; i<check_items.length; i++){
                        if(check_items[i].checked){
                            filter.in.id.push(check_items[i].value);
                        }
                    }
                    if(filter.in.id.length>0){
                        Instance.entityExtStore.deleteByFilter(JSON.stringify(filter), function(responseText){
                            Instance.reloadPageStore(Instance.store.currentPage);
                        });
                    }
                }
            },

            onAddClick: function(){
                var rec = Instance.getEmptyRec(), edit = this.editing;
                edit.cancelEdit();
                this.store.insert(0, rec);
                edit.startEditByPosition({
                    row: 0,
                    column: 0
                });
            },
            
            exportTo: function(type){
                this.fireEvent('export', type);
            },
            
            importFrom: function(type){
                if (Instance.containerImport.isVisible()) {
                    Instance.containerImport.hide(this.down('#importMenu'), function() {});
                } else {
                    Instance.containerImport.typeReport= type;
                    Instance.containerImport.show(this.down('#importMenu'), function() {});
                }
            }

        });
    };
    
    function createFormImport(){
        Instance.formImport = Ext.create('Ext.form.Panel', {
            border: false,
            bodyPadding: 15,
            fieldDefaults: {
                labelAlign: 'left',
                anchor: '100%'
            },
            items: [{
                xtype: 'filefield',
                name: 'data',
                fieldLabel: 'Seleccione archivo',
                labelWidth: 125,
                style: 'margin-top:20px',
                allowBlank: false
            }]
        });

        Instance.containerImport = Ext.create('Ext.window.Window', {
            autoShow: false,
            title: 'Subir Archivo',
            closable: true,
            closeAction: 'hide',
            width: 600,
            height: 200,
            minWidth: 300,
            minHeight: 200,
            layout: 'fit',
            plain:true,
            typeReport: 'json',
            items: Instance.formImport,

            buttons: [{
                text: 'Importar',
                handler: function(){
                    Instance.entityExtStore.import(Instance.formImport, Instance.containerImport.typeReport, function(responseText){
                        Instance.reloadPageStore(Instance.store.currentPage);
                        setTimeout(function(){ Instance.containerImport.hide()},1000);
                    });
                }
            },{
                text: 'Cancelar',
                handler: function(){
                    Instance.containerImport.hide();
                }
            }]
        });
    }
    

    
    
    function getPropertyGrid(){
        var renderers= {
            
                
            Category: function(entity){
                var res = entity.split("__");
                return '<a href="/vista/category/entity.htm#?tab=1&id='+res[0]+'">'+res[1]+'</a>';
            },
            
                
            Commerce: function(entity){
                var res = entity.split("__");
                return '<a href="/vista/commerce/entity.htm#?tab=1&id='+res[0]+'">'+res[1]+'</a>';
            },
            
                
            SubCategory: function(entity){
                var res = entity.split("__");
                return '<a href="/vista/subCategory/entity.htm#?tab=1&id='+res[0]+'">'+res[1]+'</a>';
            },
            
                
            Supplier: function(entity){
                var res = entity.split("__");
                return '<a href="/vista/supplier/entity.htm#?tab=1&id='+res[0]+'">'+res[1]+'</a>';
            },
            
        };
        var pg= Ext.create('Ext.grid.property.Grid', {
            id: 'propertyGridProduct',
            region: 'north',
            hideHeaders: true,
            resizable: false,
            defaults: {
                sortable: false
            },
            customRenderers: renderers,
            disableSelection:true,
            listeners: {
                'beforeedit':{
                    fn:function(){
                        return false;
                    }
                }
            }
        });
        pg.getStore().sorters.items= [];
        
        return pg;
    };
    
    
    
    Instance.showProcessForm= function(processName, sourceByDestinationFields, rowIndex){
        var initData={};
        if(rowIndex!==-1){
            var rec = Instance.gridComponent.getStore().getAt(rowIndex);
            for (var source in sourceByDestinationFields) {
                var destination = sourceByDestinationFields[source];
                initData[destination]=rec.get(source);
            }
            
        }else{
            var formData= Instance.formComponent.getForm().getValues();
            for (var source in sourceByDestinationFields) {
                var destination = sourceByDestinationFields[source];
                initData[destination]=formData[source];
            }
            
        }
        Instance.processForms[processName].show(null, function() {});
        var processForm= Instance.processForms[processName].child('#form'+processName+'Process');
        processForm.getForm().reset();
        processForm.getForm().setValues(initData);
    };
    
    function nameEntityRender(value, p, record){
        if(record){
            if(Instance.typeView==="Parent"){
                return "<a style='font-size: 15px;' href='#?id="+record.data.id+"&tab=1'>"+value+"</a>";
            }else{
                return value;
            }
        }else{
            return value;
        }
    };
    
    Instance.hideParentField= function(entityRef){
        if(Instance.formComponent!==null){
            var fieldsForm= Instance.formComponent.items.items;
            fieldsForm.forEach(function(field) {
                if(field.name===entityRef){
                    field.hidden= true;
                }
            });
        }
        if(Instance.gridContainer!==null){
            var columnsGrid= Instance.gridComponent.columns;
            columnsGrid.forEach(function(column) {
                if(column.dataIndex===entityRef){
                    column.hidden= true;
                }
            });
        }
    };
    
    Instance.createMainView= function(){
        
            
            
        Instance.categoryExtInterfaces= new CategoryExtInterfaces(parentExtController, Instance);
        Instance.formComboboxCategory= Instance.categoryExtInterfaces.getCombobox('form', 'Product', 'category', 'Categor&iacute;a');
        Instance.gridComboboxCategory= Instance.categoryExtInterfaces.getCombobox('grid', 'Product', 'category', 'Categor&iacute;a');
        Instance.filterComboboxCategory= Instance.categoryExtInterfaces.getCombobox('filter', 'Product', 'category', 'Categor&iacute;a');
        Instance.comboboxCategoryRender= Instance.categoryExtInterfaces.getComboboxRender('grid');
        
            
            
        Instance.commerceExtInterfaces= new CommerceExtInterfaces(parentExtController, Instance);
        Instance.formComboboxCommerce= Instance.commerceExtInterfaces.getCombobox('form', 'Product', 'commerce', 'Comercio');
        Instance.gridComboboxCommerce= Instance.commerceExtInterfaces.getCombobox('grid', 'Product', 'commerce', 'Comercio');
        Instance.filterComboboxCommerce= Instance.commerceExtInterfaces.getCombobox('filter', 'Product', 'commerce', 'Comercio');
        Instance.comboboxCommerceRender= Instance.commerceExtInterfaces.getComboboxRender('grid');
        
            
            
        Instance.subCategoryExtInterfaces= new SubCategoryExtInterfaces(parentExtController, Instance);
        Instance.formComboboxSubCategory= Instance.subCategoryExtInterfaces.getCombobox('form', 'Product', 'subCategory', 'Sub Categor&iacute;a');
        Instance.gridComboboxSubCategory= Instance.subCategoryExtInterfaces.getCombobox('grid', 'Product', 'subCategory', 'Sub Categor&iacute;a');
        Instance.filterComboboxSubCategory= Instance.subCategoryExtInterfaces.getCombobox('filter', 'Product', 'subCategory', 'Sub Categor&iacute;a');
        Instance.comboboxSubCategoryRender= Instance.subCategoryExtInterfaces.getComboboxRender('grid');
        
            
            
        Instance.supplierExtInterfaces= new SupplierExtInterfaces(parentExtController, Instance);
        Instance.formComboboxSupplier= Instance.supplierExtInterfaces.getCombobox('form', 'Product', 'supplier', 'Proveedor');
        Instance.gridComboboxSupplier= Instance.supplierExtInterfaces.getCombobox('grid', 'Product', 'supplier', 'Proveedor');
        Instance.filterComboboxSupplier= Instance.supplierExtInterfaces.getCombobox('filter', 'Product', 'supplier', 'Proveedor');
        Instance.comboboxSupplierRender= Instance.supplierExtInterfaces.getComboboxRender('grid');
        
        
        Instance.entityDependency= {};
        
            
            
                
        Instance.entityDependency["subCategory"]="category";
        Instance.formComboboxCategory.comboboxDependent.push(Instance.formComboboxSubCategory);
        Instance.formComboboxCategory.comboboxDependent.push(Instance.gridComboboxSubCategory);
        
        Instance.gridComboboxCategory.comboboxDependent.push(Instance.formComboboxSubCategory);
        Instance.gridComboboxCategory.comboboxDependent.push(Instance.gridComboboxSubCategory);
        
        Instance.filterComboboxCategory.comboboxDependent.push(Instance.filterComboboxSubCategory);
            
        
        
        Instance.childExtControllers= [];
        
        if(Instance.typeView==="Parent"){
        
            
            var productImageExtController= new ProductImageExtController(parentExtController, Instance);
            productImageExtController.entityExtView.hideParentField("product");
            Instance.childExtControllers.push(productImageExtController);
        
        }
        
        Instance.formComponent= null;
        
        Instance.formContainer = getFormContainer(Instance.childExtControllers);
        Instance.formComponent= Instance.formContainer.child('#formProduct');
        Instance.store.formComponent= Instance.formComponent;
        
        
        Instance.gridComponent = null;
        
        Instance.gridContainer = getGridContainer();
        Instance.gridComponent = Instance.gridContainer.child('#gridProduct');
        Instance.store.gridComponent= Instance.gridComponent;
        createFormImport();
        
            
        
        
        Instance.processForms={};
        
        
        Instance.propertyGrid= getPropertyGrid();

        Instance.tabsContainer= Ext.widget('tabpanel', {
            region: 'center',
            activeTab: 0,
            style: 'background-color:#dfe8f6; margin:0px',
            defaults: {bodyStyle: 'padding:15px', autoScroll:true},
            items:[
                
                Instance.gridContainer,
                
                
                Instance.formContainer
                
            ],
            listeners: {
                tabchange: function(tabPanel, tab){
                    var idx = tabPanel.items.indexOf(tab);
                    var url= util.addUrlParameter(parentExtController.request,"tab", idx);
                    if(idx===0){
                        url= "?tab=0";
                    }
                    if(url!==""){
                        mvcExt.navigate(url);
                    }
                }
            }
        });
        
        Instance.mainView= {
            id: Instance.id,
            title: 'Gestionar Productos',
            frame: false,
            layout: 'border',
            items: [
                Instance.propertyGrid,
                Instance.tabsContainer
            ]
        };
        
    };
    
    Instance.getMainView= function(){
        return Instance.mainView;
    };

    Instance.init();
}
</script>
        
            
                
            

<script>

function ProductImageExtView(parentExtController, parentExtView){
    
    var Instance= this;
    
    Instance.id= "/productImage";
    
    Instance.modelName="ProductImageModel";
    
    var util= new Util();
    
    // MODELS **********************************************
    
    Instance.entityExtModel= new ProductImageExtModel();
    
    // STORES **********************************************
    
    Instance.entityExtStore= new ProductImageExtStore();
    
    // COMPONENTS *******************************************
    
    Instance.commonExtView= new CommonExtView(parentExtController, Instance, 'ProductImage');
    
    //*******************************************************
    
    
    Instance.init= function(){
        Instance.typeView= "Child";
        Instance.pluralEntityTitle= 'Imagenes';
        Instance.singularEntityTitle= 'Imagen';
        Instance.entityExtModel.defineModel(Instance.modelName);
        Instance.store= Instance.entityExtStore.getStore(Instance.modelName);
        
        Instance.createMainView();
    };
    
    Instance.setFilterStore= function(filter){
        
            Instance.store.getProxy().extraParams.filter= filter;
        
        
    };
    
    Instance.reloadPageStore= function(page){
        
            Instance.store.loadPage(page);
        
        
    };
    
    
    
    
    function getFormContainer(childExtControllers){
        var formFields= [{"xtype":"numberfield","fieldLabel":"Id","name":"id","readOnly":true},{"renderer":Instance.commonExtView.imageRender,"xtype":"displayfield","fieldLabel":"Imagen","name":"image"},{"fieldLabel":"&nbsp;","name":"image","id":"formProductImage_imageLinkField"},{"xtype":"filefield","emptyText":"Seleccione una imagen","fieldLabel":"&nbsp;","name":"image_File"},{"xtype":"numberfield","fieldLabel":"Orden","name":"order"},(function(){ return Instance.formComboboxProduct;})()];

        var renderReplacements= [{"component":Instance.formComboboxProduct,"replace":{"field":"product","attribute":"id"}}];

        var additionalButtons= [];

        Instance.defineWriterForm(formFields, renderReplacements, additionalButtons);
        
        var itemsForm= [{
            itemId: 'formProductImage',
            xtype: 'writerformProductImage',
            border: false,
            width: '100%',
            listeners: {
                create: function(form, data){
                    Instance.entityExtStore.save('create', JSON.stringify(data), parentExtController.formSavedResponse);
                },
                update: function(form, data){
                    Instance.entityExtStore.save("update", JSON.stringify(data), parentExtController.formSavedResponse);
                },
                render: function(panel) {
                    Instance.commonExtView.enableManagementTabHTMLEditor();
                }
            }
        }];
        
        if(Instance.typeView==="Parent"){
            itemsForm.push(getChildsExtViewTabs(childExtControllers));
        }
        
        return Ext.create('Ext.container.Container', {
            id: 'formContainerProductImage',
            title: 'Formulario',
            type: 'fit',
            align: 'stretch',
            items: itemsForm
        });
    };
    
    function getChildsExtViewTabs(childExtControllers){
        var items=[];
        var jsonTypeChildExtViews= {};
        childExtControllers.forEach(function(childExtController) {
            var itemTab= null;
            if(jsonTypeChildExtViews[childExtController.entityRef]==="tcv_standard"){
                itemTab= {
                    xtype:'tabpanel',
                    title: childExtController.entityExtView.pluralEntityTitle,
                    plain:true,
                    activeTab: 0,
                    style: 'background-color:#dfe8f6; padding:10px;',
                    defaults: {bodyStyle: 'padding:15px', autoScroll:true},
                    items:[
                        childExtController.entityExtView.gridContainer,

                        childExtController.entityExtView.formContainer
                    ]
                };
            }else if(jsonTypeChildExtViews[childExtController.entityRef]==="tcv_1_to_1"){
                itemTab= {
                    xtype:'tabpanel',
                    title: childExtController.entityExtView.singularEntityTitle,
                    plain:true,
                    activeTab: 0,
                    style: 'background-color:#dfe8f6; padding:10px;',
                    defaults: {bodyStyle: 'padding:15px', autoScroll:true},
                    items:[
                        childExtController.entityExtView.formContainer
                    ]
                };
            }else if(jsonTypeChildExtViews[childExtController.entityRef]==="tcv-n-n-multicheck"){
                itemTab= childExtController.entityExtView.checkboxGroupContainer;
            }
            
            items.push(itemTab);
        });
        
        var tabObect= {
            xtype:'tabpanel',
            plain:true,
            activeTab: 0,
            style: 'padding:25px 15px 45px 15px;',
            items:items
        };
        
        return tabObect;
    };
    
    Instance.setFormActiveRecord= function(record){
        Instance.formComponent.setActiveRecord(record || null);
    };
    
    Instance.defineWriterForm= function(fields, renderReplacements, additionalButtons){
        Ext.define('WriterFormProductImage', {
            extend: 'Ext.form.Panel',
            alias: 'widget.writerformProductImage',

            requires: ['Ext.form.field.Text'],

            initComponent: function(){
                //this.addEvents('create');
                
                var buttons= [];
                
                buttons= [{
                    iconCls: 'icon-save',
                    itemId: 'saveProductImage',
                    text: 'Actualizar',
                    disabled: true,
                    scope: this,
                    handler: this.onSave
                },
                
                {
                    //iconCls: 'icon-user-add',
                    text: 'Crear',
                    scope: this,
                    handler: this.onCreate
                }, {
                    //iconCls: 'icon-reset',
                    text: 'Limpiar',
                    scope: this,
                    handler: this.onReset
                },
                
                {
                    text: '&#x25BC; Ver todo',
                    scope: this,
                    handler: this.onSeeAll
                },
                '|'];
                
                if(additionalButtons){
                    for(var i=0; i<additionalButtons.length; i++){
                        buttons.push(additionalButtons[i]);
                    }
                }
                Ext.apply(this, {
                    activeRecord: null,
                    //iconCls: 'icon-user',
                    frame: false,
                    defaultType: 'textfield',
                    bodyPadding: 15,
                    fieldDefaults: {
                        minWidth: 300,
                        anchor: '50%',
                        labelAlign: 'right'
                    },
                    items: fields,
                    dockedItems: [{
                        xtype: 'toolbar',
                        dock: 'bottom',
                        ui: 'footer',
                        items: buttons
                    }]
                });
                this.callParent();
            },

            setActiveRecord: function(record){
                this.activeRecord = record;
                if (this.activeRecord) {
                    if(this.down('#saveProductImage')!==null){
                        this.down('#saveProductImage').enable();
                    }
                    this.getForm().loadRecord(this.activeRecord);
                    //this.getForm().setValues(this.activeRecord.data);
                    this.renderReplaceActiveRecord(this.activeRecord);
                } else {
                    if(this.down('#saveProductImage')!==null){
                        this.down('#saveProductImage').disable();
                    }
                    this.getForm().reset();
                }
            },
                    
            getActiveRecord: function(){
                return this.activeRecord;
            },
            
            onSave: function(){
                var active = this.activeRecord,
                    form = this.getForm();
            
                if (!active) {
                    return;
                }
                if (form.isValid()) {
                    this.fireEvent('update', this, form.getValues());
                    //form.updateRecord(active);
                    //this.onReset();
                }
            },

            onCreate: function(){
                var form = this.getForm();

                if (form.isValid()) {
                    this.fireEvent('create', this, form.getValues());
                    //form.reset();
                }

            },

            onReset: function(){
                this.getForm().reset();
                parentExtController.loadFormData("");
            },
                    
            onSeeAll: function(){
                this.doLayout();
            },
            
            renderReplaceActiveRecord: function(record){
                if(renderReplacements){
                    for(var i=0; i<renderReplacements.length; i++){
                        var renderReplace= renderReplacements[i];
                        var replaceField= renderReplace.replace.field;
                        var replaceAttribute= renderReplace.replace.attribute;
                        var value="";
                        
                        if (typeof record.data[replaceField] === "object" && Object.getOwnPropertyNames(record.data[replaceField]).length === 0){
                            value= "";
                        }else if(replaceAttribute.indexOf(".")===-1 && replaceField in record.data){
                            value= record.data[replaceField][replaceAttribute];
                        }else{
                            var niveles= replaceAttribute.split(".");
                            try{
                                switch(niveles.length){
                                    case 2:
                                        value= record.data[replaceField][niveles[0]][niveles[1]];
                                        break;
                                    case 3:
                                        value= record.data[replaceField][niveles[0]][niveles[1]][niveles[2]];
                                        break;
                                    case 4:
                                        value= record.data[replaceField][niveles[0]][niveles[1]][niveles[2]][niveles[3]];
                                        break;
                                    case 5:
                                        value= record.data[replaceField][niveles[0]][niveles[1]][niveles[2]][niveles[3]][niveles[4]];
                                        break;
                                }
                            }catch(err){
                                console.log(err);
                            }
                            
                        }
                        if(typeof(value) !== 'undefined'){
                            renderReplace.component.setValue(value);
                        }
                    }
                }
                return record;
            }
    
        });
        
    };
    
    
    
    
    function getGridContainer(){
        var idGrid= 'gridProductImage';
        var gridColumns= [{"renderer":idEntityRender,"dataIndex":"id","width":100,"header":"Id","sortable":true},{"renderer":Instance.commonExtView.imageGridRender,"field":{"type":"textfield"},"dataIndex":"image","width":300,"header":"Imagen","sortable":true},{"editor":{"xtype":"numberfield"},"dataIndex":"order","width":200,"header":"Orden","sortable":true},{"editor":Instance.gridComboboxProduct,"renderer":Instance.comboboxProductRender,"dataIndex":"product","width":200,"header":"Producto"}];
        
        Instance.emptyModel= {"image":"","product":"","order":""};
        Instance.getEmptyRec= function(){
            return new ProductImageModel(Instance.emptyModel);
        };
        
        var store= Instance.store;
        

        Instance.defineWriterGrid('Imagenes', gridColumns);
        
        return Ext.create('Ext.container.Container', {
            id: 'gridContainerProductImage',
            title: 'Listado',
            
            layout: {
                type: 'vbox',
                align: 'stretch'
            },
            items: [{
                itemId: idGrid,
                xtype: 'writergridProductImage',
                style: 'border: 0px',
                flex: 1,
                store: store,
                disableSelection: false,
                trackMouseOver: !false,
                listeners: {
                    selectionchange: function(selModel, selected) {
                        if(selected[0]){
                            parentExtController.setFormData(selected[0]);
                        }
                    },
                    export: function(typeReport){
                        var filterData= JSON.stringify(parentExtController.filter);
                        filterData= filterData.replaceAll("{","(").replaceAll("}",")");
                        var data= "?filter="+filterData;
                        data+="&limit="+store.pageSize+"&page="+store.currentPage;
                        data+="&sort="+store.getOrderProperty()+"&dir="+store.getOrderDir();
                        
                        switch(typeReport){
                            case "json":
                                var urlFind= store.proxy.api.read;
                                window.open(urlFind+data,'_blank');
                                break;
                            case "xml":
                                var urlFind= store.proxy.api.read.replace("find.htm","find/xml.htm");
                                window.open(urlFind+data,'_blank');
                                break;
                            case "xls":
                                var urlFind= store.proxy.api.read.replace("find.htm","find/xls.htm");
                                window.open(urlFind+data,'_blank');
                                break;
                        }
                    }
                }
            }],
            listeners: {
                activate: function(panel) {
                    //store.loadPage(1);
                }
            }
        });
    };
    
    Instance.setValueInEmptyModel= function(fieldName, value){
        Instance.emptyModel[fieldName]= value;
        Instance.getEmptyRec= function(){
            return new ProductImageModel(Instance.emptyModel);
        };
    };
    
    function getComboboxLimit(store){
        var combobox= Instance.commonExtView.getSimpleCombobox('limit', 'L&iacute;mite', 'config', [50, 100, 200, 500]);
        combobox.addListener('change',function(record){
            if(record.getValue()!=="" && store.pageSize!==record.getValue()){
                store.pageSize=record.getValue();
                Instance.reloadPageStore(1);
            }
        }, this);
        combobox.labelWidth= 46;
        combobox.width= 125;
        combobox.setValue(50);
        
        return combobox;
    }
    
    function getComboboxOrderBy(store){
        var combobox= Instance.commonExtView.getSimpleCombobox('sort', 'Ordenar por', 'config', ["id:Id","image:Imagen","order:Orden","product:Producto"]);
        combobox.addListener('change',function(record){
            if(record.getValue()!=="" && store.getOrderProperty()!==record.getValue()){
                var dir= store.getOrderDir();
                store.sortBy(record.getValue(), dir);
                Instance.reloadPageStore(1);
            }
        }, this);
        combobox.labelWidth= 80;
        combobox.width= 250;
        combobox.setValue("order");
        
        return combobox;
    }
    
    function getComboboxOrderDir(store){
        var combobox= Instance.commonExtView.getSimpleCombobox('dir', 'Direcci&oacute;n', 'config', ["ASC", "DESC"]);
        combobox.addListener('change',function(record){
            if(record.getValue()!=="" && store.getOrderDir()!==record.getValue()){
                var prop= store.getOrderProperty();
                store.sortBy(prop, record.getValue());
                Instance.reloadPageStore(1);
            }
        }, this);
        combobox.labelWidth= 60;
        combobox.width= 150;
        combobox.setValue("ASC");
        
        return combobox;
    }
    
    Instance.defineWriterGrid= function(modelText, columns){
        Ext.define('WriterGridProductImage', {
            extend: 'Ext.grid.Panel',
            alias: 'widget.writergridProductImage',

            requires: [
                'Ext.grid.plugin.CellEditing',
                'Ext.selection.CheckboxModel',
                'Ext.form.field.Text',
                'Ext.toolbar.TextItem'
            ],

            initComponent: function(){

                this.editing = Ext.create('Ext.grid.plugin.CellEditing');
                

                Ext.apply(this, {
                    //iconCls: 'icon-grid',
                    hideHeaders:false,
                    frame: false,
                    selType: 'checkboxmodel',
                    plugins: [this.editing],
                    dockedItems: [{
                        weight: 2,
                        xtype: 'toolbar',
                        dock: 'bottom',
                        items: [{
                            xtype: 'tbtext',
                            text: '<b>@lacv</b>'
                        }, '|',
                        
                        {
                            //iconCls: 'icon-add',
                            text: 'Agregar',
                            scope: this,
                            handler: this.onAddClick
                        },
                        
                        
                        {
                            //iconCls: 'icon-delete',
                            text: 'Eliminar',
                            
                            disabled: true,
                            
                            itemId: 'delete',
                            scope: this,
                            handler: this.onDeleteClick
                        },
                        
                        
                        {
                            text: 'Auto-Guardar',
                            enableToggle: true,
                            pressed: true,
                            tooltip: 'When enabled, Store will execute Ajax requests as soon as a Record becomes dirty.',
                            scope: this,
                            toggleHandler: function(btn, pressed){
                                this.store.autoSync = pressed;
                            }
                        }, {
                            iconCls: 'icon-save',
                            text: 'Guardar',
                            scope: this,
                            handler: this.onSync
                        },
                        
                        getComboboxLimit(this.store),
                        getComboboxOrderBy(this.store),
                        getComboboxOrderDir(this.store)
                        
                        ,{
                            text: 'Exportar',
                            //iconCls: 'add16',
                            menu: [
                                {text: 'A xls', handler: function(){this.exportTo('xls');}, scope: this},
                                {text: 'A json', handler: function(){this.exportTo('json');}, scope: this},
                                {text: 'A xml', handler: function(){this.exportTo('xml');}, scope: this}]
                        },{
                            itemId: 'importMenu',
                            text: 'Importar',
                            //iconCls: 'add16',
                            menu: [
                                {text: 'De json', handler: function(){this.importFrom('json');}, scope: this},
                                {text: 'De xml', handler: function(){this.importFrom('xml');}, scope: this}]
                        }
                        
                        ]
                    }, {
                        weight: 1,
                        xtype: 'pagingtoolbar',
                        dock: 'bottom',
                        ui: 'footer',
                        store: this.store,
                        displayInfo: true,
                        displayMsg: modelText+' {0} - {1} de {2}',
                        emptyMsg: "No hay "+modelText
                    }],
                    columns: columns
                });
                this.callParent();
                this.getSelectionModel().on('selectionchange', this.onSelectChange, this);
            },

            onSelectChange: function(selModel, selections){
                if(this.down('#delete')!==null){
                    this.down('#delete').setDisabled(selections.length === 0);
                }
            },

            onSync: function(){
                this.store.sync();
            },

            onDeleteClick: function(){
                var selection = this.getView().getSelectionModel().getSelection();
                if (selection.length>0) {
                    if(selection.length===1){
                        this.store.getProxy().extraParams.idEntity= selection[0].data.id;
                        this.store.remove(selection[0]);
                        parentExtController.loadFormData("");
                    }else{
                        var filter={"in":{"id":[]}};
                        for(var i=0; i<selection.length; i++){
                            filter.in.id.push(selection[i].data.id);
                        }
                        Instance.entityExtStore.deleteByFilter(JSON.stringify(filter), function(responseText){
                            Instance.reloadPageStore(Instance.store.currentPage);
                        });
                    }
                }else{
                    var check_items= document.getElementsByClassName("item_check");
                    var filter={"in":{"id":[]}};
                    for(var i=0; i<check_items.length; i++){
                        if(check_items[i].checked){
                            filter.in.id.push(check_items[i].value);
                        }
                    }
                    if(filter.in.id.length>0){
                        Instance.entityExtStore.deleteByFilter(JSON.stringify(filter), function(responseText){
                            Instance.reloadPageStore(Instance.store.currentPage);
                        });
                    }
                }
            },

            onAddClick: function(){
                var rec = Instance.getEmptyRec(), edit = this.editing;
                edit.cancelEdit();
                this.store.insert(0, rec);
                edit.startEditByPosition({
                    row: 0,
                    column: 0
                });
            },
            
            exportTo: function(type){
                this.fireEvent('export', type);
            },
            
            importFrom: function(type){
                if (Instance.containerImport.isVisible()) {
                    Instance.containerImport.hide(this.down('#importMenu'), function() {});
                } else {
                    Instance.containerImport.typeReport= type;
                    Instance.containerImport.show(this.down('#importMenu'), function() {});
                }
            }

        });
    };
    
    function createFormImport(){
        Instance.formImport = Ext.create('Ext.form.Panel', {
            border: false,
            bodyPadding: 15,
            fieldDefaults: {
                labelAlign: 'left',
                anchor: '100%'
            },
            items: [{
                xtype: 'filefield',
                name: 'data',
                fieldLabel: 'Seleccione archivo',
                labelWidth: 125,
                style: 'margin-top:20px',
                allowBlank: false
            }]
        });

        Instance.containerImport = Ext.create('Ext.window.Window', {
            autoShow: false,
            title: 'Subir Archivo',
            closable: true,
            closeAction: 'hide',
            width: 600,
            height: 200,
            minWidth: 300,
            minHeight: 200,
            layout: 'fit',
            plain:true,
            typeReport: 'json',
            items: Instance.formImport,

            buttons: [{
                text: 'Importar',
                handler: function(){
                    Instance.entityExtStore.import(Instance.formImport, Instance.containerImport.typeReport, function(responseText){
                        Instance.reloadPageStore(Instance.store.currentPage);
                        setTimeout(function(){ Instance.containerImport.hide()},1000);
                    });
                }
            },{
                text: 'Cancelar',
                handler: function(){
                    Instance.containerImport.hide();
                }
            }]
        });
    }
    

    
    
    function getPropertyGrid(){
        var renderers= {
            
                
            Product: function(entity){
                var res = entity.split("__");
                return '<a href="/vista/product/entity.htm#?tab=1&id='+res[0]+'">'+res[1]+'</a>';
            },
            
        };
        var pg= Ext.create('Ext.grid.property.Grid', {
            id: 'propertyGridProductImage',
            region: 'north',
            hideHeaders: true,
            resizable: false,
            defaults: {
                sortable: false
            },
            customRenderers: renderers,
            disableSelection:true,
            listeners: {
                'beforeedit':{
                    fn:function(){
                        return false;
                    }
                }
            }
        });
        pg.getStore().sorters.items= [];
        
        return pg;
    };
    
    
    
    Instance.showProcessForm= function(processName, sourceByDestinationFields, rowIndex){
        var initData={};
        if(rowIndex!==-1){
            var rec = Instance.gridComponent.getStore().getAt(rowIndex);
            for (var source in sourceByDestinationFields) {
                var destination = sourceByDestinationFields[source];
                initData[destination]=rec.get(source);
            }
            
        }else{
            var formData= Instance.formComponent.getForm().getValues();
            for (var source in sourceByDestinationFields) {
                var destination = sourceByDestinationFields[source];
                initData[destination]=formData[source];
            }
            
        }
        Instance.processForms[processName].show(null, function() {});
        var processForm= Instance.processForms[processName].child('#form'+processName+'Process');
        processForm.getForm().reset();
        processForm.getForm().setValues(initData);
    };
    
    function idEntityRender(value, p, record){
        if(record){
            if(Instance.typeView==="Parent"){
                return "<a style='font-size: 15px;' href='#?id="+record.data.id+"&tab=1'>"+value+"</a>";
            }else{
                return value;
            }
        }else{
            return value;
        }
    };
    
    Instance.hideParentField= function(entityRef){
        if(Instance.formComponent!==null){
            var fieldsForm= Instance.formComponent.items.items;
            fieldsForm.forEach(function(field) {
                if(field.name===entityRef){
                    field.hidden= true;
                }
            });
        }
        if(Instance.gridContainer!==null){
            var columnsGrid= Instance.gridComponent.columns;
            columnsGrid.forEach(function(column) {
                if(column.dataIndex===entityRef){
                    column.hidden= true;
                }
            });
        }
    };
    
    Instance.createMainView= function(){
        
            
            
        Instance.productExtInterfaces= new ProductExtInterfaces(parentExtController, Instance);
        Instance.formComboboxProduct= Instance.productExtInterfaces.getCombobox('form', 'ProductImage', 'product', 'Producto');
        Instance.gridComboboxProduct= Instance.productExtInterfaces.getCombobox('grid', 'ProductImage', 'product', 'Producto');
        Instance.filterComboboxProduct= Instance.productExtInterfaces.getCombobox('filter', 'ProductImage', 'product', 'Producto');
        Instance.comboboxProductRender= Instance.productExtInterfaces.getComboboxRender('grid');
        
        
        Instance.entityDependency= {};
        
        
        Instance.childExtControllers= [];
        
        if(Instance.typeView==="Parent"){
        
        }
        
        Instance.formComponent= null;
        
        Instance.formContainer = getFormContainer(Instance.childExtControllers);
        Instance.formComponent= Instance.formContainer.child('#formProductImage');
        Instance.store.formComponent= Instance.formComponent;
        
        
        Instance.gridComponent = null;
        
        Instance.gridContainer = getGridContainer();
        Instance.gridComponent = Instance.gridContainer.child('#gridProductImage');
        Instance.store.gridComponent= Instance.gridComponent;
        createFormImport();
        
            
        
        
        Instance.processForms={};
        
        
        Instance.propertyGrid= getPropertyGrid();

        Instance.tabsContainer= Ext.widget('tabpanel', {
            region: 'center',
            activeTab: 0,
            style: 'background-color:#dfe8f6; margin:0px',
            defaults: {bodyStyle: 'padding:15px', autoScroll:true},
            items:[
                
                Instance.gridContainer,
                
                
                Instance.formContainer
                
            ],
            listeners: {
                tabchange: function(tabPanel, tab){
                    var idx = tabPanel.items.indexOf(tab);
                    var url= util.addUrlParameter(parentExtController.request,"tab", idx);
                    if(idx===0){
                        url= "?tab=0";
                    }
                    if(url!==""){
                        mvcExt.navigate(url);
                    }
                }
            }
        });
        
        Instance.mainView= {
            id: Instance.id,
            title: 'Gestionar Imagenes',
            frame: false,
            layout: 'border',
            items: [
                Instance.propertyGrid,
                Instance.tabsContainer
            ]
        };
        
    };
    
    Instance.getMainView= function(){
        return Instance.mainView;
    };

    Instance.init();
}
</script>
        
        
        <!-- ############################ IMPORT CONTROLLERS ################################### -->
        
        
            
        

<script>

function ProductExtController(parentExtController, parentExtView){
    
    var Instance= this;
    
    Instance.id= "/product";
    
    Instance.modelName="ProductModel";
    
    Instance.services= {};
    
    var util= new Util();
    
    // VIEWS *******************************************
    
    Instance.entityExtView= new ProductExtView(Instance, null);
    
    //*******************************************************
    
    
    Instance.init= function(){
        Instance.entityRef= "product";
        Instance.typeController= "Parent";
        Instance.idEntitySelected= "";
        mvcExt.mappingController(Instance.id, Instance);
        Instance.initFilter();
    };
    
    Instance.initFilter= function(){
        Instance.filter={
            eq:{},
            lk:{},
            btw:{},
            in:{}
        };
    };
    
    Instance.services.index= function(request){
        var activeTab= util.getParameter(request,"tab");
        var filter= util.getParameter(request,"filter");
        var id= util.getParameter(request,"id");
        
        if(activeTab!==""){
            Instance.entityExtView.tabsContainer.setActiveTab(Number(activeTab));
        }else{
            Instance.entityExtView.tabsContainer.setActiveTab(0);
        }
        
        if(filter!==""){
            Instance.initFilter();
            var currentFilter= JSON.parse(filter);
            for (var key in currentFilter) {
                Instance.filter[key]= currentFilter[key];
            }
        }
        
        
            
        if(Instance.filter.eq.category!==undefined && Instance.filter.eq.category!==''){
            Instance.entityExtView.categoryExtInterfaces.entityExtStore.load(Instance.filter.eq.category, Instance.entityExtView.categoryExtInterfaces.addLevel);
        }else{
            Instance.entityExtView.categoryExtInterfaces.addLevel(null);
        }
        
            
        if(Instance.filter.eq.commerce!==undefined && Instance.filter.eq.commerce!==''){
            Instance.entityExtView.commerceExtInterfaces.entityExtStore.load(Instance.filter.eq.commerce, Instance.entityExtView.commerceExtInterfaces.addLevel);
        }else{
            Instance.entityExtView.commerceExtInterfaces.addLevel(null);
        }
        
            
        if(Instance.filter.eq.subCategory!==undefined && Instance.filter.eq.subCategory!==''){
            Instance.entityExtView.subCategoryExtInterfaces.entityExtStore.load(Instance.filter.eq.subCategory, Instance.entityExtView.subCategoryExtInterfaces.addLevel);
        }else{
            Instance.entityExtView.subCategoryExtInterfaces.addLevel(null);
        }
        
            
        if(Instance.filter.eq.supplier!==undefined && Instance.filter.eq.supplier!==''){
            Instance.entityExtView.supplierExtInterfaces.entityExtStore.load(Instance.filter.eq.supplier, Instance.entityExtView.supplierExtInterfaces.addLevel);
        }else{
            Instance.entityExtView.supplierExtInterfaces.addLevel(null);
        }
        
        
        if(activeTab==="1"){
            if(id!==""){
                Instance.idEntitySelected= id;
            }
            Instance.loadFormData(Instance.idEntitySelected);
        }
        
        if(activeTab==="" || activeTab==="0"){
            Instance.loadGridData();
        }
        
        
    };
    
    Instance.loadGridData= function(){
        Instance.entityExtView.setFilterStore(JSON.stringify(Instance.filter));
        Instance.entityExtView.reloadPageStore(1);
    };
    
    Instance.setFormData= function(record){
        if(Instance.entityExtView.formComponent!==null){
            Instance.entityExtView.formComponent.setActiveRecord(record || null);
            Instance.idEntitySelected= record.data.id;
        }
    };
    
    Instance.loadFormData= function(id){
        if(Instance.entityExtView.formComponent!==null){
            if(id!==""){
                var activeRecord= Instance.entityExtView.formComponent.getActiveRecord();

                if(activeRecord===null){
                    Instance.entityExtView.entityExtStore.load(id, function(data){
                        var record= Ext.create(Instance.modelName);
                        record.data= data;
                        Instance.entityExtView.formComponent.setActiveRecord(record || null);
                        Instance.findAssociatedEntities(data);
                    });
                }else{
                    Instance.findAssociatedEntities(activeRecord.data);
                }
                console.log("BSi");
                Instance.loadChildExtControllers(id);
            }else{
                Instance.idEntitySelected= "";
                if(Object.keys(Instance.filter.eq).length !== 0){
                    var record= Ext.create(Instance.modelName);
                    for (var key in Instance.filter.eq) {
                        record.data[key]= Instance.filter.eq[key];
                    }
                    Instance.entityExtView.formComponent.setActiveRecord(record || null);
                }
            }
        }
        console.log("BSe");
    };
    
    Instance.findAssociatedEntities= function(data){
        
        if("category" in data && "id" in data["category"]){
            Instance.entityExtView.categoryExtInterfaces.reloadPageStore(1);
        }
        
        if("commerce" in data && "id" in data["commerce"]){
            Instance.entityExtView.commerceExtInterfaces.reloadPageStore(1);
        }
        
        if("subCategory" in data && "id" in data["subCategory"]){
            Instance.entityExtView.subCategoryExtInterfaces.reloadPageStore(1);
        }
        
        if("supplier" in data && "id" in data["supplier"]){
            Instance.entityExtView.supplierExtInterfaces.reloadPageStore(1);
        }
        
    };
    
    Instance.loadNNMulticheckData= function(){
        Instance.entityExtView.clearNNMultichecks();
        Instance.entityExtView.findAndLoadNNMultichecks(JSON.stringify(Instance.filter));
    };
    
    Instance.loadChildExtControllers= function(idEntitySelected){
        if(Instance.typeController==="Parent"){
            var jsonTypeChildExtViews= {"productImage":"tcv_1_to_1"};
            Instance.entityExtView.childExtControllers.forEach(function(childExtController) {
                console.log("IN");
                childExtController.filter= {"eq":{"product":idEntitySelected}};
                childExtController.entityExtView.setValueInEmptyModel("product", idEntitySelected);
                if(jsonTypeChildExtViews[childExtController.entityRef]==="tcv_standard"){
                    childExtController.loadGridData();
                    childExtController.loadFormData("");
                }else if(jsonTypeChildExtViews[childExtController.entityRef]==="tcv_1_to_1"){
                    console.log("p1");
                    childExtController.loadGridData();
                    console.log("p2");
                    childExtController.loadFormData("");
                    console.log("p3");
                    var record= childExtController.entityExtView.store.first();
                    if(record!==undefined){
                        console.log(record);
                        console.log("p45");
                        childExtController.setFormData(record);
                        console.log("p5");
                    }else{
                        console.log("p4");
                    }
                }else if(jsonTypeChildExtViews[childExtController.entityRef]==="tcv-n-n-multicheck"){
                    childExtController.loadNNMulticheckData();
                }
            });
        }
    };
    
    Instance.formSavedResponse= function(responseText){
        if(responseText.success){
            
            
            var record= Ext.create(Instance.modelName);
            record.data= responseText.data;
            Instance.entityExtView.formComponent.setActiveRecord(record || null);
            Ext.MessageBox.alert('Status', responseText.message);
            
            Instance.loadChildExtControllers(record.data.id);
            
        }else{
            Ext.MessageBox.alert('Status', responseText.message);
        }
    };
    
    Instance.doFilter= function(){
        var url= "?filter="+JSON.stringify(Instance.filter);
        console.log(url);
        mvcExt.navigate(url);
    };
    
    Instance.viewInternalPage= function(path){
        var urlAction= path;
        if(Instance.idEntitySelected!==""){
            urlAction+='#?filter={"eq":{"product":'+Instance.idEntitySelected+'}}';
        }
        mvcExt.redirect(urlAction);
    };

    Instance.init();
}
</script>
        
            
                
            

<script>

function ProductImageExtController(parentExtController, parentExtView){
    
    var Instance= this;
    
    Instance.id= "/productImage";
    
    Instance.modelName="ProductImageModel";
    
    Instance.services= {};
    
    var util= new Util();
    
    // VIEWS *******************************************
    
    Instance.entityExtView= new ProductImageExtView(Instance, null);
    
    //*******************************************************
    
    
    Instance.init= function(){
        Instance.entityRef= "productImage";
        Instance.typeController= "Child";
        Instance.idEntitySelected= "";
        mvcExt.mappingController(Instance.id, Instance);
        Instance.initFilter();
    };
    
    Instance.initFilter= function(){
        Instance.filter={
            eq:{},
            lk:{},
            btw:{},
            in:{}
        };
    };
    
    Instance.services.index= function(request){
        var activeTab= util.getParameter(request,"tab");
        var filter= util.getParameter(request,"filter");
        var id= util.getParameter(request,"id");
        
        if(activeTab!==""){
            Instance.entityExtView.tabsContainer.setActiveTab(Number(activeTab));
        }else{
            Instance.entityExtView.tabsContainer.setActiveTab(0);
        }
        
        if(filter!==""){
            Instance.initFilter();
            var currentFilter= JSON.parse(filter);
            for (var key in currentFilter) {
                Instance.filter[key]= currentFilter[key];
            }
        }
        
        
            
        if(Instance.filter.eq.product!==undefined && Instance.filter.eq.product!==''){
            Instance.entityExtView.productExtInterfaces.entityExtStore.load(Instance.filter.eq.product, Instance.entityExtView.productExtInterfaces.addLevel);
        }else{
            Instance.entityExtView.productExtInterfaces.addLevel(null);
        }
        
        
        if(activeTab==="1"){
            if(id!==""){
                Instance.idEntitySelected= id;
            }
            Instance.loadFormData(Instance.idEntitySelected);
        }
        
        if(activeTab==="" || activeTab==="0"){
            Instance.loadGridData();
        }
        
        
    };
    
    Instance.loadGridData= function(){
        Instance.entityExtView.setFilterStore(JSON.stringify(Instance.filter));
        Instance.entityExtView.reloadPageStore(1);
    };
    
    Instance.setFormData= function(record){
        console.log("s0");
        if(Instance.entityExtView.formComponent!==null){
            console.log("s1");
            Instance.entityExtView.formComponent.setActiveRecord(record || null);
            console.log("s2");
            Instance.idEntitySelected= record.data.id;
            console.log("s3");
        }
    };
    
    Instance.loadFormData= function(id){
        if(Instance.entityExtView.formComponent!==null){
            if(id!==""){
                var activeRecord= Instance.entityExtView.formComponent.getActiveRecord();

                if(activeRecord===null){
                    Instance.entityExtView.entityExtStore.load(id, function(data){
                        var record= Ext.create(Instance.modelName);
                        record.data= data;
                        Instance.entityExtView.formComponent.setActiveRecord(record || null);
                        Instance.findAssociatedEntities(data);
                    });
                }else{
                    Instance.findAssociatedEntities(activeRecord.data);
                }
                Instance.loadChildExtControllers(id);
            }else{
                Instance.idEntitySelected= "";
                if(Object.keys(Instance.filter.eq).length !== 0){
                    var record= Ext.create(Instance.modelName);
                    for (var key in Instance.filter.eq) {
                        record.data[key]= Instance.filter.eq[key];
                    }
                    Instance.entityExtView.formComponent.setActiveRecord(record || null);
                }
            }
        }
    };
    
    Instance.findAssociatedEntities= function(data){
        
        if("product" in data && "id" in data["product"]){
            Instance.entityExtView.productExtInterfaces.reloadPageStore(1);
        }
        
    };
    
    Instance.loadNNMulticheckData= function(){
        Instance.entityExtView.clearNNMultichecks();
        Instance.entityExtView.findAndLoadNNMultichecks(JSON.stringify(Instance.filter));
    };
    
    Instance.loadChildExtControllers= function(idEntitySelected){
        if(Instance.typeController==="Parent"){
            var jsonTypeChildExtViews= {};
            Instance.entityExtView.childExtControllers.forEach(function(childExtController) {
                childExtController.filter= {"eq":{"productImage":idEntitySelected}};
                childExtController.entityExtView.setValueInEmptyModel("productImage", idEntitySelected);
                if(jsonTypeChildExtViews[childExtController.entityRef]==="tcv_standard"){
                    childExtController.loadGridData();
                    childExtController.loadFormData("");
                }else if(jsonTypeChildExtViews[childExtController.entityRef]==="tcv_1_to_1"){
                    childExtController.loadGridData();
                    childExtController.loadFormData("");
                    var record= childExtController.entityExtView.store.first();
                    if(record){
                        childExtController.setFormData(record);
                    }
                }else if(jsonTypeChildExtViews[childExtController.entityRef]==="tcv-n-n-multicheck"){
                    childExtController.loadNNMulticheckData();
                }
            });
        }
    };
    
    Instance.formSavedResponse= function(responseText){
        if(responseText.success){
            
            Instance.entityExtView.entityExtStore.upload(Instance.entityExtView.formComponent, responseText.data.id, function(responseUpload){
                Ext.MessageBox.alert('Status', responseText.message+"<br>"+responseUpload.message);
                if(responseUpload.success){
                    var record= Ext.create(Instance.modelName);
                    record.data= responseUpload.data;
                    Instance.entityExtView.formComponent.setActiveRecord(record || null);
                    
                    Instance.loadChildExtControllers(record.data.id);
                }
            });
            
            
        }else{
            Ext.MessageBox.alert('Status', responseText.message);
        }
    };
    
    Instance.doFilter= function(){
        var url= "?filter="+JSON.stringify(Instance.filter);
        console.log(url);
        mvcExt.navigate(url);
    };
    
    Instance.viewInternalPage= function(path){
        var urlAction= path;
        if(Instance.idEntitySelected!==""){
            urlAction+='#?filter={"eq":{"productImage":'+Instance.idEntitySelected+'}}';
        }
        mvcExt.redirect(urlAction);
    };

    Instance.init();
}
</script>
        
        
        <!-- ############################ IMPORT INTERFACES ################################### -->
        
        
            

<script>

function CategoryExtInterfaces(parentExtController, parentExtView){
    
    var Instance= this;
    
    Instance.modelName="CategoryModel";
    
    // MODELS **********************************************
    
    Instance.entityExtModel= new CategoryExtModel();
    
    // STORES **********************************************
    
    Instance.entityExtStore= new CategoryExtStore();
    
    //*******************************************************
    
    var util= new Util();
    
    
    Instance.init= function(){
        Instance.pluralEntityTitle= 'Categorias';
        Instance.entityExtModel.defineModel(Instance.modelName);
        Instance.store= Instance.entityExtStore.getStore(Instance.modelName);
        Instance.combobox={};
        Instance.comboboxRender={};
    };
    
    Instance.setFilterStore= function(filter){
        Instance.store.getProxy().extraParams.filter= filter;
    };
    
    Instance.reloadPageStore= function(page){
        Instance.store.loadPage(page);
    };
    
    Instance.addLevel= function(entity){
        var source= parentExtView.propertyGrid.getSource();
        
        if(entity!==null && typeof(entity)!=='undefined'){
            source['Category']= entity.id+"__"+entity.name;
        }else{
            delete source['Category'];
        }
            
        parentExtView.propertyGrid.setSource(source);
    };
    
    Instance.getCombobox= function(component, entityDestination, fieldName, fieldTitle){
        Instance.store.pageSize= 1000;
        Instance.store.sorters.items[0].property='name';
        Instance.store.sorters.items[0].direction='ASC';
        Instance.combobox[component]= new Ext.form.ComboBox({
            id: component+'Combobox'+fieldName+'In'+entityDestination,
            name: fieldName,
            allowBlank: true,
            editable: true,
            store: Instance.store,
            displayField: 'name',
            valueField: 'id',
            queryMode: 'remote',
            optionAll: false,
            comboboxDependent: [],
            reloadData: false,
            realGridValue: null,
            listeners: {
                change: function(record){
                    /*console.log("CHANGE>>"+JSON.stringify(record.getValue()));
                    console.log("component>>"+component);
                    if(typeof record.getValue() === "object"){
                       console.log("VALID>>"+JSON.stringify(record.getValue()));
                       Instance.combobox["grid"].realGridValue=record.getValue();
                    }else if(util.isNumeric(record.getValue())){
                        console.log(record.getValue());
                       Instance.combobox["grid"].realGridValue=record.getValue();
                    }else{
                        console.log("ERROR");
                    }*/
                    if(component==='filter'){
                        if(record.getValue()!==0){
                            parentExtController.filter.eq[fieldName]= record.getValue();
                        }else{
                            delete parentExtController.filter.eq[fieldName];
                        }
                    }
                    
                    this.comboboxDependent.forEach(function(combobox) {
                        var filter= {"eq":{"category":record.getValue()}};
                        combobox.store.getProxy().extraParams.filter= JSON.stringify(filter);
                        combobox.reloadData= true;
                    });
                },
                el: {
                    click: function() {
                        if(this.combobox[component].reloadData){
                            this.combobox[component].store.loadPage(1);
                            this.combobox[component].reloadData= false;
                        }
                        /*if(component==="grid"){
                            console.log("RG "+JSON.stringify(this.combobox[component].realGridValue));
                            if(this.combobox[component].realGridValue!==null){
                                console.log("IN SET");
                                this.combobox[component].setValue(this.combobox[component].realGridValue);
                            }
                            console.log("CLICK>> "+JSON.stringify(this.combobox[component].getValue()));
                        }
                        console.log("end");*/
                    },
                    scope: this
                }
            }/*,
            getDisplayValue: function() {
                var me = this,
                value = me.value,
                record = null;
                if(value) {
                    record = me.getStore().findRecord(me.valueField, value);
                }
                if(record) {
                    console.log(record.get(me.displayField));
                    return util.htmlEntitiesDecode(record.get(me.displayField));
                }
                return value;
            }*/
        });
        
        if(component!=='grid'){
            Instance.combobox[component].fieldLabel= fieldTitle;
        }
        
        if(component==='filter'){
            Instance.store.addListener('load', function(){
                var rec = { id: 0, name: '-' };
                Instance.store.insert(0,rec);
            });
        }
        
        return Instance.combobox[component];
    };
    
    Instance.getComboboxRender= function(component){
        Instance.comboboxRender[component]= function (value, p, record){
            var displayField= Instance.combobox[component].displayField;
            var valueField= Instance.combobox[component].valueField;

            if (typeof value === "object" && Object.getOwnPropertyNames(value).length === 0){
                return "";
            }else if(typeof(value[displayField]) !== 'undefined'){
                return value[displayField];
            }else{
                if(typeof(value[valueField]) !== 'undefined'){
                    value= value[valueField];
                }
                var record = Instance.combobox[component].findRecord(valueField, value);
                if(record){
                    return record.get(Instance.combobox[component].displayField);
                }else{
                    return value;
                }
            }
        };
        
        return Instance.comboboxRender[component];
    };
    
    Instance.getCheckboxGroup= function(entityDestination, fieldName, callback){
        
        Instance.checkboxGroup=  new Ext.form.CheckboxGroup({
            id: 'checkboxGroup'+fieldName+'In'+entityDestination,
            fieldLabel: 'Listado '+Instance.pluralEntityTitle,
            allowBlank: true,
            columns: 3,
            vertical: true,
            items: []
        });
        
        Instance.entityExtStore.find("", "", function(responseText){
            if(responseText.success){
                responseText.data.forEach(function(item){
                    var cb = Ext.create('Ext.form.field.Checkbox', {
                        id: 'checkNN'+fieldName+item.id,
                        boxLabel: item.name,
                        name: fieldName,
                        inputValue: item.id,
                        checked: false,
                        activeChange: true,
                        listeners: {
                            change: callback
                        }
                    });
                    Instance.checkboxGroup.add(cb);
                });
            }
        });
        
        return Instance.checkboxGroup;
    };

    Instance.init();
}
</script>
        
            

<script>

function CommerceExtInterfaces(parentExtController, parentExtView){
    
    var Instance= this;
    
    Instance.modelName="CommerceModel";
    
    // MODELS **********************************************
    
    Instance.entityExtModel= new CommerceExtModel();
    
    // STORES **********************************************
    
    Instance.entityExtStore= new CommerceExtStore();
    
    //*******************************************************
    
    var util= new Util();
    
    
    Instance.init= function(){
        Instance.pluralEntityTitle= 'Comercios';
        Instance.entityExtModel.defineModel(Instance.modelName);
        Instance.store= Instance.entityExtStore.getStore(Instance.modelName);
        Instance.combobox={};
        Instance.comboboxRender={};
    };
    
    Instance.setFilterStore= function(filter){
        Instance.store.getProxy().extraParams.filter= filter;
    };
    
    Instance.reloadPageStore= function(page){
        Instance.store.loadPage(page);
    };
    
    Instance.addLevel= function(entity){
        var source= parentExtView.propertyGrid.getSource();
        
        if(entity!==null && typeof(entity)!=='undefined'){
            source['Commerce']= entity.id+"__"+entity.commerceName;
        }else{
            delete source['Commerce'];
        }
            
        parentExtView.propertyGrid.setSource(source);
    };
    
    Instance.getCombobox= function(component, entityDestination, fieldName, fieldTitle){
        Instance.store.pageSize= 1000;
        Instance.store.sorters.items[0].property='commerceName';
        Instance.store.sorters.items[0].direction='ASC';
        Instance.combobox[component]= new Ext.form.ComboBox({
            id: component+'Combobox'+fieldName+'In'+entityDestination,
            name: fieldName,
            allowBlank: true,
            editable: true,
            store: Instance.store,
            displayField: 'commerceName',
            valueField: 'id',
            queryMode: 'remote',
            optionAll: false,
            comboboxDependent: [],
            reloadData: false,
            realGridValue: null,
            listeners: {
                change: function(record){
                    /*console.log("CHANGE>>"+JSON.stringify(record.getValue()));
                    console.log("component>>"+component);
                    if(typeof record.getValue() === "object"){
                       console.log("VALID>>"+JSON.stringify(record.getValue()));
                       Instance.combobox["grid"].realGridValue=record.getValue();
                    }else if(util.isNumeric(record.getValue())){
                        console.log(record.getValue());
                       Instance.combobox["grid"].realGridValue=record.getValue();
                    }else{
                        console.log("ERROR");
                    }*/
                    if(component==='filter'){
                        if(record.getValue()!==0){
                            parentExtController.filter.eq[fieldName]= record.getValue();
                        }else{
                            delete parentExtController.filter.eq[fieldName];
                        }
                    }
                    
                    this.comboboxDependent.forEach(function(combobox) {
                        var filter= {"eq":{"commerce":record.getValue()}};
                        combobox.store.getProxy().extraParams.filter= JSON.stringify(filter);
                        combobox.reloadData= true;
                    });
                },
                el: {
                    click: function() {
                        if(this.combobox[component].reloadData){
                            this.combobox[component].store.loadPage(1);
                            this.combobox[component].reloadData= false;
                        }
                        /*if(component==="grid"){
                            console.log("RG "+JSON.stringify(this.combobox[component].realGridValue));
                            if(this.combobox[component].realGridValue!==null){
                                console.log("IN SET");
                                this.combobox[component].setValue(this.combobox[component].realGridValue);
                            }
                            console.log("CLICK>> "+JSON.stringify(this.combobox[component].getValue()));
                        }
                        console.log("end");*/
                    },
                    scope: this
                }
            }/*,
            getDisplayValue: function() {
                var me = this,
                value = me.value,
                record = null;
                if(value) {
                    record = me.getStore().findRecord(me.valueField, value);
                }
                if(record) {
                    console.log(record.get(me.displayField));
                    return util.htmlEntitiesDecode(record.get(me.displayField));
                }
                return value;
            }*/
        });
        
        if(component!=='grid'){
            Instance.combobox[component].fieldLabel= fieldTitle;
        }
        
        if(component==='filter'){
            Instance.store.addListener('load', function(){
                var rec = { id: 0, commerceName: '-' };
                Instance.store.insert(0,rec);
            });
        }
        
        return Instance.combobox[component];
    };
    
    Instance.getComboboxRender= function(component){
        Instance.comboboxRender[component]= function (value, p, record){
            var displayField= Instance.combobox[component].displayField;
            var valueField= Instance.combobox[component].valueField;

            if (typeof value === "object" && Object.getOwnPropertyNames(value).length === 0){
                return "";
            }else if(typeof(value[displayField]) !== 'undefined'){
                return value[displayField];
            }else{
                if(typeof(value[valueField]) !== 'undefined'){
                    value= value[valueField];
                }
                var record = Instance.combobox[component].findRecord(valueField, value);
                if(record){
                    return record.get(Instance.combobox[component].displayField);
                }else{
                    return value;
                }
            }
        };
        
        return Instance.comboboxRender[component];
    };
    
    Instance.getCheckboxGroup= function(entityDestination, fieldName, callback){
        
        Instance.checkboxGroup=  new Ext.form.CheckboxGroup({
            id: 'checkboxGroup'+fieldName+'In'+entityDestination,
            fieldLabel: 'Listado '+Instance.pluralEntityTitle,
            allowBlank: true,
            columns: 3,
            vertical: true,
            items: []
        });
        
        Instance.entityExtStore.find("", "", function(responseText){
            if(responseText.success){
                responseText.data.forEach(function(item){
                    var cb = Ext.create('Ext.form.field.Checkbox', {
                        id: 'checkNN'+fieldName+item.id,
                        boxLabel: item.commerceName,
                        name: fieldName,
                        inputValue: item.id,
                        checked: false,
                        activeChange: true,
                        listeners: {
                            change: callback
                        }
                    });
                    Instance.checkboxGroup.add(cb);
                });
            }
        });
        
        return Instance.checkboxGroup;
    };

    Instance.init();
}
</script>
        
            

<script>

function SubCategoryExtInterfaces(parentExtController, parentExtView){
    
    var Instance= this;
    
    Instance.modelName="SubCategoryModel";
    
    // MODELS **********************************************
    
    Instance.entityExtModel= new SubCategoryExtModel();
    
    // STORES **********************************************
    
    Instance.entityExtStore= new SubCategoryExtStore();
    
    //*******************************************************
    
    var util= new Util();
    
    
    Instance.init= function(){
        Instance.pluralEntityTitle= 'Sub Categorias';
        Instance.entityExtModel.defineModel(Instance.modelName);
        Instance.store= Instance.entityExtStore.getStore(Instance.modelName);
        Instance.combobox={};
        Instance.comboboxRender={};
    };
    
    Instance.setFilterStore= function(filter){
        Instance.store.getProxy().extraParams.filter= filter;
    };
    
    Instance.reloadPageStore= function(page){
        Instance.store.loadPage(page);
    };
    
    Instance.addLevel= function(entity){
        var source= parentExtView.propertyGrid.getSource();
        
        if(entity!==null && typeof(entity)!=='undefined'){
            source['SubCategory']= entity.id+"__"+entity.name;
        }else{
            delete source['SubCategory'];
        }
            
        parentExtView.propertyGrid.setSource(source);
    };
    
    Instance.getCombobox= function(component, entityDestination, fieldName, fieldTitle){
        Instance.store.pageSize= 1000;
        Instance.store.sorters.items[0].property='name';
        Instance.store.sorters.items[0].direction='ASC';
        Instance.combobox[component]= new Ext.form.ComboBox({
            id: component+'Combobox'+fieldName+'In'+entityDestination,
            name: fieldName,
            allowBlank: true,
            editable: true,
            store: Instance.store,
            displayField: 'name',
            valueField: 'id',
            queryMode: 'remote',
            optionAll: false,
            comboboxDependent: [],
            reloadData: false,
            realGridValue: null,
            listeners: {
                change: function(record){
                    /*console.log("CHANGE>>"+JSON.stringify(record.getValue()));
                    console.log("component>>"+component);
                    if(typeof record.getValue() === "object"){
                       console.log("VALID>>"+JSON.stringify(record.getValue()));
                       Instance.combobox["grid"].realGridValue=record.getValue();
                    }else if(util.isNumeric(record.getValue())){
                        console.log(record.getValue());
                       Instance.combobox["grid"].realGridValue=record.getValue();
                    }else{
                        console.log("ERROR");
                    }*/
                    if(component==='filter'){
                        if(record.getValue()!==0){
                            parentExtController.filter.eq[fieldName]= record.getValue();
                        }else{
                            delete parentExtController.filter.eq[fieldName];
                        }
                    }
                    
                    this.comboboxDependent.forEach(function(combobox) {
                        var filter= {"eq":{"subCategory":record.getValue()}};
                        combobox.store.getProxy().extraParams.filter= JSON.stringify(filter);
                        combobox.reloadData= true;
                    });
                },
                el: {
                    click: function() {
                        if(this.combobox[component].reloadData){
                            this.combobox[component].store.loadPage(1);
                            this.combobox[component].reloadData= false;
                        }
                        /*if(component==="grid"){
                            console.log("RG "+JSON.stringify(this.combobox[component].realGridValue));
                            if(this.combobox[component].realGridValue!==null){
                                console.log("IN SET");
                                this.combobox[component].setValue(this.combobox[component].realGridValue);
                            }
                            console.log("CLICK>> "+JSON.stringify(this.combobox[component].getValue()));
                        }
                        console.log("end");*/
                    },
                    scope: this
                }
            }/*,
            getDisplayValue: function() {
                var me = this,
                value = me.value,
                record = null;
                if(value) {
                    record = me.getStore().findRecord(me.valueField, value);
                }
                if(record) {
                    console.log(record.get(me.displayField));
                    return util.htmlEntitiesDecode(record.get(me.displayField));
                }
                return value;
            }*/
        });
        
        if(component!=='grid'){
            Instance.combobox[component].fieldLabel= fieldTitle;
        }
        
        if(component==='filter'){
            Instance.store.addListener('load', function(){
                var rec = { id: 0, name: '-' };
                Instance.store.insert(0,rec);
            });
        }
        
        return Instance.combobox[component];
    };
    
    Instance.getComboboxRender= function(component){
        Instance.comboboxRender[component]= function (value, p, record){
            var displayField= Instance.combobox[component].displayField;
            var valueField= Instance.combobox[component].valueField;

            if (typeof value === "object" && Object.getOwnPropertyNames(value).length === 0){
                return "";
            }else if(typeof(value[displayField]) !== 'undefined'){
                return value[displayField];
            }else{
                if(typeof(value[valueField]) !== 'undefined'){
                    value= value[valueField];
                }
                var record = Instance.combobox[component].findRecord(valueField, value);
                if(record){
                    return record.get(Instance.combobox[component].displayField);
                }else{
                    return value;
                }
            }
        };
        
        return Instance.comboboxRender[component];
    };
    
    Instance.getCheckboxGroup= function(entityDestination, fieldName, callback){
        
        Instance.checkboxGroup=  new Ext.form.CheckboxGroup({
            id: 'checkboxGroup'+fieldName+'In'+entityDestination,
            fieldLabel: 'Listado '+Instance.pluralEntityTitle,
            allowBlank: true,
            columns: 3,
            vertical: true,
            items: []
        });
        
        Instance.entityExtStore.find("", "", function(responseText){
            if(responseText.success){
                responseText.data.forEach(function(item){
                    var cb = Ext.create('Ext.form.field.Checkbox', {
                        id: 'checkNN'+fieldName+item.id,
                        boxLabel: item.name,
                        name: fieldName,
                        inputValue: item.id,
                        checked: false,
                        activeChange: true,
                        listeners: {
                            change: callback
                        }
                    });
                    Instance.checkboxGroup.add(cb);
                });
            }
        });
        
        return Instance.checkboxGroup;
    };

    Instance.init();
}
</script>
        
            

<script>

function SupplierExtInterfaces(parentExtController, parentExtView){
    
    var Instance= this;
    
    Instance.modelName="SupplierModel";
    
    // MODELS **********************************************
    
    Instance.entityExtModel= new SupplierExtModel();
    
    // STORES **********************************************
    
    Instance.entityExtStore= new SupplierExtStore();
    
    //*******************************************************
    
    var util= new Util();
    
    
    Instance.init= function(){
        Instance.pluralEntityTitle= 'Proveedores';
        Instance.entityExtModel.defineModel(Instance.modelName);
        Instance.store= Instance.entityExtStore.getStore(Instance.modelName);
        Instance.combobox={};
        Instance.comboboxRender={};
    };
    
    Instance.setFilterStore= function(filter){
        Instance.store.getProxy().extraParams.filter= filter;
    };
    
    Instance.reloadPageStore= function(page){
        Instance.store.loadPage(page);
    };
    
    Instance.addLevel= function(entity){
        var source= parentExtView.propertyGrid.getSource();
        
        if(entity!==null && typeof(entity)!=='undefined'){
            source['Supplier']= entity.id+"__"+entity.companyName;
        }else{
            delete source['Supplier'];
        }
            
        parentExtView.propertyGrid.setSource(source);
    };
    
    Instance.getCombobox= function(component, entityDestination, fieldName, fieldTitle){
        Instance.store.pageSize= 1000;
        Instance.store.sorters.items[0].property='companyName';
        Instance.store.sorters.items[0].direction='ASC';
        Instance.combobox[component]= new Ext.form.ComboBox({
            id: component+'Combobox'+fieldName+'In'+entityDestination,
            name: fieldName,
            allowBlank: true,
            editable: true,
            store: Instance.store,
            displayField: 'companyName',
            valueField: 'id',
            queryMode: 'remote',
            optionAll: false,
            comboboxDependent: [],
            reloadData: false,
            realGridValue: null,
            listeners: {
                change: function(record){
                    /*console.log("CHANGE>>"+JSON.stringify(record.getValue()));
                    console.log("component>>"+component);
                    if(typeof record.getValue() === "object"){
                       console.log("VALID>>"+JSON.stringify(record.getValue()));
                       Instance.combobox["grid"].realGridValue=record.getValue();
                    }else if(util.isNumeric(record.getValue())){
                        console.log(record.getValue());
                       Instance.combobox["grid"].realGridValue=record.getValue();
                    }else{
                        console.log("ERROR");
                    }*/
                    if(component==='filter'){
                        if(record.getValue()!==0){
                            parentExtController.filter.eq[fieldName]= record.getValue();
                        }else{
                            delete parentExtController.filter.eq[fieldName];
                        }
                    }
                    
                    this.comboboxDependent.forEach(function(combobox) {
                        var filter= {"eq":{"supplier":record.getValue()}};
                        combobox.store.getProxy().extraParams.filter= JSON.stringify(filter);
                        combobox.reloadData= true;
                    });
                },
                el: {
                    click: function() {
                        if(this.combobox[component].reloadData){
                            this.combobox[component].store.loadPage(1);
                            this.combobox[component].reloadData= false;
                        }
                        /*if(component==="grid"){
                            console.log("RG "+JSON.stringify(this.combobox[component].realGridValue));
                            if(this.combobox[component].realGridValue!==null){
                                console.log("IN SET");
                                this.combobox[component].setValue(this.combobox[component].realGridValue);
                            }
                            console.log("CLICK>> "+JSON.stringify(this.combobox[component].getValue()));
                        }
                        console.log("end");*/
                    },
                    scope: this
                }
            }/*,
            getDisplayValue: function() {
                var me = this,
                value = me.value,
                record = null;
                if(value) {
                    record = me.getStore().findRecord(me.valueField, value);
                }
                if(record) {
                    console.log(record.get(me.displayField));
                    return util.htmlEntitiesDecode(record.get(me.displayField));
                }
                return value;
            }*/
        });
        
        if(component!=='grid'){
            Instance.combobox[component].fieldLabel= fieldTitle;
        }
        
        if(component==='filter'){
            Instance.store.addListener('load', function(){
                var rec = { id: 0, companyName: '-' };
                Instance.store.insert(0,rec);
            });
        }
        
        return Instance.combobox[component];
    };
    
    Instance.getComboboxRender= function(component){
        Instance.comboboxRender[component]= function (value, p, record){
            var displayField= Instance.combobox[component].displayField;
            var valueField= Instance.combobox[component].valueField;

            if (typeof value === "object" && Object.getOwnPropertyNames(value).length === 0){
                return "";
            }else if(typeof(value[displayField]) !== 'undefined'){
                return value[displayField];
            }else{
                if(typeof(value[valueField]) !== 'undefined'){
                    value= value[valueField];
                }
                var record = Instance.combobox[component].findRecord(valueField, value);
                if(record){
                    return record.get(Instance.combobox[component].displayField);
                }else{
                    return value;
                }
            }
        };
        
        return Instance.comboboxRender[component];
    };
    
    Instance.getCheckboxGroup= function(entityDestination, fieldName, callback){
        
        Instance.checkboxGroup=  new Ext.form.CheckboxGroup({
            id: 'checkboxGroup'+fieldName+'In'+entityDestination,
            fieldLabel: 'Listado '+Instance.pluralEntityTitle,
            allowBlank: true,
            columns: 3,
            vertical: true,
            items: []
        });
        
        Instance.entityExtStore.find("", "", function(responseText){
            if(responseText.success){
                responseText.data.forEach(function(item){
                    var cb = Ext.create('Ext.form.field.Checkbox', {
                        id: 'checkNN'+fieldName+item.id,
                        boxLabel: item.companyName,
                        name: fieldName,
                        inputValue: item.id,
                        checked: false,
                        activeChange: true,
                        listeners: {
                            change: callback
                        }
                    });
                    Instance.checkboxGroup.add(cb);
                });
            }
        });
        
        return Instance.checkboxGroup;
    };

    Instance.init();
}
</script>
        
        
        
            

<script>

function ProductExtInterfaces(parentExtController, parentExtView){
    
    var Instance= this;
    
    Instance.modelName="ProductModel";
    
    // MODELS **********************************************
    
    Instance.entityExtModel= new ProductExtModel();
    
    // STORES **********************************************
    
    Instance.entityExtStore= new ProductExtStore();
    
    //*******************************************************
    
    var util= new Util();
    
    
    Instance.init= function(){
        Instance.pluralEntityTitle= 'Productos';
        Instance.entityExtModel.defineModel(Instance.modelName);
        Instance.store= Instance.entityExtStore.getStore(Instance.modelName);
        Instance.combobox={};
        Instance.comboboxRender={};
    };
    
    Instance.setFilterStore= function(filter){
        Instance.store.getProxy().extraParams.filter= filter;
    };
    
    Instance.reloadPageStore= function(page){
        Instance.store.loadPage(page);
    };
    
    Instance.addLevel= function(entity){
        var source= parentExtView.propertyGrid.getSource();
        
        if(entity!==null && typeof(entity)!=='undefined'){
            source['Product']= entity.id+"__"+entity.name;
        }else{
            delete source['Product'];
        }
            
        parentExtView.propertyGrid.setSource(source);
    };
    
    Instance.getCombobox= function(component, entityDestination, fieldName, fieldTitle){
        Instance.store.pageSize= 1000;
        Instance.store.sorters.items[0].property='name';
        Instance.store.sorters.items[0].direction='ASC';
        Instance.combobox[component]= new Ext.form.ComboBox({
            id: component+'Combobox'+fieldName+'In'+entityDestination,
            name: fieldName,
            allowBlank: true,
            editable: true,
            store: Instance.store,
            displayField: 'name',
            valueField: 'id',
            queryMode: 'remote',
            optionAll: false,
            comboboxDependent: [],
            reloadData: false,
            realGridValue: null,
            listeners: {
                change: function(record){
                    /*console.log("CHANGE>>"+JSON.stringify(record.getValue()));
                    console.log("component>>"+component);
                    if(typeof record.getValue() === "object"){
                       console.log("VALID>>"+JSON.stringify(record.getValue()));
                       Instance.combobox["grid"].realGridValue=record.getValue();
                    }else if(util.isNumeric(record.getValue())){
                        console.log(record.getValue());
                       Instance.combobox["grid"].realGridValue=record.getValue();
                    }else{
                        console.log("ERROR");
                    }*/
                    if(component==='filter'){
                        if(record.getValue()!==0){
                            parentExtController.filter.eq[fieldName]= record.getValue();
                        }else{
                            delete parentExtController.filter.eq[fieldName];
                        }
                    }
                    
                    this.comboboxDependent.forEach(function(combobox) {
                        var filter= {"eq":{"product":record.getValue()}};
                        combobox.store.getProxy().extraParams.filter= JSON.stringify(filter);
                        combobox.reloadData= true;
                    });
                },
                el: {
                    click: function() {
                        if(this.combobox[component].reloadData){
                            this.combobox[component].store.loadPage(1);
                            this.combobox[component].reloadData= false;
                        }
                        /*if(component==="grid"){
                            console.log("RG "+JSON.stringify(this.combobox[component].realGridValue));
                            if(this.combobox[component].realGridValue!==null){
                                console.log("IN SET");
                                this.combobox[component].setValue(this.combobox[component].realGridValue);
                            }
                            console.log("CLICK>> "+JSON.stringify(this.combobox[component].getValue()));
                        }
                        console.log("end");*/
                    },
                    scope: this
                }
            }/*,
            getDisplayValue: function() {
                var me = this,
                value = me.value,
                record = null;
                if(value) {
                    record = me.getStore().findRecord(me.valueField, value);
                }
                if(record) {
                    console.log(record.get(me.displayField));
                    return util.htmlEntitiesDecode(record.get(me.displayField));
                }
                return value;
            }*/
        });
        
        if(component!=='grid'){
            Instance.combobox[component].fieldLabel= fieldTitle;
        }
        
        if(component==='filter'){
            Instance.store.addListener('load', function(){
                var rec = { id: 0, name: '-' };
                Instance.store.insert(0,rec);
            });
        }
        
        return Instance.combobox[component];
    };
    
    Instance.getComboboxRender= function(component){
        Instance.comboboxRender[component]= function (value, p, record){
            var displayField= Instance.combobox[component].displayField;
            var valueField= Instance.combobox[component].valueField;

            if (typeof value === "object" && Object.getOwnPropertyNames(value).length === 0){
                return "";
            }else if(typeof(value[displayField]) !== 'undefined'){
                return value[displayField];
            }else{
                if(typeof(value[valueField]) !== 'undefined'){
                    value= value[valueField];
                }
                var record = Instance.combobox[component].findRecord(valueField, value);
                if(record){
                    return record.get(Instance.combobox[component].displayField);
                }else{
                    return value;
                }
            }
        };
        
        return Instance.comboboxRender[component];
    };
    
    Instance.getCheckboxGroup= function(entityDestination, fieldName, callback){
        
        Instance.checkboxGroup=  new Ext.form.CheckboxGroup({
            id: 'checkboxGroup'+fieldName+'In'+entityDestination,
            fieldLabel: 'Listado '+Instance.pluralEntityTitle,
            allowBlank: true,
            columns: 3,
            vertical: true,
            items: []
        });
        
        Instance.entityExtStore.find("", "", function(responseText){
            if(responseText.success){
                responseText.data.forEach(function(item){
                    var cb = Ext.create('Ext.form.field.Checkbox', {
                        id: 'checkNN'+fieldName+item.id,
                        boxLabel: item.name,
                        name: fieldName,
                        inputValue: item.id,
                        checked: false,
                        activeChange: true,
                        listeners: {
                            change: callback
                        }
                    });
                    Instance.checkboxGroup.add(cb);
                });
            }
        });
        
        return Instance.checkboxGroup;
    };

    Instance.init();
}
</script>
        
        
        <!-- ############################ IMPORT BASE ELEMENTES ################################### -->
        
        
<script>

function ProductExtViewport(){
    
    var Instance= this;
    
    var util= new Util();
    
    Instance.entityExtController= new ProductExtController(null, Instance);
    
    
    Instance.init= function(){
        var views = [];
        
        views.push(Instance.entityExtController.entityExtView.getMainView());

        Instance.contentViews = {
             id: 'content-panel',
             region: 'center',
             layout: 'card',
             margins: '0 0 0 0',
             //margins: '5 5 5 5',
             activeItem: 0,
             border: false,
             items: views
        };
        
        Instance.border= {
            region: 'center',
            layout: 'border',
            bodyBorder: false,
            defaults: {
                split: true
            },
            items: [Instance.contentViews]
        };
        
        
        Instance.filters = Ext.create('Ext.form.Panel', {
            id: 'filters-panel',
            title: 'Filtros',
            region: 'west',
            plain: true,
            bodyBorder: false,
            bodyPadding: 10,
            margins: '0 0 0 0',
            //margins: '5 0 5 5',
            split: true,
            collapsible: true,
            collapsed: true,
            height: '100%',
            autoScroll: true,
            width: 400,
            minSize: 200,

            fieldDefaults: {
                labelWidth: "51%",
                anchor: '100%',
                labelAlign: 'right'
            },

            layout: {
                type: 'vbox',
                align: 'stretch'  // Child items are stretched to full width
            },

            items: [{"xtype":"numberfield","listeners":{"change":function(){   if(this.getValue()!==null && this.getValue()!==''){       Instance.entityExtController.filter.eq.id= this.getValue();   }else{       delete Instance.entityExtController.filter.eq.id;   }}},"fieldLabel":"Id","name":"id"},{"xtype":"textfield","listeners":{"change":function(){   if(this.getValue()!==null && this.getValue()!==''){       Instance.entityExtController.filter.lk.code= this.getValue();   }else{       delete Instance.entityExtController.filter.lk.code;   }}},"fieldLabel":"C&oacute;digo","name":"code"},{"xtype":"textfield","listeners":{"change":function(){   if(this.getValue()!==null && this.getValue()!==''){       Instance.entityExtController.filter.lk.name= this.getValue();   }else{       delete Instance.entityExtController.filter.lk.name;   }}},"fieldLabel":"Nombre","name":"name"},{"xtype":"textfield","listeners":{"change":function(){   if(this.getValue()!==null && this.getValue()!==''){       Instance.entityExtController.filter.lk.brand= this.getValue();   }else{       delete Instance.entityExtController.filter.lk.brand;   }}},"fieldLabel":"Marca","name":"brand"},{"xtype":"textfield","listeners":{"change":function(){   if(this.getValue()!==null && this.getValue()!==''){       Instance.entityExtController.filter.lk.quantityPerUnit= this.getValue();   }else{       delete Instance.entityExtController.filter.lk.quantityPerUnit;   }}},"fieldLabel":"Cantidad por unidad","name":"quantityPerUnit"},{"layout":"column","xtype":"panel","bodyStyle":"padding-bottom: 5px;","items":[{"columnWidth":0.34,"html":"Precio Sugerido:&nbsp;","style":"text-align: right"},{"xtype":"numberfield","listeners":{"change":function(){   if(Instance.entityExtController.filter.btw.seggestedUnitPrice === undefined){           Instance.entityExtController.filter.btw.seggestedUnitPrice= [null,null];   }   if(this.getValue()!==null){       Instance.entityExtController.filter.btw.seggestedUnitPrice[0]= this.getValue();   }else{       Instance.entityExtController.filter.btw.seggestedUnitPrice[0]= null;   }   if(Instance.entityExtController.filter.btw.seggestedUnitPrice[0]===null && Instance.entityExtController.filter.btw.seggestedUnitPrice[1]===null){       delete Instance.entityExtController.filter.btw.seggestedUnitPrice;   }}},"name":"seggestedUnitPrice_start","columnWidth":0.31},{"columnWidth":0.04,"html":"&nbsp;-&nbsp;"},{"xtype":"numberfield","listeners":{"change":function(){   if(Instance.entityExtController.filter.btw.seggestedUnitPrice === undefined){           Instance.entityExtController.filter.btw.seggestedUnitPrice= [null,null];   }   if(this.getValue()!==null){       Instance.entityExtController.filter.btw.seggestedUnitPrice[1]= this.getValue();   }else{       Instance.entityExtController.filter.btw.seggestedUnitPrice[1]= null;   }   if(Instance.entityExtController.filter.btw.seggestedUnitPrice[0]===null && Instance.entityExtController.filter.btw.seggestedUnitPrice[1]===null){       delete Instance.entityExtController.filter.btw.seggestedUnitPrice;   }}},"name":"seggestedUnitPrice_end","columnWidth":0.31}]},{"layout":"column","xtype":"panel","bodyStyle":"padding-bottom: 5px;","items":[{"columnWidth":0.34,"html":"Precio Unitario:&nbsp;","style":"text-align: right"},{"xtype":"numberfield","listeners":{"change":function(){   if(Instance.entityExtController.filter.btw.buyUnitPrice === undefined){           Instance.entityExtController.filter.btw.buyUnitPrice= [null,null];   }   if(this.getValue()!==null){       Instance.entityExtController.filter.btw.buyUnitPrice[0]= this.getValue();   }else{       Instance.entityExtController.filter.btw.buyUnitPrice[0]= null;   }   if(Instance.entityExtController.filter.btw.buyUnitPrice[0]===null && Instance.entityExtController.filter.btw.buyUnitPrice[1]===null){       delete Instance.entityExtController.filter.btw.buyUnitPrice;   }}},"name":"buyUnitPrice_start","columnWidth":0.31},{"columnWidth":0.04,"html":"&nbsp;-&nbsp;"},{"xtype":"numberfield","listeners":{"change":function(){   if(Instance.entityExtController.filter.btw.buyUnitPrice === undefined){           Instance.entityExtController.filter.btw.buyUnitPrice= [null,null];   }   if(this.getValue()!==null){       Instance.entityExtController.filter.btw.buyUnitPrice[1]= this.getValue();   }else{       Instance.entityExtController.filter.btw.buyUnitPrice[1]= null;   }   if(Instance.entityExtController.filter.btw.buyUnitPrice[0]===null && Instance.entityExtController.filter.btw.buyUnitPrice[1]===null){       delete Instance.entityExtController.filter.btw.buyUnitPrice;   }}},"name":"buyUnitPrice_end","columnWidth":0.31}]},{"layout":"column","xtype":"panel","bodyStyle":"padding-bottom: 5px;","items":[{"columnWidth":0.34,"html":"Descuento:&nbsp;","style":"text-align: right"},{"xtype":"numberfield","listeners":{"change":function(){   if(Instance.entityExtController.filter.btw.discount === undefined){           Instance.entityExtController.filter.btw.discount= [null,null];   }   if(this.getValue()!==null){       Instance.entityExtController.filter.btw.discount[0]= this.getValue();   }else{       Instance.entityExtController.filter.btw.discount[0]= null;   }   if(Instance.entityExtController.filter.btw.discount[0]===null && Instance.entityExtController.filter.btw.discount[1]===null){       delete Instance.entityExtController.filter.btw.discount;   }}},"name":"discount_start","columnWidth":0.31},{"columnWidth":0.04,"html":"&nbsp;-&nbsp;"},{"xtype":"numberfield","listeners":{"change":function(){   if(Instance.entityExtController.filter.btw.discount === undefined){           Instance.entityExtController.filter.btw.discount= [null,null];   }   if(this.getValue()!==null){       Instance.entityExtController.filter.btw.discount[1]= this.getValue();   }else{       Instance.entityExtController.filter.btw.discount[1]= null;   }   if(Instance.entityExtController.filter.btw.discount[0]===null && Instance.entityExtController.filter.btw.discount[1]===null){       delete Instance.entityExtController.filter.btw.discount;   }}},"name":"discount_end","columnWidth":0.31}]},{"layout":"column","xtype":"panel","bodyStyle":"padding-bottom: 5px;","items":[{"columnWidth":0.34,"html":"Unidades en Stock:&nbsp;","style":"text-align: right"},{"xtype":"numberfield","listeners":{"change":function(){   if(Instance.entityExtController.filter.btw.unitsInStock === undefined){           Instance.entityExtController.filter.btw.unitsInStock= [null,null];   }   if(this.getValue()!==null){       Instance.entityExtController.filter.btw.unitsInStock[0]= this.getValue();   }else{       Instance.entityExtController.filter.btw.unitsInStock[0]= null;   }   if(Instance.entityExtController.filter.btw.unitsInStock[0]===null && Instance.entityExtController.filter.btw.unitsInStock[1]===null){       delete Instance.entityExtController.filter.btw.unitsInStock;   }}},"name":"unitsInStock_start","columnWidth":0.31},{"columnWidth":0.04,"html":"&nbsp;-&nbsp;"},{"xtype":"numberfield","listeners":{"change":function(){   if(Instance.entityExtController.filter.btw.unitsInStock === undefined){           Instance.entityExtController.filter.btw.unitsInStock= [null,null];   }   if(this.getValue()!==null){       Instance.entityExtController.filter.btw.unitsInStock[1]= this.getValue();   }else{       Instance.entityExtController.filter.btw.unitsInStock[1]= null;   }   if(Instance.entityExtController.filter.btw.unitsInStock[0]===null && Instance.entityExtController.filter.btw.unitsInStock[1]===null){       delete Instance.entityExtController.filter.btw.unitsInStock;   }}},"name":"unitsInStock_end","columnWidth":0.31}]},{"layout":"column","xtype":"panel","bodyStyle":"padding-bottom: 5px;","items":[{"columnWidth":0.34,"html":"Unidades en Ordenes:&nbsp;","style":"text-align: right"},{"xtype":"numberfield","listeners":{"change":function(){   if(Instance.entityExtController.filter.btw.unitsInOrder === undefined){           Instance.entityExtController.filter.btw.unitsInOrder= [null,null];   }   if(this.getValue()!==null){       Instance.entityExtController.filter.btw.unitsInOrder[0]= this.getValue();   }else{       Instance.entityExtController.filter.btw.unitsInOrder[0]= null;   }   if(Instance.entityExtController.filter.btw.unitsInOrder[0]===null && Instance.entityExtController.filter.btw.unitsInOrder[1]===null){       delete Instance.entityExtController.filter.btw.unitsInOrder;   }}},"name":"unitsInOrder_start","columnWidth":0.31},{"columnWidth":0.04,"html":"&nbsp;-&nbsp;"},{"xtype":"numberfield","listeners":{"change":function(){   if(Instance.entityExtController.filter.btw.unitsInOrder === undefined){           Instance.entityExtController.filter.btw.unitsInOrder= [null,null];   }   if(this.getValue()!==null){       Instance.entityExtController.filter.btw.unitsInOrder[1]= this.getValue();   }else{       Instance.entityExtController.filter.btw.unitsInOrder[1]= null;   }   if(Instance.entityExtController.filter.btw.unitsInOrder[0]===null && Instance.entityExtController.filter.btw.unitsInOrder[1]===null){       delete Instance.entityExtController.filter.btw.unitsInOrder;   }}},"name":"unitsInOrder_end","columnWidth":0.31}]},{"layout":"column","xtype":"panel","bodyStyle":"padding-bottom: 5px;","items":[{"columnWidth":0.34,"html":"Fecha Registro:&nbsp;","style":"text-align: right"},{"xtype":"datefield","listeners":{"change":function(){   if(Instance.entityExtController.filter.btw.registerDate === undefined){           Instance.entityExtController.filter.btw.registerDate= [null,null];   }   if(this.getValue()!==null){       Instance.entityExtController.filter.btw.registerDate[0]= Ext.Date.format(this.getValue(), 'd/m/Y');   }else{       Instance.entityExtController.filter.btw.registerDate[0]= null;   }   if(Instance.entityExtController.filter.btw.registerDate[0]===null && Instance.entityExtController.filter.btw.registerDate[1]===null){       delete Instance.entityExtController.filter.btw.registerDate;   }}},"name":"registerDate_start","format":"d/m/Y","tooltip":"Seleccione la fecha","columnWidth":0.31},{"columnWidth":0.04,"html":"&nbsp;-&nbsp;"},{"xtype":"datefield","listeners":{"change":function(){   if(Instance.entityExtController.filter.btw.registerDate === undefined){           Instance.entityExtController.filter.btw.registerDate= [null,null];   }   if(this.getValue()!==null){       Instance.entityExtController.filter.btw.registerDate[1]= Ext.Date.format(this.getValue(), 'd/m/Y');   }else{       Instance.entityExtController.filter.btw.registerDate[1]= null;   }   if(Instance.entityExtController.filter.btw.registerDate[0]===null && Instance.entityExtController.filter.btw.registerDate[1]===null){       delete Instance.entityExtController.filter.btw.registerDate;   }}},"name":"registerDate_end","format":"d/m/Y","tooltip":"Seleccione la fecha","columnWidth":0.31}]},{"xtype":"textfield","listeners":{"change":function(){   if(this.getValue()!==null && this.getValue()!==''){       Instance.entityExtController.filter.lk.keywords= this.getValue();   }else{       delete Instance.entityExtController.filter.lk.keywords;   }}},"fieldLabel":"Palabras clave","name":"keywords"},{"layout":"column","xtype":"panel","bodyStyle":"padding-bottom: 5px;","items":[{"columnWidth":0.34,"html":"Orden:&nbsp;","style":"text-align: right"},{"xtype":"numberfield","listeners":{"change":function(){   if(Instance.entityExtController.filter.btw.orderLevel === undefined){           Instance.entityExtController.filter.btw.orderLevel= [null,null];   }   if(this.getValue()!==null){       Instance.entityExtController.filter.btw.orderLevel[0]= this.getValue();   }else{       Instance.entityExtController.filter.btw.orderLevel[0]= null;   }   if(Instance.entityExtController.filter.btw.orderLevel[0]===null && Instance.entityExtController.filter.btw.orderLevel[1]===null){       delete Instance.entityExtController.filter.btw.orderLevel;   }}},"name":"orderLevel_start","columnWidth":0.31},{"columnWidth":0.04,"html":"&nbsp;-&nbsp;"},{"xtype":"numberfield","listeners":{"change":function(){   if(Instance.entityExtController.filter.btw.orderLevel === undefined){           Instance.entityExtController.filter.btw.orderLevel= [null,null];   }   if(this.getValue()!==null){       Instance.entityExtController.filter.btw.orderLevel[1]= this.getValue();   }else{       Instance.entityExtController.filter.btw.orderLevel[1]= null;   }   if(Instance.entityExtController.filter.btw.orderLevel[0]===null && Instance.entityExtController.filter.btw.orderLevel[1]===null){       delete Instance.entityExtController.filter.btw.orderLevel;   }}},"name":"orderLevel_end","columnWidth":0.31}]},{"xtype":"textfield","listeners":{"change":function(){   if(this.getValue()!==null && this.getValue()!==''){       Instance.entityExtController.filter.lk.description= this.getValue();   }else{       delete Instance.entityExtController.filter.lk.description;   }}},"fieldLabel":"Descripci&oacute;n","name":"description"},{"xtype":"checkbox","listeners":{"change":function(){   if(this.getValue()!==null && this.getValue()!==''){       Instance.entityExtController.filter.eq.featured= this.getValue();   }else{       delete Instance.entityExtController.filter.eq.featured;   }}},"fieldLabel":"Destacado","name":"featured"},Instance.entityExtController.entityExtView.commonExtView.getSimpleCombobox('status','Estado','filter',['Publicado','Agotado','Despublicado','Descontinuado','Eliminado']),Instance.entityExtController.entityExtView.filterComboboxCategory,Instance.entityExtController.entityExtView.filterComboboxSubCategory,Instance.entityExtController.entityExtView.filterComboboxSupplier,Instance.entityExtController.entityExtView.filterComboboxCommerce],
            
            dockedItems: [{
                xtype: 'toolbar',
                dock: 'bottom',
                ui: 'footer',
                items: ['->',{
                    text: 'Filtrar',
                    scope: this,
                    handler: function(){
                        Instance.entityExtController.doFilter();
                    }
                },{
                    text: 'Limpiar Filtros',
                    scope: this,
                    handler: function(){
                        Instance.filters.getForm().reset();
                        Instance.entityExtController.initFilter();
                        Instance.entityExtController.doFilter();
                    }
                }]
            }]
        });
        
        
        
        Instance.menuBar= Ext.create('Ext.toolbar.Toolbar', {
            region: 'north',
            items: [{"text":"Seguridad","menu":{"items":[{"text":"Gestionar Roles","href":"/vista/role/entity.htm"},{"text":"Gestionar Usuarios","href":"/vista/user/entity.htm"},{"text":"Gestionar Autorizaciones","href":"/vista/authorization/entity.htm"},{"text":"Gestionar Roles de Usuario","href":"/vista/userRole/entity.htm"},{"text":"Gestionar Recursos Web","href":"/vista/webResource/entity.htm"}]}},{"text":"Configuraci&oacute;n","menu":{"items":[{"text":"Gestionar Propiedades","href":"/vista/property/entity.htm"},{"text":"Gestionar Configuraci&oacute;n General","href":"/vista/generalConfig/configurationObject.htm"},{"text":"Mis datos","href":"/vista/myAccount/entity.htm"}]}},{"text":"Gestor de Contenidos","menu":{"items":[{"text":"Explorador de Archivos","href":"/vista/webFile/fileExplorer.htm"}]}},{"text":"Procesos","menu":{"items":[{"text":"Gestionar Servicios Externos","href":"/vista/externalService/process.htm"},{"text":"Gestionar Proceso Main Location","href":"/vista/processMainLocation/process.htm"},{"text":"Gestionar Procesos de Producto","href":"/vista/processProduct/process.htm"},{"text":"Gestionar Procesos de Ordenes de Compra","href":"/vista/processPurchaseOrder/process.htm"},{"text":"Gestionar Clientes SOAP","href":"/vista/soapClients/process.htm"},{"text":"Gestionar Procesos de Usuario","href":"/vista/processUser/process.htm"}]}},{"text":"Correos","menu":{"items":[{"text":"Gestionar Plantillas de Correo","href":"/vista/mailTemplate/entity.htm"},{"text":"Gestionar Correos","href":"/vista/mail/entity.htm"}]}},{"text":"Comercios","menu":{"items":[{"text":"Gestionar Comercios","href":"/vista/commerce/entity.htm"},{"text":"Gestionar Ubicaciones Principales","href":"/vista/mainLocation/entity.htm"}]}},{"text":"Productos","menu":{"items":[{"text":"Gestionar Categorias","href":"/vista/category/entity.htm"},{"text":"Gestionar Productos","href":"/vista/product/entity.htm"},{"text":"Reporte de Productos","href":"/vista/product/report/reporteProductos.htm"}]}},{"text":"Pedidos","menu":{"items":[{"text":"Gestionar Ordenes de Inventario","href":"/vista/inventoryOrder/entity.htm"},{"text":"Gestionar Proveedores","href":"/vista/supplier/entity.htm"}]}},{"text":"Ordenes de Compra","menu":{"items":[{"text":"Gestionar Ordenes de Compra","href":"/vista/purchaseOrder/entity.htm"},{"text":"Mis Compras","href":"/vista/myShopping/entity.htm"}]}},{"text":"Pagos","menu":{"items":[{"text":"Gestionar Pagos","href":"/vista/payment/entity.htm"}]}},{"text":"Tablas Lead","menu":{"items":[{"text":"Gestionar Tablas Lead","href":"/vista/leadTable/entity.htm"}]}}]
        });
        
        
    };
    
    /*mvcExt.loadView= function(idView){
        console.log(idView);
        Ext.getCmp('content-panel').layout.setActiveItem(idView);
        var record = Instance.treePanel.getStore().getNodeById(idView);
        if(typeof(record)!=='undefined'){
            Instance.treePanel.getSelectionModel().select(record);
        }
    };*/
    
    Instance.renderViewport= function(){
        Ext.create('Ext.Viewport', {
            layout: 'border',
            title: 'Toures Balon',
            items: [
            
            {
                xtype: 'box',
                id: 'header',
                region: 'north',
                html: util.getHtml("headerHtml"),
                height: 30
            },
            
            
            Instance.menuBar,
            
            
            Instance.filters,
            
            Instance.border
            ],
            renderTo: Ext.getBody()
        });
    };
    
    Instance.init();
}
</script>
        
        <script>

function EntityExtInit(){
    
    var Instance= this;
    
    Instance.init= function(){
        Ext.Loader.setConfig({enabled: true});

        Ext.Loader.setPath('Ext.ux', ExtJSLib+'/examples/ux');
        
        Ext.Ajax.timeout = 60000;

        Ext.require([
            'Ext.tip.QuickTipManager',
            'Ext.container.ButtonGroup',
            'Ext.container.Viewport',
            'Ext.layout.*',
            'Ext.form.Panel',
            'Ext.form.Label',
            'Ext.grid.*',
            'Ext.data.*',
            'Ext.menu.*',
            'Ext.tree.*',
            'Ext.selection.*',
            'Ext.tab.Panel',
            'Ext.util.History',
            'Ext.ux.layout.Center',
            'Ext.ux.GroupTabPanel',
            'Ext.window.MessageBox'
        ]);
        
        //
        // This is the main layout definition.
        //
        Ext.onReady(function(){

            Ext.tip.QuickTipManager.init();

            Ext.History.init();

            var homeExtViewport= new ProductExtViewport();

            homeExtViewport.renderViewport();

            //Debe ser siempre la ultima linea**************************
            mvcExt.setHomeRequest("/product");
            mvcExt.processFirtsRequest();
        });
    };
    
    Instance.init();
}
</script>
        
        <!-- ############################ IMPORT COMPONENTS ################################### -->
        
        <script>

function CommonExtView(parentExtController, parentExtView, model){
    
    var Instance= this;
    
    var util= new Util();
    
    
    Instance.init= function(){
        if(model!==null){
            Instance.modelNameCombobox= "ComboboxModelIn"+model;
            Instance.combobox={};
            Instance.errorGeneral= "Error de servidor";
            Instance.error403= "Usted no tiene permisos para realizar esta operaci&oacute;n";
            Ext.define(Instance.modelNameCombobox, {
                extend: 'Ext.data.Model',
                fields: [
                    'value',
                    'text'
                ]
            });
        }
    };
    
    Instance.getSimpleCombobox= function(fieldName, fieldTitle, component, dataArray){
        var data=[];
        data.push({value:"",text:"-"});
        dataArray.forEach(function(item) {
            if((item+"").indexOf(':')!==-1){
                var itemValue= item.split(':');
                data.push({value:itemValue[0],text:itemValue[1]});
            }else{
                data.push({value:item,text:item});
            }
        });
        var store = Ext.create('Ext.data.Store', {
            autoDestroy: false,
            model: Instance.modelNameCombobox,
            data: data
        });
        Instance.combobox[component+'_'+fieldName]= new Ext.form.ComboBox({
            //id: component+'Combobox'+fieldName+'In'+model,
            name: fieldName,
            editable: false,
            store: store,
            displayField: 'text',
            valueField: 'value',
            queryMode: 'local',
            listeners: {
                change: function(record){
                    if(component==='filter'){
                        if(record.getValue()!==0){
                            parentExtController.filter.eq[fieldName]= record.getValue();
                        }else{
                            delete parentExtController.filter.eq[fieldName];
                        }
                    }
                }
            }
        });
        if(component!=='grid'){
            Instance.combobox[component+'_'+fieldName].fieldLabel=fieldTitle;
        }
        
        return Instance.combobox[component+'_'+fieldName];
    };
    
    Instance.enableManagementTabHTMLEditor= function(){
        var htmlEditors = document.getElementsByClassName('x-html-editor-input');
        if(htmlEditors!==null){
            for(var i=0; i<htmlEditors.length; i++){
                var divHtmlEditor= htmlEditors[i];
                var textareaEditors = divHtmlEditor.getElementsByTagName('textarea');
                if(textareaEditors!==null){
                    textareaEditors[0].onkeydown= function(e){
                        if(e.keyCode===9 || e.which===9){
                            e.preventDefault();
                            var s = this.selectionStart;
                            this.value = this.value.substring(0,this.selectionStart) + "\t" + this.value.substring(this.selectionEnd);
                            this.selectionEnd = s+1; 
                        }
                    };
                }
            }
        }
    };
    
    Instance.defineMultiFilefield= function(){
        Ext.define('Ext.ux.form.MultiFile', {
            extend: 'Ext.form.field.File',
            alias: 'widget.multifilefield',

            initComponent: function () {
                var me = this;

                me.on('render', function () {
                    me.fileInputEl.set({ multiple: true });
                });

                me.callParent(arguments);
            },

            onFileChange: function (button, e, value) {
                this.duringFileSelect = true;

                var me = this,
                    upload = me.fileInputEl.dom,
                    files = upload.files,
                    names = [];

                if (files) {
                    for (var i = 0; i < files.length; i++)
                        names.push(files[i].name);
                    value = names.join(', ');
                }

                Ext.form.field.File.superclass.setValue.call(this, value);

                delete this.duringFileSelect;
            }
        });
    };
    
    Instance.urlRender= function(value, p, record){
        if(value){
            return "<a target='_blank' href='"+value+"'>"+value+"</a>";
        }else{
            return value;
        }
    };
    
    Instance.imageGridRender= function(value, p, record){
        if(value){
            return '<img style="max-height: 200px;" src="'+value+'" />';
        }else{
            return value;
        }
    };
    
    Instance.audioGridRender= function(value, p, record){
        if(value){
            return '<audio style="width:100%" src="'+value+'" preload="auto" controls>'+
                   '    Your browser does not support the video tag.'+
                   '</audio>';
        }else{
            return value;
        }
    };
    
    Instance.fileRender= function(value, field){
        Instance.setLinkFieldValue(field, value);
        if(value){
            return "<a target='_blank' href='"+value+"'>"+value+"</a>";
        }else{
            return value;
        }
    };
    
    Instance.pdfRender= function(value, field){
        Instance.setLinkFieldValue(field, value);
        if(value){
            return '<a id="linkFile" href="'+value+'" target="_blank">'+value+'</a>'+
                   '<iframe src="'+value+'" frameborder="0" width="100%" height="100%"></iframe>';
        }else{
            return value;
        }
    };
    
    Instance.textEditorRender= function(value, field){
        if(value){
            return '<a id="linkFile" href="'+value+'" target="_blank">'+value+'</a>'+
                   '<iframe src="/vista/webFile/ajax/plainTextEditor.htm?fileUrl='+value+'" frameborder="0" width="100%" height="100%"></iframe>';
        }else{
            return value;
        }
    };
    
    Instance.imageRender= function(value, field) {
        Instance.setLinkFieldValue(field, value);
        if(value){
            return '<a id="linkFile" href="'+value+'" target="_blank">'+value+'</a><br>'+
                   '<img style="max-width:150%" src="'+value+'">';
        }else{
            return "";
        }
    };
    
    Instance.downloadRender= function(value, field) {
        var fileName= value.split('/').pop();
        if(value){
            return '<h2>'+fileName+'</h2>'+
                   '<a href="'+value+'" target="_blank">'+
                   '<img title="Descargar" style="max-width:150%" src="/img/icon_types/download.png" />'+
                   '</a>';
        }else{
            return "";
        }
    };
    
    Instance.videoYoutubeRender= function(value, field) {
        Instance.setLinkFieldValue(field, value);
        var videoId= util.getParameter(value, "v");
        if(videoId!==""){
            return '<a id="linkFile" href="'+value+'" target="_blank">'+value+'</a>'+
                   '<iframe width="528" height="287" src="https://www.youtube.com/embed/'+videoId+'" frameborder="0" allowfullscreen></iframe>';
        }else{
            return "";
        }
    };
    
    Instance.videoFileUploadRender= function(value, field) {
        Instance.setLinkFieldValue(field, value);
        if(value){
            return '<a id="linkFile" href="'+value+'" target="_blank">'+value+'</a>'+
                   '<video style="width:528px;height:297px" controls>'+
                   '    <source src="'+value+'" type="video/'+value.split('.').pop()+'">'+
                   '    Your browser does not support the video tag.'+
                   '</video>';
        }else{
            return "";
        }
    };
    
    Instance.audioFileUploadRender= function(value, field) {
        Instance.setLinkFieldValue(field, value);
        if(value){
            return '<a id="linkFile" href="'+value+'" target="_blank">'+value+'</a>'+
                   '<audio style="width:500px" src="'+value+'" preload="auto" controls>'+
                   '    Your browser does not support the video tag.'+
                   '</audio>';
        }else{
            return "";
        }
    };
    
    Instance.googleMapsRender= function(value, field) {
        setTimeout(function(){
            try{
                googleMaps.load(field.name, value);
            }catch(e){
                console.error(e);
            }
        },1000);
        return '<div class="googleMaps">'+
               '    <input id="'+field.name+'Address" type="text" size="50" placeholder="Bogot&aacute; Colombia" />'+
               '    <input type="button" value="Buscar" onclick="googleMaps.showAddress(\''+field.name+'\')" />'+
               '    <div id="'+field.name+'Map" style="width: 100%; height: 400px"></div>'+
               '</div>';
    };
    
    Instance.setLinkFieldValue= function(field, value){
        setTimeout(function(){
            try{
                var parentForm= field.up('form');
                var linkFieldId= parentForm.itemId + "_" + field.name + "LinkField";
                Ext.getCmp(linkFieldId).setValue((value)?value:"");
            }catch(e){
                console.error(e);
            }
        },1000);
    };
    
    Instance.multiFileRender= function(value, field) {
        if(value){
            var extension= value.split('.').pop().toLowerCase();
            var htmlView= "";
            switch(extension){
                case "mp4":
                case "ogg":
                    htmlView= Instance.videoFileUploadRender(value, field);
                    break;
                case "mp3":
                    htmlView= Instance.audioFileUploadRender(value, field);
                    break;
                case "gif":
                case "jpg":
                case "jpeg":
                case "png":
                    htmlView= Instance.imageRender(value, field);
                    break;
                case "pdf":
                    htmlView= Instance.pdfRender(value, field);
                    break;
                case "html":
                case "vm":
                case "php":
                case "java":
                case "jsp":
                case "js":
                case "txt":
                case "properties":
                case "css":
                case "csv":
                case "xml":
                case "json":
                case "conf":
                    htmlView= Instance.textEditorRender(value, field);
                    break;
                default:
                    htmlView= Instance.downloadRender(value, field);
                    break;
            }
            try{
                setTimeout(function(){
                    htmlView= "<style>#linkFile{display:none}</style>"+
                              "<div style='margin:0px;text-align: center; height: 99%;'>"+
                                htmlView+
                              "</div>";
                    util.setHtml("webFileDetail-innerCt", htmlView);
                },10);
            }catch(e){
                console.log(e);
            }
            return Instance.fileRender(value, field);
        }else{
            return "";
        }
    };
    
    Instance.getLoadingContent= function(){
        var loadingDiv=
        '<div class="x-mask-msg x-layer x-mask-msg-default x-border-box" style="right: auto; z-index: 19001; top: 35%; left: 44%;">'+
        '    <div class="x-mask-msg-inner">'+
        '      <div class="x-mask-msg-text">Loading...</div>'+
        '    </div>'+
        '</div>';

        return loadingDiv;
    };
    
    Instance.processFailure= function(response){
        if(response.status===403){
            Instance.showErrorMessage(Instance.error403);
            Instance.loadUserInSession(function(userData){
                if(!userData.session){
                    location.reload(); 
                }
            });
        }else{
            Instance.showErrorMessage(Instance.errorGeneral);
        }
    };
    
    Instance.showErrorMessage= function(errorMsg){
        Ext.MessageBox.show({
            title: 'REMOTE EXCEPTION',
            msg: errorMsg,
            icon: Ext.MessageBox.ERROR,
            buttons: Ext.Msg.OK
        });
    };
    
    Instance.loadUserInSession= function(func){
        Ext.Ajax.request({
            url: Ext.context+'/account/ajax/userInSession',
            method: "GET",
            success: function(response){
                func(Ext.decode(response.responseText));
            },
            failure: function(response){
                func({"session":true});
            }
        });
    };
    
    
    Instance.init();
}
</script>
        
        <!-- ############################ IMPORT CONFIG ################################### -->
        
        <script>

function MVCExtController(){
    
    var Instance= this;
    
    var util= new Util;
    
    Instance.requestMapConfig={};
    
    Instance.init= function(){
        Instance.requestMapConfig={};
        Instance.lastRequest= "";
        Instance.request= "";
        
        Ext.History.on('change', function(request) {
            Instance.processRequest(request);
        });
    };
    
    Instance.mappingController= function(requestMapping, newController){
        if(!(requestMapping in Instance.requestMapConfig)){
            console.log("MapController: "+requestMapping);
            Instance.requestMapConfig[requestMapping]={controller:newController};
        }else{
            console.log("MVCExtController ERROR: requestMapping "+requestMapping+" duplicado!!!");
        }
    };
    
    Instance.processRequest= function(request){
        var path= util.getPath(request);
        var parameters= util.getParameters(request);
        var method= "index";
        if(path===""){
            path= Instance.homeRequest;
        }
        
        if(path.indexOf("|")!==-1){
            method=path.split("|")[1];
            path= path.split("|")[0];
            if(method===""){
                method="index";
            }
        }
        if(path in Instance.requestMapConfig){
            Instance.requestMapConfig[path].controller.request= util.removeUrlParameter(request,"tab");
            Instance.requestMapConfig[path].controller.services[method](parameters);
            Instance.loadView(path);
        }else{
            console.log("MVCExtController ERROR: Path "+path+" no encontrado!!!");
        }
    };
    
    Instance.setHomeRequest= function(homeRequest){
        Instance.homeRequest= homeRequest;
    };
    
    Instance.processFirtsRequest= function(){
        var url= document.URL;
        if(url.indexOf("#")!==-1){
            var request= url.substr(url.indexOf("#")+1, url.length);
            Instance.processRequest(request);
        }else{
            Instance.processRequest("");
        }
    };
    
    Instance.navigate= function(request){
        Instance.lastRequest= Instance.request;
        Instance.request= request;
        location.href= '#'+request;
    };
    
    Instance.redirect= function(url){
        location.href= "/vista"+url;
    };
    
    Instance.loadView= function(idView){
        //Abstract method
    };
    
    Instance.init();
}

Ext.onReady(function(){
    mvcExt= new MVCExtController();
});
</script>
        
    </head>
    <body>
        




<script type="text/javascript">
    var navegadorExtInit= new EntityExtInit();
    var userAuthentication = new UserAuthentication();
</script>
<div id="headerHtml" style="display:none;">
    <a href="/"><img src="/vista/img/habitares.png" class="logoAdmin"></a>
    <h1>Administraci&oacute;n MERCANDO</h1>
    
    
        <a class="logout" onclick="userAuthentication.logout()" href="javascript:void(0)">&nbsp;Cerrar sesi&oacute;n&nbsp;</a>
        <a class="home" href="/account/home?redirect=user">&nbsp;Inicio&nbsp;</a>
        <p class="userSession"><b>lcastrillo</b> - Luis Alberto Castrillo</p>
    
</div>

    </body>
</html>
