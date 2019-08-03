



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categorias - Administraci&oacute;n MERCANDO</title>
        <link rel="icon" type="image/icon" href="/img/favicon.png" /> 
        
            
    <script src="http://maps.google.com/maps?file=api&amp;v=3&amp;key=AIzaSyD_IP-Js3_ETbJ9psH605u-4iqZihp_-Jg&sensor=true" type="text/javascript"></script>
    
    <script src="/admin/libjs/jquery/jquery-3.1.0.min.js"></script>
    <script src="/admin/libjs/util/Util.js"></script>
    <script src="/admin/libjs/util/FileUploader.js"></script>
    <script src="/admin/libjs/util/GoogleMaps.js"></script>
    <script src="/admin/libjs/util/vkbeautify.0.99.00.beta.js"></script>
    <script src="/admin/libjs/util/CustomColorPicker.js"></script>
    <script src="/admin/account/UserAuthentication"></script>

    <link href="/admin/libcss/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/admin/libcss/navegador.css" rel="stylesheet" type="text/css">
    <link href="/admin/libcss/gridTemplateStyles.css" rel="stylesheet" type="text/css">
    <link href="/admin/libcss/Ext.ux.ColorPicker.css" rel="stylesheet" type="text/css">
    <link href="/admin/libcss/ext.global.css" rel="stylesheet" type="text/css">
        
        



    
        
            
        
        
    
    <script type="text/javascript">
        var ExtJSVersion=4;
        var ExtJSLib="http://localhost:8080/ext-4.2.1";
    </script>
    <script src="http://localhost:8080/ext-4.2.1/examples/shared/include-ext.js"></script>


    <!-- ### JMAGREXS BUILD CODE ::: 201907281503 ### -->
        
        <style>
            .x-html-editor-input textarea{white-space: pre !important;}
            .my-fieldset {width: 99% !important; min-width: 300px;}
            .x-grid-cell-name {width: 160px !important;}
        </style>
        
        <!-- ############################ IMPORT LAYOUTS ################################ -->
        
        
        <!-- ############################ IMPORT MODELS ################################### -->
        
        
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
        
        
        <!-- ############################ IMPORT STORES ################################### -->
        
        


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
                    read: "/services/rest/category/"+baseAction+"find.htm",
                    create: "/services/rest/category/"+baseAction+"create.htm",
                    update: "/services/rest/category/"+baseAction+"update.htm",
                    destroy: "/services/rest/category/"+baseAction+"delete.htm"
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
                    writeAllFields: false
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
                        try{
                            this.gridComponent.getSelectionModel().deselectAll();
                        }catch(e){
                            console.error("ERROR IN this.gridComponent.getSelectionModel().deselectAll();");
                        }
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
            url: "/services/rest/category/"+baseAction+"find.htm",
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
            url: "/services/rest/category/"+baseAction+operation+".htm",
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
            url: "/services/rest/category/"+baseAction+"load.htm",
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
            url: "/services/rest/category/"+baseAction+"diskupload/"+idEntity+".htm",
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
            url: "/services/rest/category/"+baseAction+"import/"+typeReport+".htm",
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
            url: "/services/rest/"+mainProcessRef+"/do/"+processName+".htm",
            method: "POST",
            headers: {
                'Content-Type' : 'application/json'
            },
            jsonData: util.remakeJSONObject(data),
            success: function(response){
                Ext.MessageBox.hide();
                func(response.responseText);
            },
            failure: function(response){
                commonExtView.processFailure(response);
            }
        });
    };
    
    Instance.deleteById= function(idEntity, func){
        Ext.MessageBox.show({
            msg: 'Eliminando...',
            width:200,
            wait:true,
            waitConfig: {interval:200}
        });
        Ext.Ajax.request({
            url: "/services/rest/category/"+baseAction+"delete.htm",
            method: "GET",
            params: 'idEntity='+idEntity,
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
    
    Instance.deleteByFilter= function(filter, func){
        Ext.MessageBox.show({
            msg: 'Eliminando...',
            width:200,
            wait:true,
            waitConfig: {interval:200}
        });
        Ext.Ajax.request({
            url: "/services/rest/category/"+baseAction+"delete/byfilter.htm",
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
                    read: "/services/rest/subCategory/"+baseAction+"find.htm",
                    create: "/services/rest/subCategory/"+baseAction+"create.htm",
                    update: "/services/rest/subCategory/"+baseAction+"update.htm",
                    destroy: "/services/rest/subCategory/"+baseAction+"delete.htm"
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
                    writeAllFields: false
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
                        try{
                            this.gridComponent.getSelectionModel().deselectAll();
                        }catch(e){
                            console.error("ERROR IN this.gridComponent.getSelectionModel().deselectAll();");
                        }
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
            url: "/services/rest/subCategory/"+baseAction+"find.htm",
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
            url: "/services/rest/subCategory/"+baseAction+operation+".htm",
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
            url: "/services/rest/subCategory/"+baseAction+"load.htm",
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
            url: "/services/rest/subCategory/"+baseAction+"diskupload/"+idEntity+".htm",
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
            url: "/services/rest/subCategory/"+baseAction+"import/"+typeReport+".htm",
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
            url: "/services/rest/"+mainProcessRef+"/do/"+processName+".htm",
            method: "POST",
            headers: {
                'Content-Type' : 'application/json'
            },
            jsonData: util.remakeJSONObject(data),
            success: function(response){
                Ext.MessageBox.hide();
                func(response.responseText);
            },
            failure: function(response){
                commonExtView.processFailure(response);
            }
        });
    };
    
    Instance.deleteById= function(idEntity, func){
        Ext.MessageBox.show({
            msg: 'Eliminando...',
            width:200,
            wait:true,
            waitConfig: {interval:200}
        });
        Ext.Ajax.request({
            url: "/services/rest/subCategory/"+baseAction+"delete.htm",
            method: "GET",
            params: 'idEntity='+idEntity,
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
    
    Instance.deleteByFilter= function(filter, func){
        Ext.MessageBox.show({
            msg: 'Eliminando...',
            width:200,
            wait:true,
            waitConfig: {interval:200}
        });
        Ext.Ajax.request({
            url: "/services/rest/subCategory/"+baseAction+"delete/byfilter.htm",
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

function CategoryExtView(parentExtController, parentExtView){
    
    var Instance= this;
    
    Instance.id= "/category";
    
    Instance.modelName="CategoryModel";
    
    var util= new Util();
    
    // MODELS **********************************************
    
    Instance.entityExtModel= new CategoryExtModel();
    
    // STORES **********************************************
    
    Instance.entityExtStore= new CategoryExtStore();
    
    // COMPONENTS *******************************************
    
    Instance.commonExtView= new CommonExtView(parentExtController, Instance, 'Category');
    
    //*******************************************************
    
    
    Instance.init= function(){
        Instance.typeView= "Parent";
        Instance.pluralEntityTitle= 'Categorias';
        Instance.singularEntityTitle= 'Categoria';
        Instance.entityExtModel.defineModel(Instance.modelName);
        Instance.store= Instance.entityExtStore.getStore(Instance.modelName);
        Instance.massiveUpdateExecuteInProgress= false;
        
        Instance.createMainView();
    };
    
    Instance.setFilterStore= function(filter){
        
            Instance.store.getProxy().extraParams.filter= filter;
        
        
    };
    
    Instance.reloadPageStore= function(page){
        
            Instance.store.loadPage(page);
        
        
    };
    
    
    
    
    function getFormContainer(childExtControllers){
        var formFields= [{"allowBlank":true,"xtype":"numberfield","fieldLabel":"Id","name":"id","readOnly":true,"id":"Category_id"},{"allowBlank":false,"fieldLabel":"Nombre","name":"name","id":"Category_name"},{"renderer":Instance.commonExtView.imageRender,"xtype":"displayfield","fieldLabel":"Imagen","name":"image","id":"Category_imageRenderer"},{"allowBlank":true,"fieldLabel":"Link Imagen","name":"image","readOnly":false,"id":"Category_imageLink"},{"allowBlank":true,"xtype":"filefield","emptyText":"Seleccione una imagen","fieldLabel":"Subir Imagen","name":"image_File","id":"Category_image"},{"allowBlank":true,"xtype":"textarea","fieldLabel":"Descripci&oacute;n","name":"description","id":"Category_description","height":200}];

        var additionalButtons= [{"handler":function(){parentExtController.viewInternalPage('/admin/vista/product/entity.htm')},"scope":this,"scale":"medium","text":"Ver productos"}];

        Instance.defineWriterForm(formFields, additionalButtons);
        
        var itemsForm= [{
            itemId: 'formCategory',
            xtype: 'writerformCategory',
            
            border: false,
            width: '100%',
            listeners: {
                render: function(panel) {
                    Instance.commonExtView.enableManagementTabHTMLEditor();
                }
            }
        }];
        
        if(Instance.typeView==="Parent"){
            itemsForm.push(getChildsExtViewTabs(childExtControllers));
        }
        
        return Ext.create('Ext.container.Container', {
            id: 'formContainerCategory',
            title: 'Formulario',
            type: 'fit',
            align: 'stretch',
            items: itemsForm
        });
    };
    
    function getChildsExtViewTabs(childExtControllers){
        var items=[];
        var jsonTypeChildExtViews= {"subCategory":"tcv_1_to_n"};
        childExtControllers.forEach(function(childExtController) {
            var itemTab= null;
            if(jsonTypeChildExtViews[childExtController.entityRef]==="tcv_1_to_n"){
                itemTab= {
                    id: childExtController.entityRef+'SubEntity',
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
                itemTab= Ext.widget('tabpanel',{
                    xtype:'tabpanel',
                    title: childExtController.entityExtView.singularEntityTitle,
                    plain:true,
                    activeTab: 0,
                    style: 'background-color:#dfe8f6; padding:5px;',
                    defaults: {bodyStyle: 'padding:0px', autoScroll:true},
                    items:[
                        childExtController.entityExtView.formContainer
                    ]
                });
                var buttonCreate = childExtController.entityExtView.formComponent.down("#create"+childExtController.entityName);
                buttonCreate.setVisible(false);
                itemTab.getTabBar().hide();
            }else if(jsonTypeChildExtViews[childExtController.entityRef]==="tcv_n_to_n"){
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
    
    Instance.defineWriterForm= function(fields, additionalButtons){
        Ext.define('WriterFormCategory', {
            extend: 'Ext.form.Panel',
            alias: 'widget.writerformCategory',

            requires: ['Ext.form.field.Text'],

            initComponent: function(){
                //this.addEvents('create');
                
                var buttons= [];
                buttons= [
                
                {
                    itemId: 'saveCategory',
                    iconCls: 'icon-save',
                    text: 'Actualizar',
                    disabled: true,
                    scope: this,
                    handler: this.onUpdate
                },
                
                {
                    itemId: 'createCategory',
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
                    if(this.down('#saveCategory')!==null){
                        this.down('#saveCategory').enable();
                    }
                    this.getForm().loadRecord(this.activeRecord);
                } else {
                    if(this.down('#saveCategory')!==null){
                        this.down('#saveCategory').disable();
                    }
                    this.getForm().reset();
                }
            },
                    
            getActiveRecord: function(){
                return this.activeRecord;
            },
            
            onUpdate: function(){
                var active = this.activeRecord,
                    form = this.getForm();
            
                if (!active) {
                    return;
                }
                if (form.isValid()) {
                    parentExtController.saveFormData('update', form.getValues());
                    //form.updateRecord(active);
                    //this.onReset();
                }
            },

            onCreate: function(){
                var form = this.getForm();

                if (form.isValid()) {
                    parentExtController.saveFormData('create', form.getValues());
                    //form.reset();
                }

            },

            onReset: function(){
                parentExtController.loadFormData("");
            },
                    
            onSeeAll: function(){
                if(ExtJSVersion===4){
                    this.doLayout();
                }else{
                    this.updateLayout();
                }
            }
    
        });
        
    };
    
    
    
    
    function getGridContainer(){
        var idGrid= 'gridCategory';
        var gridColumns= [{"renderer":Instance.commonExtView.numbererGridRender,"xtype":"rownumberer","width":40,"sortable":false},{"dataIndex":"id","width":100,"header":"Id","sortable":true},{"renderer":nameEntityRender,"field":{"allowBlank":false,"type":"textfield"},"dataIndex":"name","width":200,"header":"Nombre","sortable":true},{"renderer":Instance.commonExtView.imageGridRender,"field":{"type":"textfield"},"dataIndex":"image","width":300,"header":"Imagen","sortable":true},{"field":{"type":"textfield"},"dataIndex":"description","width":200,"header":"Descripci&oacute;n","sortable":true}];
        
        Instance.emptyModel= {"image":"","name":"","description":""};
        Instance.getEmptyRec= function(){
            return new CategoryModel(Instance.emptyModel);
        };
        
        var store= Instance.store;
        

        Instance.defineWriterGrid('Categorias', gridColumns);
        
        return Ext.create('Ext.container.Container', {
            id: 'gridContainerCategory',
            title: 'Listado',
            
            layout: {
                type: 'vbox',
                align: 'stretch'
            },
            items: [{
                itemId: idGrid,
                xtype: 'writergridCategory',
                style: 'border: 0px',
                flex: 1,
                store: store,
                disableSelection: false,
                trackMouseOver: !false,
                listeners: {
                    selectionchange: function(selModel, selected) {
                        if(selected[0] && parentExtController.typeController==="Child"){
                            parentExtController.setFormData(selected[0]);
                        }
                    },
                    export: function(typeReport){
                        var filterData= JSON.stringify(parentExtController.filter);
                        filterData= filterData.replaceAll("{","(").replaceAll("}",")");
                        filterData= filterData.replaceAll("\\[","<").replaceAll("\\]",">");
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
                            case "csv":
                                var urlFind= store.proxy.api.read.replace("find.htm","find/csv.htm");
                                window.open(urlFind+data,'_blank');
                                break;
                            case "xls":
                                var urlFind= store.proxy.api.read.replace("find.htm","find/xlsx.htm");
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
            return new CategoryModel(Instance.emptyModel);
        };
    };
    
    Instance.createEmptyRecUpdater= function(){
        if(Instance.emptyModelUpdater===undefined){
            Instance.emptyModelUpdater= {"image":"","name":"","description":""};
            for (var property in Instance.emptyModelUpdater) {
                Instance.emptyModelUpdater[property]="-";
            }
            Instance.emptyModelUpdater["id"]= "-1";
            Instance.getEmptyRecUpdater= function(){
                return new CategoryModel(Instance.emptyModelUpdater);
            };
        }
    };
    
    function getComboboxLimit(store){
        var combobox= Instance.commonExtView.getSimpleCombobox('limit', 'L&iacute;mite', 'categoryconfig', [50, 100, 200, 500], true);
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
        var combobox= Instance.commonExtView.getSimpleCombobox('sort', 'Ordenar por', 'categoryconfig', ["id:Id","name:Nombre","image:Imagen","description:Descripci&oacute;n"], true);
        combobox.addListener('change',function(record){
            if(record.getValue()!=="" && store.getOrderProperty()!==record.getValue()){
                var dir= store.getOrderDir();
                store.sortBy(record.getValue(), dir);
                Instance.reloadPageStore(1);
            }
        }, this);
        combobox.setValue("id");
        
        return combobox;
    }
    
    function getComboboxOrderDir(store){
        var combobox= Instance.commonExtView.getSimpleCombobox('dir', 'Direcci&oacute;n', 'categoryconfig', ["ASC", "DESC"], true);
        combobox.addListener('change',function(record){
            if(record.getValue()!=="" && store.getOrderDir()!==record.getValue()){
                var prop= store.getOrderProperty();
                store.sortBy(prop, record.getValue());
                Instance.reloadPageStore(1);
            }
        }, this);
        combobox.setValue("DESC");
        
        return combobox;
    }
    
    Instance.defineWriterGrid= function(modelText, columns){
        Ext.define('WriterGridCategory', {
            extend: 'Ext.grid.Panel',
            alias: 'widget.writergridCategory',

            requires: [
                'Ext.grid.plugin.CellEditing',
                'Ext.selection.CheckboxModel',
                'Ext.form.field.Text',
                'Ext.toolbar.TextItem'
            ],

            initComponent: function(){
                
                Instance.cellEditing = Ext.create('Ext.grid.plugin.CellEditing');
                
                Ext.apply(this, {
                    //iconCls: 'icon-grid',
                    hideHeaders:false,
                    frame: false,
                    selType: 'checkboxmodel',
                    plugins: [Instance.cellEditing],
                    dockedItems: [{
                        weight: 2,
                        xtype: 'toolbar',
                        margin  : '5 0 5 0',
                        dock: 'top',
                        items: [{
                            xtype: 'tbtext',
                            text: '<b>@lacv</b>'
                        }, '|',
                        
                        {
                            xtype: 'splitbutton',
                            text: 'Nuevo',
                            handler: this.onNewClick,
                            menu: [{
                                text: 'Agregar',
                                scope: this,
                                handler: this.onAddClick
                            }]
                        },
                        
                        
                        {
                            itemId: 'massiveUpdateButton',
                            iconCls: 'icon-save',
                            xtype: 'splitbutton',
                            text: 'Actualizaci&oacute;n masiva',
                            scope: this,
                            handler: this.onMassiveUpdate,
                            menu: [{
                                text: 'Ejecutar',
                                scope: this,
                                handler: this.onMassiveUpdateExecute
                            },{
                                text: 'Cancelar',
                                scope: this,
                                handler: this.onMassiveUpdateCancel
                            }]
                        },
                        
                        
                        
                        {
                            //iconCls: 'icon-delete',
                            text: 'Eliminar',
                            
                            disabled: true,
                            
                            itemId: 'delete',
                            scope: this,
                            handler: this.onDeleteClick
                        },
                        
                        
                        getComboboxLimit(this.store),
                        {
                            text: 'Ordenar',
                            //iconCls: 'add16',
                            menu: [
                                getComboboxOrderBy(this.store),
                                getComboboxOrderDir(this.store)]
                        }
                        
                        ,{
                            text: 'Exportar',
                            //iconCls: 'add16',
                            menu: [
                                {text: 'A CSV', handler: function(){this.exportTo('csv');}, scope: this},
                                {text: 'A Excel', handler: function(){this.exportTo('xls');}, scope: this},
                                {text: 'A JSON', handler: function(){this.exportTo('json');}, scope: this},
                                {text: 'A XML', handler: function(){this.exportTo('xml');}, scope: this}]
                        },{
                            itemId: 'importMenu',
                            text: 'Importar',
                            //iconCls: 'add16',
                            menu: [
                                {text: 'De CSV', handler: function(){this.importFrom('csv');}, scope: this},
                                {text: 'De Excel', handler: function(){this.importFrom('xls');}, scope: this},
                                {text: 'De JSON', handler: function(){this.importFrom('json');}, scope: this},
                                {text: 'De XML', handler: function(){this.importFrom('xml');}, scope: this}]
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
                parentExtController.deleteRecords();
            },
            
            onNewClick: function(){
                parentExtController.idEntitySelected= null;
                if(Instance.typeView==="Parent"){
                    mvcExt.navigate("?tab=1&id=");
                }else{
                    Ext.getCmp("categoryTabsContainer").clickInTab("Formulario");
                    parentExtController.loadFormData("");
                }
            },

            onAddClick: function(){
                if(parentExtController.typeController==="Child" && parentExtController.parentEntityId===null){
                    Ext.MessageBox.alert('Operaci&oacute;n cancelada', "No se ha seleccionado "+parentExtController.parentEntityTitle+" padre!!!");
                }else{
                    this.store.proxy.writer.writeAllFields= true;
                    var edit = Instance.cellEditing;
                    var rec = Instance.getEmptyRec();
                    edit.cancelEdit();
                    this.store.insert(0, rec);
                    edit.startEditByPosition({row:0, column:0});
                }
            },
                
            onMassiveUpdate: function(){
                if(parentExtController.typeController==="Child" && parentExtController.parentEntityId===null){
                    Ext.MessageBox.alert('Operaci&oacute;n cancelada', "No se ha seleccionado "+parentExtController.parentEntityTitle+" padre!!!");
                }else{
                    if(!Instance.massiveUpdateExecuteInProgress){
                        Instance.massiveUpdateExecuteInProgress= true;
                        Instance.gridComponent.store.autoSync= false;
                        Instance.gridComponent.down('#massiveUpdateButton').setIconCls('icon-red');
                        var apiUpdate= Instance.gridComponent.store.proxy.api.update;
                        Instance.gridComponent.store.proxy.api.update= apiUpdate.replaceAll("update.htm","update/byfilter.htm");
                        console.log(Instance.gridComponent.store.proxy.api.update);
                    }
                    if(this.store.getAt(0)!==undefined && this.store.getAt(0).get("id")!==-1 && this.store.getAt(0).get("id")!=="-1"){
                        //Agregar registro en editor
                        Instance.createEmptyRecUpdater();
                        var edit= Instance.cellEditing;
                        edit.cancelEdit();
                        var rec = Instance.getEmptyRecUpdater();
                        this.store.insert(0, rec);
                        edit.startEdit();
                    }
                }
            },
            
            onMassiveUpdateExecute: function(){
                if(Instance.massiveUpdateExecuteInProgress){
                    Ext.MessageBox.confirm('Confirmar', 'Esta seguro que desea actualizar '+this.store.getTotalCount()+' registros?', function(result){
                        if(result==="yes"){
                            Instance.gridComponent.store.sync({
                                success: function(){
                                    Instance.reloadPageStore(1);
                                    console.log("success!!");
                                },
                                scope: this
                            });
                            Instance.gridComponent.down('#massiveUpdateButton').setIconCls('icon-save');
                            Instance.massiveUpdateExecuteInProgress= false;
                            Instance.gridComponent.store.autoSync= true;
                            var apiUpdateByFilter= Instance.gridComponent.store.proxy.api.update;
                            Instance.gridComponent.store.proxy.api.update= apiUpdateByFilter.replaceAll("update/byfilter.htm","update.htm");
                        }
                    });
                }else{
                    Ext.MessageBox.alert('Operaci&oacute;n cancelada', "No hay Actualizaci&oacute;n masiva en progreso!!!");
                }
            },
            
            onMassiveUpdateCancel: function(){
                var apiUpdate= Instance.gridComponent.store.proxy.api.update;
                if(Instance.massiveUpdateExecuteInProgress || apiUpdate.indexOf("update/byfilter.htm")!==-1){
                    Instance.gridComponent.down('#massiveUpdateButton').setIconCls('icon-save');
                    Instance.massiveUpdateExecuteInProgress= false;
                    Instance.gridComponent.store.autoSync= true;
                    Instance.gridComponent.store.proxy.api.update= apiUpdate.replaceAll("update/byfilter.htm","update.htm");
                    Instance.reloadPageStore(1);
                }else{
                    Ext.MessageBox.alert('Operaci&oacute;n cancelada', "No hay Actualizaci&oacute;n masiva en progreso!!!");
                }
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
                        Ext.MessageBox.alert('Status', responseText.message);
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
            
        };
        var pg= Ext.create('Ext.grid.property.Grid', {
            id: 'propertyGridCategory',
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
    
    Instance.showGlobalProcessForm= function(processName, idsField){
        var initData={};
        var ids= "";
        var selection = Instance.gridComponent.getSelectionModel().getSelection();
        if (selection.length>0) {
            for(var i=0; i<selection.length; i++){
                ids+=selection[i].data.id;
                if(i<selection.length-1){
                    ids+=",";
                }
            }
        }else{
            var check_items= document.getElementsByClassName("item_check");
            for(var i=0; i<check_items.length; i++){
                if(check_items[i].checked){
                    ids+=check_items[i].value;
                    if(i<selection.length-1){
                        ids+=",";
                    }
                }
            }
        }
        initData[idsField]= ids;
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
                return "<a style='font-size: 15px;' href='javascript:Ext.getCmp(\"categoryTabsContainer\").clickInTab(\"Formulario\")'>"+value+"</a>";
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
        
        
        Instance.entityDependency= {};
        
        
        Instance.childExtControllers= [];
        
        if(Instance.typeView==="Parent"){
        
            
            var subCategoryExtController= new SubCategoryExtController(parentExtController, Instance);
            subCategoryExtController.parentEntityTitle= "Categoria";
            subCategoryExtController.entityExtView.hideParentField("category");
            Instance.childExtControllers.push(subCategoryExtController);
        
        }
        
        Instance.formComponent= null;
        
        Instance.formContainer = getFormContainer(Instance.childExtControllers);
        Instance.formComponent= Instance.formContainer.child('#formCategory');
        Instance.store.formComponent= Instance.formComponent;
        
        
        Instance.gridComponent = null;
        
        Instance.gridContainer = getGridContainer();
        Instance.gridComponent = Instance.gridContainer.child('#gridCategory');
        Instance.store.gridComponent= Instance.gridComponent;
        createFormImport();
        
            
        
        
        Instance.processForms={};
        
        
        Instance.propertyGrid= getPropertyGrid();

        Instance.tabsContainer= Ext.widget('tabpanel', {
            id: "categoryTabsContainer",
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
                        url= util.removeUrlParameter(url,"id");
                    }
                    if(url!==""){
                        mvcExt.navigate(url);
                    }
                }
            },
            clickInTab: function(labelTab){
                $("#categorySubEntity").find("span.x-tab-inner").each(function() {
                    if(this.innerText===labelTab){
                        util.eventFire(document.getElementById(this.id), "click");
                    }
                });
            }
        });
        
        
        Instance.mainView= {
            id: Instance.id,
            
            title: 'Gestionar Categorias',
            
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

function SubCategoryExtView(parentExtController, parentExtView){
    
    var Instance= this;
    
    Instance.id= "/subCategory";
    
    Instance.modelName="SubCategoryModel";
    
    var util= new Util();
    
    // MODELS **********************************************
    
    Instance.entityExtModel= new SubCategoryExtModel();
    
    // STORES **********************************************
    
    Instance.entityExtStore= new SubCategoryExtStore();
    
    // COMPONENTS *******************************************
    
    Instance.commonExtView= new CommonExtView(parentExtController, Instance, 'SubCategory');
    
    //*******************************************************
    
    
    Instance.init= function(){
        Instance.typeView= "Child";
        Instance.pluralEntityTitle= 'Sub Categorias';
        Instance.singularEntityTitle= 'Sub Categoria';
        Instance.entityExtModel.defineModel(Instance.modelName);
        Instance.store= Instance.entityExtStore.getStore(Instance.modelName);
        Instance.massiveUpdateExecuteInProgress= false;
        
        Instance.createMainView();
    };
    
    Instance.setFilterStore= function(filter){
        
            Instance.store.getProxy().extraParams.filter= filter;
        
        
    };
    
    Instance.reloadPageStore= function(page){
        
            Instance.store.loadPage(page);
        
        
    };
    
    
    
    
    function getFormContainer(childExtControllers){
        var formFields= [{"allowBlank":true,"xtype":"numberfield","fieldLabel":"Id","name":"id","readOnly":true,"id":"SubCategory_id"},{"allowBlank":false,"fieldLabel":"Nombre","name":"name","id":"SubCategory_name"},{"allowBlank":true,"xtype":"textarea","fieldLabel":"Descripci&oacute;n","name":"description","id":"SubCategory_description","height":200},{"renderer":Instance.commonExtView.imageRender,"xtype":"displayfield","fieldLabel":"Imagen","name":"image","id":"SubCategory_imageRenderer"},{"allowBlank":true,"fieldLabel":"Link Imagen","name":"image","readOnly":false,"id":"SubCategory_imageLink"},{"allowBlank":true,"xtype":"filefield","emptyText":"Seleccione una imagen","fieldLabel":"Subir Imagen","name":"image_File","id":"SubCategory_image"},(function(){ return Instance.formComboboxCategory;})()];

        var additionalButtons= [];

        Instance.defineWriterForm(formFields, additionalButtons);
        
        var itemsForm= [{
            itemId: 'formSubCategory',
            xtype: 'writerformSubCategory',
            
            border: false,
            width: '100%',
            listeners: {
                render: function(panel) {
                    Instance.commonExtView.enableManagementTabHTMLEditor();
                }
            }
        }];
        
        if(Instance.typeView==="Parent"){
            itemsForm.push(getChildsExtViewTabs(childExtControllers));
        }
        
        return Ext.create('Ext.container.Container', {
            id: 'formContainerSubCategory',
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
            if(jsonTypeChildExtViews[childExtController.entityRef]==="tcv_1_to_n"){
                itemTab= {
                    id: childExtController.entityRef+'SubEntity',
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
                itemTab= Ext.widget('tabpanel',{
                    xtype:'tabpanel',
                    title: childExtController.entityExtView.singularEntityTitle,
                    plain:true,
                    activeTab: 0,
                    style: 'background-color:#dfe8f6; padding:5px;',
                    defaults: {bodyStyle: 'padding:0px', autoScroll:true},
                    items:[
                        childExtController.entityExtView.formContainer
                    ]
                });
                var buttonCreate = childExtController.entityExtView.formComponent.down("#create"+childExtController.entityName);
                buttonCreate.setVisible(false);
                itemTab.getTabBar().hide();
            }else if(jsonTypeChildExtViews[childExtController.entityRef]==="tcv_n_to_n"){
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
    
    Instance.defineWriterForm= function(fields, additionalButtons){
        Ext.define('WriterFormSubCategory', {
            extend: 'Ext.form.Panel',
            alias: 'widget.writerformSubCategory',

            requires: ['Ext.form.field.Text'],

            initComponent: function(){
                //this.addEvents('create');
                
                var buttons= [];
                buttons= [
                
                {
                    itemId: 'saveSubCategory',
                    iconCls: 'icon-save',
                    text: 'Actualizar',
                    disabled: true,
                    scope: this,
                    handler: this.onUpdate
                },
                
                {
                    itemId: 'createSubCategory',
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
                    if(this.down('#saveSubCategory')!==null){
                        this.down('#saveSubCategory').enable();
                    }
                    this.getForm().loadRecord(this.activeRecord);
                } else {
                    if(this.down('#saveSubCategory')!==null){
                        this.down('#saveSubCategory').disable();
                    }
                    this.getForm().reset();
                }
            },
                    
            getActiveRecord: function(){
                return this.activeRecord;
            },
            
            onUpdate: function(){
                var active = this.activeRecord,
                    form = this.getForm();
            
                if (!active) {
                    return;
                }
                if (form.isValid()) {
                    parentExtController.saveFormData('update', form.getValues());
                    //form.updateRecord(active);
                    //this.onReset();
                }
            },

            onCreate: function(){
                var form = this.getForm();

                if (form.isValid()) {
                    parentExtController.saveFormData('create', form.getValues());
                    //form.reset();
                }

            },

            onReset: function(){
                parentExtController.loadFormData("");
            },
                    
            onSeeAll: function(){
                if(ExtJSVersion===4){
                    this.doLayout();
                }else{
                    this.updateLayout();
                }
            }
    
        });
        
    };
    
    
    
    
    function getGridContainer(){
        var idGrid= 'gridSubCategory';
        var gridColumns= [{"renderer":Instance.commonExtView.numbererGridRender,"xtype":"rownumberer","width":40,"sortable":false},{"dataIndex":"id","width":100,"header":"Id","sortable":true},{"renderer":nameEntityRender,"field":{"allowBlank":false,"type":"textfield"},"dataIndex":"name","width":200,"header":"Nombre","sortable":true},{"field":{"type":"textfield"},"dataIndex":"description","width":200,"header":"Descripci&oacute;n","sortable":true},{"renderer":Instance.commonExtView.imageGridRender,"field":{"type":"textfield"},"dataIndex":"image","width":300,"header":"Imagen","sortable":true},{"editor":(function(){ return Instance.gridComboboxCategory;})(),"renderer":Instance.comboboxCategoryRender,"dataIndex":"category","width":200,"header":"Category","sortable":true}];
        
        Instance.emptyModel= {"image":"","name":"","description":"","category":""};
        Instance.getEmptyRec= function(){
            return new SubCategoryModel(Instance.emptyModel);
        };
        
        var store= Instance.store;
        

        Instance.defineWriterGrid('Sub Categorias', gridColumns);
        
        return Ext.create('Ext.container.Container', {
            id: 'gridContainerSubCategory',
            title: 'Listado',
            
            layout: {
                type: 'vbox',
                align: 'stretch'
            },
            items: [{
                itemId: idGrid,
                xtype: 'writergridSubCategory',
                style: 'border: 0px',
                flex: 1,
                store: store,
                disableSelection: false,
                trackMouseOver: !false,
                listeners: {
                    selectionchange: function(selModel, selected) {
                        if(selected[0] && parentExtController.typeController==="Child"){
                            parentExtController.setFormData(selected[0]);
                        }
                    },
                    export: function(typeReport){
                        var filterData= JSON.stringify(parentExtController.filter);
                        filterData= filterData.replaceAll("{","(").replaceAll("}",")");
                        filterData= filterData.replaceAll("\\[","<").replaceAll("\\]",">");
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
                            case "csv":
                                var urlFind= store.proxy.api.read.replace("find.htm","find/csv.htm");
                                window.open(urlFind+data,'_blank');
                                break;
                            case "xls":
                                var urlFind= store.proxy.api.read.replace("find.htm","find/xlsx.htm");
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
            return new SubCategoryModel(Instance.emptyModel);
        };
    };
    
    Instance.createEmptyRecUpdater= function(){
        if(Instance.emptyModelUpdater===undefined){
            Instance.emptyModelUpdater= {"image":"","name":"","description":"","category":""};
            for (var property in Instance.emptyModelUpdater) {
                Instance.emptyModelUpdater[property]="-";
            }
            Instance.emptyModelUpdater["id"]= "-1";
            Instance.getEmptyRecUpdater= function(){
                return new SubCategoryModel(Instance.emptyModelUpdater);
            };
        }
    };
    
    function getComboboxLimit(store){
        var combobox= Instance.commonExtView.getSimpleCombobox('limit', 'L&iacute;mite', 'subCategoryconfig', [50, 100, 200, 500], true);
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
        var combobox= Instance.commonExtView.getSimpleCombobox('sort', 'Ordenar por', 'subCategoryconfig', ["id:Id","name:Nombre","description:Descripci&oacute;n","image:Imagen","category:Category"], true);
        combobox.addListener('change',function(record){
            if(record.getValue()!=="" && store.getOrderProperty()!==record.getValue()){
                var dir= store.getOrderDir();
                store.sortBy(record.getValue(), dir);
                Instance.reloadPageStore(1);
            }
        }, this);
        combobox.setValue("id");
        
        return combobox;
    }
    
    function getComboboxOrderDir(store){
        var combobox= Instance.commonExtView.getSimpleCombobox('dir', 'Direcci&oacute;n', 'subCategoryconfig', ["ASC", "DESC"], true);
        combobox.addListener('change',function(record){
            if(record.getValue()!=="" && store.getOrderDir()!==record.getValue()){
                var prop= store.getOrderProperty();
                store.sortBy(prop, record.getValue());
                Instance.reloadPageStore(1);
            }
        }, this);
        combobox.setValue("DESC");
        
        return combobox;
    }
    
    Instance.defineWriterGrid= function(modelText, columns){
        Ext.define('WriterGridSubCategory', {
            extend: 'Ext.grid.Panel',
            alias: 'widget.writergridSubCategory',

            requires: [
                'Ext.grid.plugin.CellEditing',
                'Ext.selection.CheckboxModel',
                'Ext.form.field.Text',
                'Ext.toolbar.TextItem'
            ],

            initComponent: function(){
                
                Instance.cellEditing = Ext.create('Ext.grid.plugin.CellEditing');
                
                Ext.apply(this, {
                    //iconCls: 'icon-grid',
                    hideHeaders:false,
                    frame: false,
                    selType: 'checkboxmodel',
                    plugins: [Instance.cellEditing],
                    dockedItems: [{
                        weight: 2,
                        xtype: 'toolbar',
                        margin  : '5 0 5 0',
                        dock: 'top',
                        items: [{
                            xtype: 'tbtext',
                            text: '<b>@lacv</b>'
                        }, '|',
                        
                        {
                            xtype: 'splitbutton',
                            text: 'Nuevo',
                            handler: this.onNewClick,
                            menu: [{
                                text: 'Agregar',
                                scope: this,
                                handler: this.onAddClick
                            }]
                        },
                        
                        
                        {
                            itemId: 'massiveUpdateButton',
                            iconCls: 'icon-save',
                            xtype: 'splitbutton',
                            text: 'Actualizaci&oacute;n masiva',
                            scope: this,
                            handler: this.onMassiveUpdate,
                            menu: [{
                                text: 'Ejecutar',
                                scope: this,
                                handler: this.onMassiveUpdateExecute
                            },{
                                text: 'Cancelar',
                                scope: this,
                                handler: this.onMassiveUpdateCancel
                            }]
                        },
                        
                        
                        
                        {
                            //iconCls: 'icon-delete',
                            text: 'Eliminar',
                            
                            disabled: true,
                            
                            itemId: 'delete',
                            scope: this,
                            handler: this.onDeleteClick
                        },
                        
                        
                        getComboboxLimit(this.store),
                        {
                            text: 'Ordenar',
                            //iconCls: 'add16',
                            menu: [
                                getComboboxOrderBy(this.store),
                                getComboboxOrderDir(this.store)]
                        }
                        
                        ,{
                            text: 'Exportar',
                            //iconCls: 'add16',
                            menu: [
                                {text: 'A CSV', handler: function(){this.exportTo('csv');}, scope: this},
                                {text: 'A Excel', handler: function(){this.exportTo('xls');}, scope: this},
                                {text: 'A JSON', handler: function(){this.exportTo('json');}, scope: this},
                                {text: 'A XML', handler: function(){this.exportTo('xml');}, scope: this}]
                        },{
                            itemId: 'importMenu',
                            text: 'Importar',
                            //iconCls: 'add16',
                            menu: [
                                {text: 'De CSV', handler: function(){this.importFrom('csv');}, scope: this},
                                {text: 'De Excel', handler: function(){this.importFrom('xls');}, scope: this},
                                {text: 'De JSON', handler: function(){this.importFrom('json');}, scope: this},
                                {text: 'De XML', handler: function(){this.importFrom('xml');}, scope: this}]
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
                parentExtController.deleteRecords();
            },
            
            onNewClick: function(){
                parentExtController.idEntitySelected= null;
                if(Instance.typeView==="Parent"){
                    mvcExt.navigate("?tab=1&id=");
                }else{
                    Ext.getCmp("subCategoryTabsContainer").clickInTab("Formulario");
                    parentExtController.loadFormData("");
                }
            },

            onAddClick: function(){
                if(parentExtController.typeController==="Child" && parentExtController.parentEntityId===null){
                    Ext.MessageBox.alert('Operaci&oacute;n cancelada', "No se ha seleccionado "+parentExtController.parentEntityTitle+" padre!!!");
                }else{
                    this.store.proxy.writer.writeAllFields= true;
                    var edit = Instance.cellEditing;
                    var rec = Instance.getEmptyRec();
                    edit.cancelEdit();
                    this.store.insert(0, rec);
                    edit.startEditByPosition({row:0, column:0});
                }
            },
                
            onMassiveUpdate: function(){
                if(parentExtController.typeController==="Child" && parentExtController.parentEntityId===null){
                    Ext.MessageBox.alert('Operaci&oacute;n cancelada', "No se ha seleccionado "+parentExtController.parentEntityTitle+" padre!!!");
                }else{
                    if(!Instance.massiveUpdateExecuteInProgress){
                        Instance.massiveUpdateExecuteInProgress= true;
                        Instance.gridComponent.store.autoSync= false;
                        Instance.gridComponent.down('#massiveUpdateButton').setIconCls('icon-red');
                        var apiUpdate= Instance.gridComponent.store.proxy.api.update;
                        Instance.gridComponent.store.proxy.api.update= apiUpdate.replaceAll("update.htm","update/byfilter.htm");
                        console.log(Instance.gridComponent.store.proxy.api.update);
                    }
                    if(this.store.getAt(0)!==undefined && this.store.getAt(0).get("id")!==-1 && this.store.getAt(0).get("id")!=="-1"){
                        //Agregar registro en editor
                        Instance.createEmptyRecUpdater();
                        var edit= Instance.cellEditing;
                        edit.cancelEdit();
                        var rec = Instance.getEmptyRecUpdater();
                        this.store.insert(0, rec);
                        edit.startEdit();
                    }
                }
            },
            
            onMassiveUpdateExecute: function(){
                if(Instance.massiveUpdateExecuteInProgress){
                    Ext.MessageBox.confirm('Confirmar', 'Esta seguro que desea actualizar '+this.store.getTotalCount()+' registros?', function(result){
                        if(result==="yes"){
                            Instance.gridComponent.store.sync({
                                success: function(){
                                    Instance.reloadPageStore(1);
                                    console.log("success!!");
                                },
                                scope: this
                            });
                            Instance.gridComponent.down('#massiveUpdateButton').setIconCls('icon-save');
                            Instance.massiveUpdateExecuteInProgress= false;
                            Instance.gridComponent.store.autoSync= true;
                            var apiUpdateByFilter= Instance.gridComponent.store.proxy.api.update;
                            Instance.gridComponent.store.proxy.api.update= apiUpdateByFilter.replaceAll("update/byfilter.htm","update.htm");
                        }
                    });
                }else{
                    Ext.MessageBox.alert('Operaci&oacute;n cancelada', "No hay Actualizaci&oacute;n masiva en progreso!!!");
                }
            },
            
            onMassiveUpdateCancel: function(){
                var apiUpdate= Instance.gridComponent.store.proxy.api.update;
                if(Instance.massiveUpdateExecuteInProgress || apiUpdate.indexOf("update/byfilter.htm")!==-1){
                    Instance.gridComponent.down('#massiveUpdateButton').setIconCls('icon-save');
                    Instance.massiveUpdateExecuteInProgress= false;
                    Instance.gridComponent.store.autoSync= true;
                    Instance.gridComponent.store.proxy.api.update= apiUpdate.replaceAll("update/byfilter.htm","update.htm");
                    Instance.reloadPageStore(1);
                }else{
                    Ext.MessageBox.alert('Operaci&oacute;n cancelada', "No hay Actualizaci&oacute;n masiva en progreso!!!");
                }
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
                        Ext.MessageBox.alert('Status', responseText.message);
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
            
            "Category": function(entity){
                var res = entity.split("__");
                return '<a href="/admin/vista/category/entity.htm#?tab=1&id='+res[0]+'">'+res[1]+'</a>';
            },
            
        };
        var pg= Ext.create('Ext.grid.property.Grid', {
            id: 'propertyGridSubCategory',
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
    
    Instance.showGlobalProcessForm= function(processName, idsField){
        var initData={};
        var ids= "";
        var selection = Instance.gridComponent.getSelectionModel().getSelection();
        if (selection.length>0) {
            for(var i=0; i<selection.length; i++){
                ids+=selection[i].data.id;
                if(i<selection.length-1){
                    ids+=",";
                }
            }
        }else{
            var check_items= document.getElementsByClassName("item_check");
            for(var i=0; i<check_items.length; i++){
                if(check_items[i].checked){
                    ids+=check_items[i].value;
                    if(i<selection.length-1){
                        ids+=",";
                    }
                }
            }
        }
        initData[idsField]= ids;
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
                return "<a style='font-size: 15px;' href='javascript:Ext.getCmp(\"subCategoryTabsContainer\").clickInTab(\"Formulario\")'>"+value+"</a>";
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
        Instance.formComboboxCategory= Instance.categoryExtInterfaces.getCombobox('form', 'SubCategory', 'category', 'Category');
        Instance.gridComboboxCategory= Instance.categoryExtInterfaces.getCombobox('grid', 'SubCategory', 'category', 'Category');
        Instance.filterComboboxCategory= Instance.categoryExtInterfaces.getCombobox('filter', 'SubCategory', 'category', 'Category');
        Instance.filterMultiselectCategory= Instance.categoryExtInterfaces.getMultiselect('SubCategory', 'category', 'Category');
        Instance.comboboxCategoryRender= Instance.categoryExtInterfaces.getComboboxRender('grid');
        
        
        Instance.entityDependency= {};
        
        
        Instance.childExtControllers= [];
        
        if(Instance.typeView==="Parent"){
        
        }
        
        Instance.formComponent= null;
        
        Instance.formContainer = getFormContainer(Instance.childExtControllers);
        Instance.formComponent= Instance.formContainer.child('#formSubCategory');
        Instance.store.formComponent= Instance.formComponent;
        
        
        Instance.gridComponent = null;
        
        Instance.gridContainer = getGridContainer();
        Instance.gridComponent = Instance.gridContainer.child('#gridSubCategory');
        Instance.store.gridComponent= Instance.gridComponent;
        createFormImport();
        
            
        
        
        Instance.processForms={};
        
        
        Instance.propertyGrid= getPropertyGrid();

        Instance.tabsContainer= Ext.widget('tabpanel', {
            id: "subCategoryTabsContainer",
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
                        url= util.removeUrlParameter(url,"id");
                    }
                    if(url!==""){
                        mvcExt.navigate(url);
                    }
                }
            },
            clickInTab: function(labelTab){
                $("#subCategorySubEntity").find("span.x-tab-inner").each(function() {
                    if(this.innerText===labelTab){
                        util.eventFire(document.getElementById(this.id), "click");
                    }
                });
            }
        });
        
        
        Instance.mainView= {
            id: Instance.id,
            
            title: 'Gestionar Sub Categorias',
            
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

function CategoryExtController(parentExtController, parentExtView){
    
    var Instance= this;
    
    Instance.id= "/category";
    
    Instance.modelName="CategoryModel";
    
    Instance.services= {};
    
    var util= new Util();
    
    // VIEWS *******************************************
    
    Instance.entityExtView= new CategoryExtView(Instance, null);
    
    //*******************************************************
    
    
    Instance.init= function(){
        Instance.entityName= "Category";
        Instance.entityRef= "category";
        Instance.typeController= "Parent";
        Instance.idEntitySelected= null;
        Instance.parentEntityTitle= null;
        Instance.parentEntityId= null;
        Instance.reloadGrid= false;
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
        
        if(activeTab!==null){
            Instance.entityExtView.tabsContainer.setActiveTab(Number(activeTab));
        }else{
            Instance.entityExtView.tabsContainer.setActiveTab(0);
        }
        
        if(filter!==null){
            Instance.initFilter();
            var currentFilter= JSON.parse(filter);
            for (var key in currentFilter) {
                if(Instance.filter[key]!==currentFilter[key]){
                    Instance.filter[key]= currentFilter[key];
                    Instance.reloadGrid= true;
                }
            }
        }
        
        
        
        
        if(activeTab!=="1" && (Instance.entityExtView.store.totalCount===undefined || Instance.reloadGrid)){
            Instance.loadGridData();
            Instance.appliedFilters= filter;
        }
        
        if(activeTab==="1"){
            if(id!==null && id!==Instance.idEntitySelected){
                Instance.idEntitySelected= id;
                Instance.loadFormData(Instance.idEntitySelected);
            }
        }
        
    };
    
    Instance.loadGridData= function(){
        Instance.entityExtView.setFilterStore(JSON.stringify(Instance.filter));
        Instance.entityExtView.reloadPageStore(1);
        Instance.reloadGrid= false;
    };
    
    Instance.setFormData= function(record){
        if(Instance.entityExtView.formComponent!==null){
            Instance.entityExtView.formComponent.setActiveRecord(record || null);
            Instance.idEntitySelected= record.data.id;
        }
    };
    
    Instance.loadFormData= function(id){
        if(Instance.entityExtView.formComponent!==null){
            if(id!==null && id!==""){
                var loaded = false;
                if(Instance.entityExtView.gridComponent!==null){
                    var selection = Instance.entityExtView.gridComponent.getSelectionModel().getSelection();
                    if(selection.length===1 && selection[0].data.id+""===id){
                        Instance.setFormData(selection[0]);
                        loaded=true;
                    }
                }
                if(!loaded){
                    Instance.entityExtView.entityExtStore.load(id, function(data){
                        var record= Ext.create(Instance.modelName);
                        record.data= data;
                        Instance.entityExtView.formComponent.setActiveRecord(record || null);
                    });
                }
                Instance.loadChildExtControllers(id);
            }else{
                Instance.entityExtView.formComponent.getForm().reset();
                Instance.idEntitySelected= "";
                if(Object.keys(Instance.filter.eq).length !== 0){
                    var record= Ext.create(Instance.modelName);
                    for (var key in Instance.filter.eq) {
                        record.data[key]= Instance.filter.eq[key];
                    }
                    Instance.entityExtView.formComponent.setActiveRecord(record || null);
                }
                Instance.loadChildExtControllers("");
            }
        }
    };
    
    Instance.loadFormFirstItem= function(){
        Instance.loadFormData("");
        var params="&limit=1&page=1";
        params+="&sort="+Instance.entityExtView.store.getOrderProperty()+"&dir="+Instance.entityExtView.store.getOrderDir();
        Instance.entityExtView.entityExtStore.find(JSON.stringify(Instance.filter), params, function(responseText){
            if(responseText.success && responseText.totalCount>0){
                var data= responseText.data[0];
                var record= Ext.create(Instance.modelName);
                record.data= data;
                Instance.setFormData(record);
            }
        });
    };
    
    Instance.loadNNMulticheckData= function(){
        Instance.entityExtView.clearNNMultichecks();
        Instance.entityExtView.findAndLoadNNMultichecks(JSON.stringify(Instance.filter));
    };
    
    Instance.loadChildExtControllers= function(idEntitySelected){
        if(Instance.typeController==="Parent"){
            var jsonTypeChildExtViews= {"subCategory":"tcv_1_to_n"};
            Instance.entityExtView.childExtControllers.forEach(function(childExtController) {
                if(idEntitySelected!==""){
                    childExtController.parentEntityId= idEntitySelected;
                    childExtController.filter= {"eq":{"category":idEntitySelected}};
                    childExtController.entityExtView.setValueInEmptyModel("category", idEntitySelected);
                    if(jsonTypeChildExtViews[childExtController.entityRef]==="tcv_1_to_n"){
                        childExtController.loadGridData();
                        childExtController.loadFormData("");
                    }else if(jsonTypeChildExtViews[childExtController.entityRef]==="tcv_1_to_1"){
                        childExtController.loadFormFirstItem();
                    }else if(jsonTypeChildExtViews[childExtController.entityRef]==="tcv_n_to_n"){
                        childExtController.loadNNMulticheckData();
                    }
                }else{
                    childExtController.parentEntityId= null;
                    childExtController.filter= {"eq":{"id":"0"}};
                    if(jsonTypeChildExtViews[childExtController.entityRef]==="tcv_1_to_n"){
                        childExtController.loadGridData();
                        childExtController.loadFormData("");
                    }else if(jsonTypeChildExtViews[childExtController.entityRef]==="tcv_1_to_1"){
                        childExtController.loadFormFirstItem();
                    }else if(jsonTypeChildExtViews[childExtController.entityRef]==="tcv_n_to_n"){
                        childExtController.loadNNMulticheckData();
                    }
                }
            });
        }
    };
    
    Instance.saveFormData= function(action, data){
        if(Instance.typeController==="Child" && Instance.parentEntityId===null){
            Ext.MessageBox.alert('Operaci&oacute;n cancelada', "No se ha seleccionado "+Instance.parentEntityTitle+" padre!!!");
        }else{
            Instance.entityExtView.entityExtStore.save(action, JSON.stringify(data), Instance.formSavedResponse);
        }
    };
    
    Instance.formSavedResponse= function(responseText){
        var message= responseText.message.replaceAll("category","Categoria");
        if(responseText.success){
            
            Instance.entityExtView.entityExtStore.upload(Instance.entityExtView.formComponent, responseText.data.id, function(responseUpload){
                Ext.MessageBox.alert('Status', message+"<br>"+responseUpload.message);
                if(responseUpload.success){
                    var record= Ext.create(Instance.modelName);
                    record.data= responseUpload.data;
                    Instance.entityExtView.formComponent.setActiveRecord(record || null);
                    
                    Instance.loadChildExtControllers(record.data.id);
                }
            });
            
            
            Instance.reloadGrid= true;
        }else{
            Ext.MessageBox.alert('Status', message);
        }
    };
    
    Instance.getSelectedIds= function(){
        var selection = Instance.entityExtView.gridComponent.getSelectionModel().getSelection();
        var ids=[];
        if (selection.length>0) {
            for(var i=0; i<selection.length; i++){
                ids.push(selection[i].data.id);
            }
        }else{
            var check_items= document.getElementsByClassName("item_check");
            for(var i=0; i<check_items.length; i++){
                if(check_items[i].checked){
                    ids.push(check_items[i].value);
                }
            }
        }
        return ids;
    };
    
    Instance.deleteRecords= function(){
        var ids= Instance.getSelectedIds();
        if(ids.length>0){
            var filter={"in":{"id":ids}};
            if(ids.length===1){
                Instance.entityExtView.entityExtStore.deleteByFilter(JSON.stringify(filter), function(responseText){
                    Instance.loadFormData("");
                    Instance.entityExtView.reloadPageStore(Instance.entityExtView.store.currentPage);
                });
            }else{
                Ext.MessageBox.confirm('Confirmar', 'Esta seguro que desea eliminar '+ids.length+' registros?', function(result){
                    if(result==="yes"){
                        Instance.entityExtView.entityExtStore.deleteByFilter(JSON.stringify(filter), function(responseText){
                            Instance.loadFormData("");
                            Instance.entityExtView.reloadPageStore(Instance.entityExtView.store.currentPage);
                        });
                    }
                });
            }
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
            urlAction+='#?filter={"eq":{"category":'+Instance.idEntitySelected+'}}';
        }
        mvcExt.redirect(urlAction);
    };

    Instance.init();
}
</script>
        
            
                
            

<script>

function SubCategoryExtController(parentExtController, parentExtView){
    
    var Instance= this;
    
    Instance.id= "/subCategory";
    
    Instance.modelName="SubCategoryModel";
    
    Instance.services= {};
    
    var util= new Util();
    
    // VIEWS *******************************************
    
    Instance.entityExtView= new SubCategoryExtView(Instance, null);
    
    //*******************************************************
    
    
    Instance.init= function(){
        Instance.entityName= "SubCategory";
        Instance.entityRef= "subCategory";
        Instance.typeController= "Child";
        Instance.idEntitySelected= null;
        Instance.parentEntityTitle= null;
        Instance.parentEntityId= null;
        Instance.reloadGrid= false;
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
        
        if(activeTab!==null){
            Instance.entityExtView.tabsContainer.setActiveTab(Number(activeTab));
        }else{
            Instance.entityExtView.tabsContainer.setActiveTab(0);
        }
        
        if(filter!==null){
            Instance.initFilter();
            var currentFilter= JSON.parse(filter);
            for (var key in currentFilter) {
                if(Instance.filter[key]!==currentFilter[key]){
                    Instance.filter[key]= currentFilter[key];
                    Instance.reloadGrid= true;
                }
            }
        }
        
        
            
        if(Instance.filter.eq.category!==undefined && Instance.filter.eq.category!==''){
            Instance.entityExtView.categoryExtInterfaces.entityExtStore.load(Instance.filter.eq.category, Instance.entityExtView.categoryExtInterfaces.addLevel);
        }else{
            Instance.entityExtView.categoryExtInterfaces.addLevel(null);
        }
        
        
        
        if(activeTab!=="1" && (Instance.entityExtView.store.totalCount===undefined || Instance.reloadGrid)){
            Instance.loadGridData();
            Instance.appliedFilters= filter;
        }
        
        if(activeTab==="1"){
            if(id!==null && id!==Instance.idEntitySelected){
                Instance.idEntitySelected= id;
                Instance.loadFormData(Instance.idEntitySelected);
            }
        }
        
    };
    
    Instance.loadGridData= function(){
        Instance.entityExtView.setFilterStore(JSON.stringify(Instance.filter));
        Instance.entityExtView.reloadPageStore(1);
        Instance.reloadGrid= false;
    };
    
    Instance.setFormData= function(record){
        if(Instance.entityExtView.formComponent!==null){
            Instance.entityExtView.formComponent.setActiveRecord(record || null);
            Instance.idEntitySelected= record.data.id;
        }
    };
    
    Instance.loadFormData= function(id){
        if(Instance.entityExtView.formComponent!==null){
            if(id!==null && id!==""){
                var loaded = false;
                if(Instance.entityExtView.gridComponent!==null){
                    var selection = Instance.entityExtView.gridComponent.getSelectionModel().getSelection();
                    if(selection.length===1 && selection[0].data.id+""===id){
                        Instance.setFormData(selection[0]);
                        loaded=true;
                    }
                }
                if(!loaded){
                    Instance.entityExtView.entityExtStore.load(id, function(data){
                        var record= Ext.create(Instance.modelName);
                        record.data= data;
                        Instance.entityExtView.formComponent.setActiveRecord(record || null);
                    });
                }
                Instance.loadChildExtControllers(id);
            }else{
                Instance.entityExtView.formComponent.getForm().reset();
                Instance.idEntitySelected= "";
                if(Object.keys(Instance.filter.eq).length !== 0){
                    var record= Ext.create(Instance.modelName);
                    for (var key in Instance.filter.eq) {
                        record.data[key]= Instance.filter.eq[key];
                    }
                    Instance.entityExtView.formComponent.setActiveRecord(record || null);
                }
                Instance.loadChildExtControllers("");
            }
        }
    };
    
    Instance.loadFormFirstItem= function(){
        Instance.loadFormData("");
        var params="&limit=1&page=1";
        params+="&sort="+Instance.entityExtView.store.getOrderProperty()+"&dir="+Instance.entityExtView.store.getOrderDir();
        Instance.entityExtView.entityExtStore.find(JSON.stringify(Instance.filter), params, function(responseText){
            if(responseText.success && responseText.totalCount>0){
                var data= responseText.data[0];
                var record= Ext.create(Instance.modelName);
                record.data= data;
                Instance.setFormData(record);
            }
        });
    };
    
    Instance.loadNNMulticheckData= function(){
        Instance.entityExtView.clearNNMultichecks();
        Instance.entityExtView.findAndLoadNNMultichecks(JSON.stringify(Instance.filter));
    };
    
    Instance.loadChildExtControllers= function(idEntitySelected){
        if(Instance.typeController==="Parent"){
            var jsonTypeChildExtViews= {};
            Instance.entityExtView.childExtControllers.forEach(function(childExtController) {
                if(idEntitySelected!==""){
                    childExtController.parentEntityId= idEntitySelected;
                    childExtController.filter= {"eq":{"subCategory":idEntitySelected}};
                    childExtController.entityExtView.setValueInEmptyModel("subCategory", idEntitySelected);
                    if(jsonTypeChildExtViews[childExtController.entityRef]==="tcv_1_to_n"){
                        childExtController.loadGridData();
                        childExtController.loadFormData("");
                    }else if(jsonTypeChildExtViews[childExtController.entityRef]==="tcv_1_to_1"){
                        childExtController.loadFormFirstItem();
                    }else if(jsonTypeChildExtViews[childExtController.entityRef]==="tcv_n_to_n"){
                        childExtController.loadNNMulticheckData();
                    }
                }else{
                    childExtController.parentEntityId= null;
                    childExtController.filter= {"eq":{"id":"0"}};
                    if(jsonTypeChildExtViews[childExtController.entityRef]==="tcv_1_to_n"){
                        childExtController.loadGridData();
                        childExtController.loadFormData("");
                    }else if(jsonTypeChildExtViews[childExtController.entityRef]==="tcv_1_to_1"){
                        childExtController.loadFormFirstItem();
                    }else if(jsonTypeChildExtViews[childExtController.entityRef]==="tcv_n_to_n"){
                        childExtController.loadNNMulticheckData();
                    }
                }
            });
        }
    };
    
    Instance.saveFormData= function(action, data){
        if(Instance.typeController==="Child" && Instance.parentEntityId===null){
            Ext.MessageBox.alert('Operaci&oacute;n cancelada', "No se ha seleccionado "+Instance.parentEntityTitle+" padre!!!");
        }else{
            Instance.entityExtView.entityExtStore.save(action, JSON.stringify(data), Instance.formSavedResponse);
        }
    };
    
    Instance.formSavedResponse= function(responseText){
        var message= responseText.message.replaceAll("subCategory","Sub Categoria");
        if(responseText.success){
            
            Instance.entityExtView.entityExtStore.upload(Instance.entityExtView.formComponent, responseText.data.id, function(responseUpload){
                Ext.MessageBox.alert('Status', message+"<br>"+responseUpload.message);
                if(responseUpload.success){
                    var record= Ext.create(Instance.modelName);
                    record.data= responseUpload.data;
                    Instance.entityExtView.formComponent.setActiveRecord(record || null);
                    
                    Instance.loadChildExtControllers(record.data.id);
                }
            });
            
            
            Instance.reloadGrid= true;
        }else{
            Ext.MessageBox.alert('Status', message);
        }
    };
    
    Instance.getSelectedIds= function(){
        var selection = Instance.entityExtView.gridComponent.getSelectionModel().getSelection();
        var ids=[];
        if (selection.length>0) {
            for(var i=0; i<selection.length; i++){
                ids.push(selection[i].data.id);
            }
        }else{
            var check_items= document.getElementsByClassName("item_check");
            for(var i=0; i<check_items.length; i++){
                if(check_items[i].checked){
                    ids.push(check_items[i].value);
                }
            }
        }
        return ids;
    };
    
    Instance.deleteRecords= function(){
        var ids= Instance.getSelectedIds();
        if(ids.length>0){
            var filter={"in":{"id":ids}};
            if(ids.length===1){
                Instance.entityExtView.entityExtStore.deleteByFilter(JSON.stringify(filter), function(responseText){
                    Instance.loadFormData("");
                    Instance.entityExtView.reloadPageStore(Instance.entityExtView.store.currentPage);
                });
            }else{
                Ext.MessageBox.confirm('Confirmar', 'Esta seguro que desea eliminar '+ids.length+' registros?', function(result){
                    if(result==="yes"){
                        Instance.entityExtView.entityExtStore.deleteByFilter(JSON.stringify(filter), function(responseText){
                            Instance.loadFormData("");
                            Instance.entityExtView.reloadPageStore(Instance.entityExtView.store.currentPage);
                        });
                    }
                });
            }
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
            urlAction+='#?filter={"eq":{"subCategory":'+Instance.idEntitySelected+'}}';
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
    
    Instance.modelName="CategoryModelInt";
    
    // MODELS **********************************************
    
    Instance.entityExtModel= new CategoryExtModel();
    
    // STORES **********************************************
    
    Instance.entityExtStore= new CategoryExtStore();
    
    //*******************************************************
    
    
    Instance.init= function(){
        Instance.pluralEntityTitle= 'Categorias';
        Instance.singularEntityTitle= 'Categoria';
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
            source[Instance.singularEntityTitle]= entity.id+"__"+entity.name;
        }else{
            delete source[Instance.singularEntityTitle];
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
                    },
                    scope: this
                },
                afterrender: function( ){
                    Instance.store.addListener('load', function(){
                        if(component==='filter'){
                            var rec = { id: 0, name: '-' };
                            Instance.store.insert(0,rec);
                        }
                        
                    });
                }
            },
            getDisplayValue: function() {
                var me = this;
                var displayValue="";
                if(me.value!==null){
                    if(typeof me.value === "object"){
                        displayValue= me.value[me.displayField];
                        if(displayValue!==undefined){
                            if(false && me.displayField!==me.valueField){
                                displayValue= me.value[me.valueField] + " - " + displayValue;
                            }
                            me.setValue(me.value[me.valueField]);
                        }
                    }else{
                        var record = null;
                        if(me.value) {
                            record = me.getStore().findRecord(me.valueField, me.value);
                        }
                        if(record) {
                            if(false && me.displayField!==me.valueField && record.get(me.displayField).indexOf(me.value +" - ")===-1){
                                displayValue= me.value + " - ";
                            }
                            displayValue+= record.get(me.displayField);
                        }else{
                            displayValue= me.value;
                        }
                    }
                }
                return displayValue;                
            }
        });
        
        if(component!=='grid'){
            Instance.combobox[component].fieldLabel= fieldTitle;
        }
        
        return Instance.combobox[component];
    };
    
    Instance.getMultiselect= function(entityDestination, fieldName, fieldTitle){
        Instance.store.pageSize= 1000;
        Instance.store.sorters.items[0].property='name';
        Instance.store.sorters.items[0].direction='ASC';
        Instance.multiselect= {
            id: 'multiselect'+fieldName+'In'+entityDestination,
            name: fieldName,
            fieldLabel: fieldTitle,
            xtype: 'multiselect',
            displayField: 'name',
            valueField: 'id',
            allowBlank: true,
            anchor: '100%',
            maxHeight: 150,
            msgTarget: 'side',
            arrayValues:[],
            lastSelected: null,
            store: Instance.store,
            listeners: {
                change: function(record){
                    var value= record.getValue();
                    if(value.length===1){
                        this.lastSelected= value[0];
                    }
                },
                el: {
                    click: function() {
                        var selector=Ext.getCmp('multiselect'+fieldName+'In'+entityDestination);
                        var index= selector.arrayValues.indexOf(selector.lastSelected);
                        if(selector.lastSelected!==null && index===-1){
                            selector.arrayValues.push(selector.lastSelected);
                        }else{
                            selector.arrayValues.splice(index, 1);
                        }
                        selector.setValue(selector.arrayValues);
                        if(selector.arrayValues.length>0){
                            parentExtController.filter.in[fieldName]= selector.arrayValues;
                        }else{
                            delete parentExtController.filter.in[fieldName];
                        }
                    },
                    scope: this
                },
                afterrender: function( ){
                    Instance.multiselect.store.loadPage(1);
                }
            }
        };
        
        return Instance.multiselect;
    };
    
    Instance.getComboboxRender= function(component){
        Instance.comboboxRender[component]= function (value, p, record){
            var displayField= Instance.combobox[component].displayField;
            var valueField= Instance.combobox[component].valueField;
            var result="";

            if (typeof value === "object" && Object.getOwnPropertyNames(value).length === 0){
                result= "";
            }else if(value[displayField] !== undefined){
                
                result+= value[displayField];
            }else{
                if(value[valueField] !== undefined){
                    value= value[valueField];
                }
                var record = Instance.combobox[component].findRecord(valueField, value);
                if(record){
                    result= record.get(Instance.combobox[component].displayField);
                }else{
                    result= value;
                }
            }
            return result;
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

function CategoryExtViewport(){
    
    var Instance= this;
    
    var util= new Util();
    
    Instance.entityExtController= new CategoryExtController(null, Instance);
    
    
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
                //labelWidth: "51%",
                anchor: '100%',
                labelAlign: 'right'
            },

            layout: {
                type: 'vbox',
                align: 'stretch'  // Child items are stretched to full width
            },

            items: [{"xtype":"numberfield","listeners":{"change":function(){   if(this.getValue()!==null && this.getValue()!==''){       Instance.entityExtController.filter.eq.id= this.getValue();   }else{       delete Instance.entityExtController.filter.eq.id;   }}},"fieldLabel":"Id","name":"id"},{"xtype":"textfield","listeners":{"change":function(){   if(this.getValue()!==null && this.getValue()!==''){       Instance.entityExtController.filter.lk.name= this.getValue();   }else{       delete Instance.entityExtController.filter.lk.name;   }}},"fieldLabel":"Nombre","name":"name"},{"xtype":"textfield","listeners":{"change":function(){   if(this.getValue()!==null && this.getValue()!==''){       Instance.entityExtController.filter.lk.description= this.getValue();   }else{       delete Instance.entityExtController.filter.lk.description;   }}},"fieldLabel":"Descripci&oacute;n","name":"description"}],
            
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
            items: [{"text":"Sistema","menu":{"items":[{"text":"Seguridad","menu":{"items":[{"text":"Gestionar Autorizaciones","href":"/admin/vista/authorization/entity.htm"},{"text":"Gestionar Roles","href":"/admin/vista/role/entity.htm"},{"text":"Gestionar Usuarios","href":"/admin/vista/user/entity.htm"},{"text":"Gestionar Roles de Usuario","href":"/admin/vista/userRole/entity.htm"},{"text":"Gestionar Recursos Web","href":"/admin/vista/webResource/entity.htm"},{"text":"Gestionar Procesos de Usuario","href":"/admin/vista/processUser/process.htm"}]}},{"text":"Configuraci&oacute;n","menu":{"items":[{"text":"Gestionar Propiedades","href":"/admin/vista/property/entity.htm"},{"text":"Gestionar Configuraci&oacute;n General","href":"/admin/vista/generalConfig/configurationObject.htm"},{"text":"Mis datos","href":"/admin/vista/myAccount/entity.htm"}]}},{"text":"Gestor de Contenidos","menu":{"items":[{"text":"Gestionar Tipos de Entidades","href":"/admin/vista/webEntityType/entity.htm"},{"text":"Explorador de Entidades","href":"/admin/vista/webEntity/entityExplorer.htm"},{"text":"Explorador de Archivos","href":"/admin/vista/webFile/fileExplorer.htm"},{"text":"Mis Archivos","href":"/admin/vista/myFiles/fileExplorer.htm"}]}},{"text":"Correos","menu":{"items":[{"text":"Gestionar Correos","href":"/admin/vista/mail/entity.htm"},{"text":"Gestionar Plantillas de Correo","href":"/admin/vista/mailTemplate/entity.htm"}]}},{"text":"Tablas Lead","menu":{"items":[{"text":"Gestionar Tablas Lead","href":"/admin/vista/leadTable/entity.htm"}]}}]}},{"text":"Procesos de Negocio","menu":{"items":[{"text":"Gestionar Procesos de Cliente","href":"/admin/vista/processClient/process.htm"},{"text":"Gestionar Servicios Externos","href":"/admin/vista/externalService/process.htm"},{"text":"Gestionar Proceso Main Location","href":"/admin/vista/processMainLocation/process.htm"},{"text":"Gestionar Procesos de Producto","href":"/admin/vista/processProduct/process.htm"},{"text":"Gestionar Procesos de Ordenes de Compra","href":"/admin/vista/processPurchaseOrder/process.htm"},{"text":"Gestionar Clientes SOAP","href":"/admin/vista/soapClients/process.htm"}]}},{"text":"Comercios","menu":{"items":[{"text":"Gestionar Comercios","href":"/admin/vista/commerce/entity.htm"},{"text":"Gestionar Ubicaciones Principales","href":"/admin/vista/mainLocation/entity.htm"}]}},{"text":"Productos","menu":{"items":[{"text":"Gestionar Compras","href":"/admin/vista/compra/entity.htm"},{"text":"Gestionar Ventas","href":"/admin/vista/venta/entity.htm"},{"text":"Gestionar Categorias","href":"/admin/vista/category/entity.htm"},{"text":"Gestionar Productos","href":"/admin/vista/product/entity.htm"},{"text":"Reporte de Productos","href":"/admin/vista/product/report/reporteProductos.htm"}]}},{"text":"Pedidos","menu":{"items":[{"text":"Gestionar Ordenes de Inventario","href":"/admin/vista/inventoryOrder/entity.htm"},{"text":"Gestionar Proveedores","href":"/admin/vista/supplier/entity.htm"}]}},{"text":"Ordenes de Compra","menu":{"items":[{"text":"Gestionar Ordenes de Compra","href":"/admin/vista/purchaseOrder/entity.htm"},{"text":"Mis Compras","href":"/admin/vista/myShopping/entity.htm"}]}},{"text":"Pagos","menu":{"items":[{"text":"Gestionar Pagos","href":"/admin/vista/payment/entity.htm"}]}}]
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
        
        Instance.setAjaxTimeout(240000);

        Ext.require([
            'Ext.tip.QuickTipManager',
            'Ext.container.ButtonGroup',
            'Ext.container.Viewport',
            'Ext.layout.*',
            'Ext.form.field.Trigger',
            'Ext.form.Panel',
            'Ext.form.Label',
            'Ext.grid.*',
            'Ext.data.*',
            'Ext.menu.*',
            'Ext.tree.*',
            'Ext.selection.*',
            'Ext.tab.Panel',
            'Ext.util.History',
            'Ext.ux.form.MultiSelect',
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

            var homeExtViewport= new CategoryExtViewport();

            homeExtViewport.renderViewport();

            //Debe ser siempre la ultima linea**************************
            mvcExt.setHomeRequest("/category");
            mvcExt.processFirtsRequest();
        });
    };
    
    Instance.setAjaxTimeout= function(value){
        Ext.Ajax.timeout= value;
        Ext.override(Ext.form.Basic, { timeout: Ext.Ajax.timeout / 1000 });
        Ext.override(Ext.data.proxy.Server, { timeout: Ext.Ajax.timeout });
        Ext.override(Ext.data.Connection, { timeout: Ext.Ajax.timeout });
    };
    
    Instance.init();
}
</script>
        
        <!-- ############################ IMPORT COMPONENTS ################################### -->
        
        <script>

function CommonExtView(parentExtController, parentExtView, model){
    
    var Instance= this;
    
    var util= new Util();
    
    var customColorPicker= new CustomColorPicker();
    
    var MAX_LIST_ITEMS= 20;
    
    Instance.init= function(){
        if(model!==undefined && model!==null){
            Instance.modelNameCombobox= "ComboboxModelIn"+model;
            Instance.combobox={};
            Instance.comboboxRender={};
            Instance.multiselect={};
            Instance.radiogroup={};
            Instance.errorGeneral= "Error de servidor";
            Instance.error403= "Usted no tiene permisos para realizar esta operaci&oacute;n";
            Ext.define(Instance.modelNameCombobox, {
                extend: 'Ext.data.Model',
                fields: [
                    'value',
                    'text'
                ]
            });
            customColorPicker.define();
        }
    };
    
    Instance.getSimpleCombobox= function(fieldName, fieldTitle, component, dataArray, allowBlank){
        var data=[];
        data.push({value:"",text:"-"});
        dataArray.forEach(function(item) {
            if((item+"").indexOf(':')!==-1){
                var itemValue= item.split(':');
                var value= itemValue[0];
                if (!isNaN(value)){
                    value=Number(value);
                }
                data.push({value:value,text:itemValue[1]});
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
            id: component+'_'+fieldName,
            name: fieldName,
            editable: false,
            allowBlank: allowBlank,
            store: store,
            displayField: 'text',
            valueField: 'value',
            queryMode: 'local',
            dataStore: data,
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
    
    Instance.getSimpleMultiselect= function(fieldName, fieldTitle, dataArray, allowBlank){
        var data=[];
        dataArray.forEach(function(item) {
            if((item+"").indexOf(':')!==-1){
                var itemValue= item.split(':');
                var value= itemValue[0];
                if (!isNaN(value)){
                    value=Number(value);
                }
                data.push({value:value,text:itemValue[1]});
            }else{
                data.push({value:item,text:item});
            }
        });
        var store = Ext.create('Ext.data.Store', {
            autoDestroy: false,
            model: Instance.modelNameCombobox,
            data: data
        });
        Instance.multiselect[fieldName]= {
            id: 'multiselect'+fieldName+'In'+model,
            name: fieldName,
            fieldLabel: fieldTitle,
            xtype: 'multiselect',
            displayField: 'text',
            valueField: 'value',
            allowBlank: allowBlank,
            anchor: '100%',
            maxHeight: 150,
            msgTarget: 'side',
            arrayValues:[],
            lastSelected: null,
            store: store,
            listeners: {
                change: function(record){
                    var value= record.getValue();
                    if(value.length===1){
                        this.lastSelected= value[0];
                    }
                },
                el: {
                    click: function() {
                        var selector=Ext.getCmp('multiselect'+fieldName+'In'+model);
                        var index= selector.arrayValues.indexOf(selector.lastSelected);
                        if(selector.lastSelected!==null && index===-1){
                            selector.arrayValues.push(selector.lastSelected);
                        }else{
                            selector.arrayValues.splice(index, 1);
                        }
                        selector.setValue(selector.arrayValues);
                        if(selector.arrayValues.length>0){
                            parentExtController.filter.in[fieldName]= selector.arrayValues;
                        }else{
                            delete parentExtController.filter.in[fieldName];
                        }
                    },
                    scope: this
                }
            }
        };
        
        return Instance.multiselect[fieldName];
    };
    
    Instance.getSimpleComboboxRender= function(component, fieldName){
        Instance.comboboxRender[component+'_'+fieldName]= function (value, p, record){
            var displayField= Instance.combobox[component+'_'+fieldName].displayField;
            var valueField= Instance.combobox[component+'_'+fieldName].valueField;
            var result="";
            if(value[displayField] !== undefined){
                result+= value[displayField];
            }else{
                if(value[valueField] !== undefined){
                    value= value[valueField];
                }
                result= value;
                Instance.combobox[component+'_'+fieldName].dataStore.forEach(function(item){
                    if(item[valueField]===value){
                        result= item[displayField];
                    }
                });
            }
            return result;
        };
        
        return Instance.comboboxRender[component+'_'+fieldName];
    };
    
    Instance.getRadioGroup= function(fieldName, fieldTitle, dataArray){
        var data=[];
        dataArray.forEach(function(item) {
            if((item+"").indexOf(':')!==-1){
                var itemValue= item.split(':');
                var value= itemValue[0];
                if (!isNaN(value)){
                    value=Number(value);
                }
                data.push({name: fieldName, inputValue:value, boxLabel:itemValue[1]});
            }else{
                data.push({name: fieldName, inputValue:item, boxLabel:item});
            }
        });
        Ext.override(Ext.form.RadioGroup, {
            setValue : function(v){
                if (this.rendered) {
                    var value={};
                    value[this.el.dom.name]=true;
                    Ext.getCmp(this.id).items.items.forEach(function(item){
                        if(item.inputValue===v){
                            item.setValue(true);
                        }
                    });
                }
                return this;
            }
        });
        Instance.radiogroup[fieldName]= new Ext.form.RadioGroup({
            name: fieldName,
            fieldLabel: fieldTitle,
            items: data
        });
        
        return Instance.radiogroup[fieldName];
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
                    for (var i = 0; i < files.length; i++){
                        names.push(files[i].name);
                    }
                    value = names.join(', ');
                }
                Ext.form.field.File.superclass.setValue.call(this, value);
                delete this.duringFileSelect;
            }
        });
    };
    
    Instance.showListItems= function(formComponent){
        formComponent.query('.fieldset').forEach(function(c){
            if(c.itemTop!==undefined){
                var itemsGroup=Ext.getCmp(c.id);
                for(var i=0; i<MAX_LIST_ITEMS; i++){
                    var itemField= Ext.getCmp(c.id+'['+i+']');
                    var rendererField= Ext.getCmp(c.id+'['+i+']Renderer');
                    var linkField= Ext.getCmp(c.id+'['+i+']Link');
                    
                    var filled= false;
                    if(itemField.query){
                        itemField.query('.field').forEach(function(c){
                            var text=c.getValue();
                            if(text!==null && text!=="" && text!==false){
                                filled=true;
                            }
                        });
                    }else{
                        var text= itemField.getValue();
                        if(linkField){
                            text= linkField.getValue();
                        }
                        if(text!==null && text!=="" && text!==false){
                            filled=true;
                        }
                    }
                    if(filled){
                        itemField.setVisible(true);
                        itemField.setDisabled(false);
                        if(itemField.query){
                            itemField.query('.field').forEach(function(c){
                                var visible= true;
                                var upFieldset=c.up('fieldset');
                                while(upFieldset!==undefined && visible===true){
                                    visible=upFieldset.isVisible();
                                    upFieldset= upFieldset.up('fieldset');
                                };
                                c.setDisabled(!c.isVisible() || !visible);
                            });
                        }
                        if(rendererField){
                            rendererField.setVisible(true);
                            rendererField.setDisabled(false);
                        }
                        if(linkField){
                            linkField.setVisible(true);
                            linkField.setDisabled(false);
                        }
                        itemsGroup.itemTop=i+1;
                    }else{
                        itemField.setVisible(false);
                        itemField.setDisabled(true);
                        if(rendererField){
                            rendererField.setVisible(false);
                            rendererField.setDisabled(true);
                        }
                        if(linkField){
                            linkField.setVisible(false);
                            linkField.setDisabled(true);
                        }
                    }
                }
            }
        });
    };
    
    Instance.addListItem= function(processName, parent, fieldName){
        var itemsGroup= Ext.getCmp(processName+"_"+parent+fieldName);
        if(itemsGroup.itemTop<MAX_LIST_ITEMS){
            var itemField= Ext.getCmp(processName+"_"+parent+fieldName+"["+itemsGroup.itemTop+"]");
            var rendererField= Ext.getCmp(processName+"_"+parent+fieldName+"["+itemsGroup.itemTop+"]Renderer");
            var linkField= Ext.getCmp(processName+"_"+parent+fieldName+"["+itemsGroup.itemTop+"]Link");
            
            itemsGroup.itemTop+= 1;
            itemField.setVisible(true);
            itemField.setDisabled(false);
            if(itemField.query){
                itemField.query('.field').forEach(function(c){
                    var visible= true;
                    var upFieldset=c.up('fieldset');
                    while(upFieldset!==undefined && visible===true){
                        visible=upFieldset.isVisible();
                        upFieldset= upFieldset.up('fieldset');
                    };
                    c.setDisabled(!c.isVisible() || !visible);
                });
            }
            if(rendererField){
                rendererField.setVisible(true);
                rendererField.setDisabled(false);
            }
            if(linkField){
                linkField.setVisible(true);
                linkField.setDisabled(false);
            }
        }
    };
    
    Instance.removeListItem= function(processName, parent, fieldName){
        var itemsGroup= Ext.getCmp(processName+"_"+parent+fieldName);
        if(itemsGroup.itemTop>0){
            itemsGroup.itemTop-= 1;
            var itemField= Ext.getCmp(processName+"_"+parent+fieldName+"["+itemsGroup.itemTop+"]");
            var rendererField= Ext.getCmp(processName+"_"+parent+fieldName+"["+itemsGroup.itemTop+"]Renderer");
            var linkField= Ext.getCmp(processName+"_"+parent+fieldName+"["+itemsGroup.itemTop+"]Link");
            
            itemField.setVisible(false);
            itemField.setDisabled(true);
            if(itemField.query){
                itemField.query('.field').forEach(function(c){
                    c.setDisabled(true);
                });
            }
            if(rendererField){
                rendererField.setVisible(false);
                rendererField.setDisabled(true);
            }
            if(linkField){
                linkField.setVisible(false);
                linkField.setDisabled(true);
            }
        }
    };
    
    Instance.urlGridRender= function(value, p, record){
        if(value){
            return "<a target='_blank' href='"+value+"'>"+value+"</a>";
        }else{
            return value;
        }
    };
    
    Instance.passwordGridRender= function(value, p, record){
        if(value){
            return "*****";
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
    
    Instance.durationGridRender= function(value, p, record){
        if(value && !isNaN(value)){
            var seconds= Math.ceil(Number(value)/1000);
            var minutes= Math.floor(seconds/60);
            var hours= Math.floor(minutes/60);
            var ad_minutes= minutes-(hours*60);
            var ad_seconds= seconds-(ad_minutes*60)-(hours*60*60);
            return hours+":"+ad_minutes+":"+ad_seconds;
        }else{
            return value;
        }
    };
    
    Instance.priceGridRender= function(value, p, record){
        if(value && !isNaN(value)){
            return "$ "+Number(value).priceFormat(2);
        }else{
            return value;
        }
    };
    
    Instance.fileSizeGridRender= function(value, p, record){
        if(value && !isNaN(value)){
            return Instance.getFileSizeText(Number(value));
        }else{
            return value;
        }
    };
    
    Instance.numbererGridRender= function(value, metaData, record, rowIdx, colIdx, dataSource, view){
        metaData.style="text-align:left;color:#666666;";
        return (isNaN(record.index))?"":(record.index+1);
    };
    
    Instance.percentageGridRender = function (value, metaData, record) {
        var id = Ext.id();
        Ext.defer(function () {
            if(util.getHtml(id)!==null){
                Ext.widget('progressbar', {
                    renderTo: id,
                    value: value / 100,
                    width: "100%",
                    text: value + " %"
                });
            }
        }, 50);
        return Ext.String.format('<div id="{0}"></div>', id);
    };
    
    Instance.colorGridRender = function (v, metaData, record) {
        if(v){
            return '<div class="x-color-picker-box" style="background-color:'+v+';">'+
                    v+'</div>';
        }else{
            return v;
        }
    };
    
    Instance.conditionalColorGridRender = function (v, metaData, record, rowIndex, colIndex, store) {
        if(v){
            var background= "";
            var color= "";
            if('conditionalColor' in parentExtView.gridComponent.columns[colIndex-1]){
                var conditionalColor= parentExtView.gridComponent.columns[colIndex-1].conditionalColor;
                conditionalColor.forEach(function (item, index) {
                    var match= false;
                    if('eq' in item) match=(v===item.eq);
                    else if('lk' in item) match=(v.indexOf(item.lk)!==-1);
                    else if('lt' in item) match=(v<item.lt);
                    else if('lte' in item) match=(v<=item.lte);
                    else if('gt' in item) match=(v>item.gt);
                    else if('gte' in item) match=(v>=item.gte);
                    if(match){
                        background= ('bg' in item)?'background-color:'+item.bg+';':background;
                        color= ('c' in item)?'color:'+item.c+';':color;
                    }
                });
            }
            return '<div style="'+background+color+'padding:2px;text-align:center;">'+
                    v+'</div>';
        }else{
            return v;
        }
    };
    
    Instance.onOffGridRender = function (v, metaData, record) {
        var check=(v===true)?"checked":"unchecked";
        return '<label class="on_off '+check+'"></label>';
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
                   '<iframe src="/admin/vista/webFile/ajax/plainTextEditor.htm?fileUrl='+value+'&extractButton=1" frameborder="0" width="100%" height="100%"></iframe>';
        }else{
            return value;
        }
    };
    
    Instance.imageRender= function(value, field) {
        Instance.setLinkFieldValue(field, value);
        if(value){
            return '<a href="'+value+'" target="_blank">'+
                   '<img style="max-width:100%" src="'+value+'"></a>';
        }else{
            return "";
        }
    };
    
    Instance.downloadRender= function(value, field) {
        var fileName= value.split('/').pop();
        if(value){
            return '<h2>'+fileName+'</h2>'+
                   '<a href="'+value+'" target="_blank">'+
                   '<img title="Descargar" style="max-width:150%" src="/libimg/icon_types/download.png" />'+
                   '</a>';
        }else{
            return "";
        }
    };
    
    Instance.videoYoutubeRender= function(value, field) {
        Instance.setLinkFieldValue(field, value);
        var videoId= util.getParameter(value, "v");
        if(videoId!==null){
            return '<iframe width="528" height="287" src="https://www.youtube.com/embed/'+videoId+'" frameborder="0" allowfullscreen></iframe>';
        }else{
            return "";
        }
    };
    
    Instance.onOffRender= function(value, field){
        var checkboxId= field.id.replaceAll("Renderer", "");
        var check= (value===true || value==="true")?"checked":"unchecked";
        Ext.getCmp(checkboxId).setValue(value);
        var forAttr= checkboxId+'-inputEl';
        var onclickAttr= "util.switchClassElement(this,'checked','unchecked')";
        if(Ext.getCmp(checkboxId).readOnly){
            forAttr='';
            onclickAttr='javascript:void(0)';
        }
        return '<label for="'+forAttr+'" class="on_off '+check+'" onclick="'+onclickAttr+'"></label>';
    };
    
    Instance.videoFileUploadRender= function(value, field) {
        Instance.setLinkFieldValue(field, value);
        if(value){
            return '<iframe frameborder="0" width="100%" height="100%" src="'+value+'" allowfullscreen></iframe>';
        }else{
            return "";
        }
    };
    
    Instance.audioFileUploadRender= function(value, field) {
        Instance.setLinkFieldValue(field, value);
        if(value){
            return '<audio style="width:500px" src="'+value+'" preload="auto" controls>'+
                   '    Your browser does not support the video tag.'+
                   '</audio>';
        }else{
            return "";
        }
    };
    
    Instance.fileSizeRender= function(value, field) {
        Instance.setLinkFieldValue(field, value);
        if(value){
            return "<b>"+Instance.getFileSizeText(Number(value))+"</b>";
        }else{
            return "";
        }
    };
    
    Instance.googleMapsRender= function(value, field) {
        Instance.setLinkFieldValue(field, value);
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
        //setTimeout(function(){
        try{
            var linkFieldId= (field.id+"").replaceAll("Renderer", "Link");
            var fieldId= (field.id+"").replaceAll("Renderer", "");
            if(Ext.getCmp(linkFieldId)!==undefined){
                Ext.getCmp(linkFieldId).setValue((value)?value:"");
            }else if(Ext.getCmp(fieldId)!==undefined){
                Ext.getCmp(fieldId).setValue((value)?value:"");
            }
        }catch(e){
            console.error(e);
        }
        //},1000);
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
                default:
                    if(extension in util.PLAIN_EXTENSIONS){
                        htmlView= Instance.textEditorRender(value, field);
                    }else{
                        htmlView= Instance.downloadRender(value, field);
                    }
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
    
    Instance.getFileSizeText= function(bytes){
        if(bytes<1024){
           return bytes.toFixed(2) + " bytes";
        }
        var kb= bytes/1024;
        if(kb<1024){
           return kb.toFixed(2) + " KB";
        }
        var mb= kb/1024;
        if(mb<1024){
            return mb.toFixed(2) + " MB";
        }
        var gb= mb/1024;
        if(gb<1024){
            return gb.toFixed(2) + " GB";
        }
        var tb= gb/1024;
        if(tb<1024){
            return tb.toFixed(2) + " TB";
        }
        var pb= tb/1024;
        return pb.toFixed(2) + " PB";
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
            Ext.MessageBox.show({
                msg: 'Cargando...',
                width:200,
                wait:true,
                waitConfig: {interval:200}
            });
            userAuthentication.replicateAuthentication(function(replicationResult){
                if(replicationResult.replicated || replicationResult.userData===null){
                    location.reload();
                }else{
                    Instance.showErrorMessage(Instance.error403);
                }
            });
        }else{
            Instance.showErrorMessage(Instance.errorGeneral);
        }
    };
    
    Instance.showErrorMessage= function(errorMsg){
        Ext.MessageBox.show({
            title: 'ERROR REMOTO',
            msg: errorMsg,
            icon: Ext.MessageBox.ERROR,
            buttons: Ext.Msg.OK
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
        location.href= url;
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
    var userAuthentication;
    try{
        userAuthentication = new UserAuthentication();
    }catch(e){
        console.error(e);
    }
</script>
<div id="headerHtml" style="display:none;">
    <a href="/"><img src="/img/favicon.png" class="logoAdmin"></a>
    <h1>Administraci&oacute;n MERCANDO</h1>
    
    
        <a class="logout" onclick="userAuthentication.logout()" href="javascript:void(0)">&nbsp;Cerrar sesi&oacute;n&nbsp;</a>
        <a class="home" href="/account/home?redirect=user">&nbsp;Inicio&nbsp;</a>
        <p class="userSession"><b>lcastrillo</b> - Luis Alberto Castrillo</p>
    
</div>

    </body>
</html>
