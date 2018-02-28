<%-- 
    Document   : ventadirecta
    Created on : 28/02/2018, 12:16:07 PM
    Author     : grupot
--%>





<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Venta Directa - Administraci&oacute;n MERCANDO</title>
        <link rel="icon" type="image/icon" href="/img/habitares.png" /> 
        
            
    <script src="http://maps.google.com/maps?file=api&amp;v=3&amp;key=AIzaSyD_IP-Js3_ETbJ9psH605u-4iqZihp_-Jg&sensor=true" type="text/javascript"></script>
    
    <script src="/vista/libjs/jquery/jquery-3.1.0.min.js" type="text/javascript"></script>
    <script src="/vista/libjs/util/Util.js"></script>
    <script src="/vista/libjs/util/FileUploader.js"></script>
    <script src="/vista/libjs/util/GoogleMaps.js"></script>
    <script src="/vista/libjs/util/vkbeautify.0.99.00.beta.js"></script>
    <script src="/vista/libjs/user/UserAuthentication.js"></script>

    <link href="/vista/libcss/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/vista/libcss/navegador.css" rel="stylesheet" type="text/css">
    <link href="/vista/libcss/gridTemplateStyles.css" rel="stylesheet" type="text/css">
        
        



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

function DirectExtModel(){
    
    var Instance = this;
    
    
    Instance.defineModel= function(modelName){
        Ext.define(modelName, {
            extend: 'Ext.data.Model',
            fields: [{"useNull":true,"name":"id","type":"int"},{"name":"nombre","type":"string"},{"name":"apellidos","type":"string"},{"name":"correo","type":"string"},{"name":"estado","type":"string"},{"name":"valido","type":"bool"},{"dateFormat":"d/m/Y","name":"fecha_registro","type":"date"},{"name":"foto_perfil","type":"string"},{"name":"hora_registro"}],
            validations: [{"min":1,"field":"apellidos","max":100,"type":"length"},{"min":0,"field":"estado","max":45,"type":"length"},{"min":0,"field":"hora_registro","max":45,"type":"length"},{"min":0,"field":"valido","max":45,"type":"length"},{"min":0,"field":"correo","max":60,"type":"length"},{"min":0,"field":"foto_perfil","max":200,"type":"length"},{"min":1,"field":"nombre","max":60,"type":"length"}]
        });
    };
    
}
</script>
        
        <!-- ############################ IMPORT STORES ################################### -->
        
        
<script>

function DirectExtStore(){
    
    var Instance = this;
    
    var commonExtView= new CommonExtView();
    
    
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
                    read: Ext.context+'/rest/direct/lt_venta_directa/find.htm',
                    create: Ext.context+'/rest/direct/lt_venta_directa/create.htm',
                    update: Ext.context+'/rest/direct/lt_venta_directa/update.htm',
                    destroy: Ext.context+'/rest/direct/lt_venta_directa/delete.htm'
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
            url: Ext.context+"/rest/direct/lt_venta_directa/find.htm",
            method: "GET",
            params: "filter="+encodeURIComponent(filter) + params,
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
            url: Ext.context+"/rest/direct/lt_venta_directa/"+operation+".htm",
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
            url: Ext.context+"/rest/direct/lt_venta_directa/load.htm",
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
            url: Ext.context+"/rest/direct/lt_venta_directa/diskupload/"+idEntity+".htm",
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
            url: Ext.context+'/rest/direct/lt_venta_directa/import/'+typeReport+'.htm',
            waitMsg: 'Importando archivo...',
            success: function(form, action) {
                func(action.result);
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
            url: Ext.context+"/rest/direct/lt_venta_directa/delete/byfilter.htm",
            method: "GET",
            params: "filter="+encodeURIComponent(filter),
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

function DirectExtView(parentExtController, parentExtView){
    
    var Instance= this;
    
    Instance.id= "/direct";
    
    Instance.modelName="DirectModel";
    
    var util= new Util();
    
    // MODELS **********************************************
    
    Instance.entityExtModel= new DirectExtModel();
    
    // STORES **********************************************
    
    Instance.entityExtStore= new DirectExtStore();
    
    // COMPONENTS *******************************************
    
    Instance.commonExtView= new CommonExtView(parentExtController, Instance, 'Direct');
    
    //*******************************************************
    
    
    Instance.init= function(){
        Instance.typeView= "";
        Instance.pluralEntityTitle= 'Venta Directa';
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
    
    
    function getFormContainer(){
        var formFields= [{"xtype":"numberfield","fieldLabel":"Id","name":"id","readOnly":true},{"allowBlank":false,"fieldLabel":"Nombre","name":"nombre"},{"allowBlank":false,"fieldLabel":"Apellidos","name":"apellidos"},{"vtype":"email","fieldLabel":"Correo","name":"correo"},Instance.commonExtView.getSimpleCombobox('estado','Estado','form',['Activo','Inactivo','Pendiente']),{"xtype":"checkbox","uncheckedValue":"false","fieldLabel":"Válido","name":"valido","inputValue":"true"},{"xtype":"datefield","fieldLabel":"Fecha Registro","name":"fecha_registro","format":"d/m/Y","tooltip":"Seleccione la fecha"},{"renderer":Instance.commonExtView.imageRender,"xtype":"displayfield","fieldLabel":"Foto de Perfil","name":"foto_perfil"},{"fieldLabel":"&nbsp;","name":"foto_perfil","id":"formDirect_foto_perfilLinkField"},{"xtype":"filefield","emptyText":"Seleccione una imagen","fieldLabel":"&nbsp;","name":"foto_perfil_File"},{"xtype":"timefield","fieldLabel":"Hora","name":"hora_registro","format":"h:i:s A","tooltip":"Seleccione la hora"}];

        Instance.defineWriterForm(formFields);
        
        var itemsForm= [{
            itemId: 'formDirect',
            xtype: 'writerformDirect',
            border: false,
            width: '100%',
            listeners: {
                create: function(form, data){
                    Instance.entityExtStore.save('create', JSON.stringify(data), parentExtController.formSavedResponse);
                },
                update: function(form, data){
                    Instance.entityExtStore.save('update', JSON.stringify(data), parentExtController.formSavedResponse);
                },
                render: function(panel) {
                    Instance.commonExtView.enableManagementTabHTMLEditor();
                }
            }
        }];
        
        return Ext.create('Ext.container.Container', {
            id: 'formContainerDirect',
            title: 'Formulario',
            type: 'fit',
            align: 'stretch',
            items: itemsForm
        });
    };
    
    Instance.setFormActiveRecord= function(record){
        Instance.formComponent.setActiveRecord(record || null);
    };
    
    Instance.defineWriterForm= function(fields){
        Ext.define('WriterFormDirect', {
            extend: 'Ext.form.Panel',
            alias: 'widget.writerformDirect',

            requires: ['Ext.form.field.Text'],

            initComponent: function(){
                //this.addEvents('create');
                
                var buttons= [];
                
                buttons= [{
                    iconCls: 'icon-save',
                    itemId: 'saveDirect',
                    text: 'Actualizar',
                    disabled: true,
                    scope: this,
                    handler: this.onSave
                }, {
                    //iconCls: 'icon-user-add',
                    text: 'Crear',
                    scope: this,
                    handler: this.onCreate
                }, {
                    //iconCls: 'icon-reset',
                    text: 'Limpiar',
                    scope: this,
                    handler: this.onReset
                },{
                    text: '&#x25BC; Ver todo',
                    scope: this,
                    handler: this.onSeeAll
                },'|'];
                
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
                    if(this.down('#saveDirect')!==null){
                        this.down('#saveDirect').enable();
                    }
                    this.getForm().loadRecord(this.activeRecord);
                } else {
                    if(this.down('#saveDirect')!==null){
                        this.down('#saveDirect').disable();
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
            }
    
        });
        
    };
    
    
    
    
    function getGridContainer(){
        var idGrid= 'gridDirect';
        var gridColumns= [{"renderer":idEntityRender,"dataIndex":"id","width":100,"header":"Id","sortable":true},{"field":{"type":"textfield"},"dataIndex":"nombre","width":200,"header":"Nombre","sortable":true},{"field":{"type":"textfield"},"dataIndex":"apellidos","width":200,"header":"Apellidos","sortable":true},{"editor":{"vtype":"email"},"dataIndex":"correo","width":200,"header":"Correo","sortable":true},{"editor":Instance.commonExtView.getSimpleCombobox('estado','Estado','grid',['Activo','Inactivo','Pendiente']),"dataIndex":"estado","width":200,"header":"Estado","sortable":true},{"editor":{"xtype":"checkbox","cls":"x-grid-checkheader-editor"},"dataIndex":"valido","width":200,"header":"Válido","sortable":true},{"editor":{"xtype":"datefield","format":"d/m/Y"},"xtype":"datecolumn","dataIndex":"fecha_registro","width":200,"format":"d/m/Y","header":"Fecha Registro","sortable":true},{"renderer":Instance.commonExtView.imageGridRender,"field":{"type":"textfield"},"dataIndex":"foto_perfil","width":200,"header":"Foto de Perfil","sortable":true},{"editor":{"xtype":"timefield","format":"h:i:s A"},"dataIndex":"hora_registro","width":200,"header":"Hora","sortable":true}];
        
        Instance.emptyModel= {"apellidos":"","estado":"","hora_registro":"","fecha_registro":"","valido":"","correo":"","foto_perfil":"","nombre":""};
        Instance.getEmptyRec= function(){
            return new DirectModel(Instance.emptyModel);
        };
        
        var store= Instance.store;

        Instance.defineWriterGrid('Venta Directa', gridColumns);
        
        return Ext.create('Ext.container.Container', {
            id: 'gridContainerDirect',
            title: 'Listado',
            layout: {
                type: 'vbox',
                align: 'stretch'
            },
            items: [{
                itemId: idGrid,
                xtype: 'writergridDirect',
                style: 'border: 0px',
                flex: 1,
                store: store,
                listeners: {
                    selectionchange: function(selModel, selected) {
                        if(selected[0]){
                            Instance.setFormActiveRecord(selected[0]);
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
                                var urlFind= store.proxy.api.read.replace("/find.htm","/find/xml.htm");
                                window.open(urlFind+data,'_blank');
                                break;
                            case "xls":
                                var urlFind= store.proxy.api.read.replace("/find.htm","/find/xls.htm");
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
            return new DirectModel(Instance.emptyModel);
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
        var combobox= Instance.commonExtView.getSimpleCombobox('sort', 'Ordenar por', 'config', ["id:Id","nombre:Nombre","apellidos:Apellidos","correo:Correo","estado:Estado","valido:Válido","fecha_registro:Fecha Registro","foto_perfil:Foto de Perfil","hora_registro:Hora"]);
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
        Ext.define('WriterGridDirect', {
            extend: 'Ext.grid.Panel',
            alias: 'widget.writergridDirect',

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
                                {text: 'A Excel', handler: function(){this.exportTo('xls');}, scope: this},
                                {text: 'A JSON', handler: function(){this.exportTo('json');}, scope: this},
                                {text: 'A XML', handler: function(){this.exportTo('xml');}, scope: this}]
                        },{
                            itemId: 'importMenu',
                            text: 'Importar',
                            //iconCls: 'add16',
                            menu: [
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
    
    
    function idEntityRender(value, p, record){
        if(record){
            return "<a style='font-size: 15px;' href='#?id="+record.data.id+"&tab=1'>"+value+"</a>";
        }else{
            return value;
        }
    };
    
    Instance.createMainView= function(){
        
        Instance.formComponent= null;
        
        Instance.formContainer = getFormContainer();
        Instance.formComponent = Instance.formContainer.child('#formDirect');
        Instance.store.formComponent= Instance.formComponent;
        
        
        Instance.gridComponent= null;
        
        Instance.gridContainer = getGridContainer();
        Instance.gridComponent = Instance.gridContainer.child('#gridDirect');
        Instance.store.gridComponent= Instance.gridComponent;
        createFormImport();
        

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
                    if(url!==""){
                        mvcExt.navigate(url);
                    }
                }
            }
        });
        
        Instance.mainView= {
            id: Instance.id,
            title: 'Gestionar Venta Directa',
            frame: false,
            layout: 'border',
            items: [
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

function DirectExtController(parentExtController, parentExtView){
    
    var Instance= this;
    
    Instance.id= "/direct";
    
    Instance.modelName="DirectModel";
    
    Instance.services= {};
    
    var util= new Util();
    
    // VIEWS *******************************************
    
    Instance.entityExtView= new DirectExtView(Instance, null);
    
    //*******************************************************
    
    
    Instance.init= function(){
        Instance.entityRef= "direct";
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
        
        if(activeTab==="1"){
            Instance.loadFormData(id);
        }
        
        if(activeTab==="" || activeTab==="0"){
            Instance.loadGridData();
        }
    };
    
    Instance.loadGridData= function(){
        Instance.entityExtView.setFilterStore(JSON.stringify(Instance.filter));
        Instance.entityExtView.reloadPageStore(1);
    };
    
    Instance.loadFormData= function(id){
        if(Instance.entityExtView.formComponent!==null){
            if(id!==""){
                Instance.idEntitySelected= id;
                var activeRecord= Instance.entityExtView.formComponent.getActiveRecord();

                if(activeRecord===null){
                    Instance.entityExtView.entityExtStore.load(id, function(data){
                        var record= Ext.create(Instance.modelName);
                        record.data= data;
                        Instance.entityExtView.formComponent.setActiveRecord(record || null);
                    });
                }
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
    
    Instance.formSavedResponse= function(responseText){
        if(responseText.success){
            
            Instance.entityExtView.entityExtStore.upload(Instance.entityExtView.formComponent, responseText.data.id, function(responseUpload){
                Ext.MessageBox.alert('Status', responseText.message+"<br>"+responseUpload.message);
                if(responseUpload.success){
                    var record= Ext.create(Instance.modelName);
                    record.data= responseUpload.data;
                    Instance.entityExtView.formComponent.setActiveRecord(record || null);
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
            urlAction+='#?filter={"eq":{"direct":'+Instance.idEntitySelected+'}}';
        }
        mvcExt.redirect(urlAction);
    };

    Instance.init();
}
</script>
        
        <!-- ############################ IMPORT BASE ELEMENTES ################################### -->
        
        
<script>

function DirectExtViewport(){
    
    var Instance= this;
    
    var util= new Util();
    
    Instance.entityExtController= new DirectExtController(null, Instance);
    
    function arrayContains(array, obj) {
        for(var i=0; i<array.length; i++){
            if (array[i]===obj) {
               return true;
            }
        }
        return false;
    }
    
    function arrayRemove(array, obj) {
        for(var i=0; i<array.length; i++){
            if (array[i]===obj) {
               array.splice(i, 1);
            }
        }
        return array;
    }
    
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
        
        Instance.msForm = {
            id: 'multiselect-field',
            name: 'multiselect',
            fieldLabel: 'Multiselect',
            xtype: 'multiselect',
            valueField: 'number',
            displayField: 'number',
            anchor: '100%',
            height: 150,
            msgTarget: 'side',
            arrayValues:[],
            lastSelected: null,
            store: {
                fields: [ 'number' ],
                data: [
                    {number: "Opcion 1"},
                    {number: "Opcion 2"},
                    {number: "Opcion 3"},
                    {number: "Opcion 4"},
                    {number: "Opcion 5"},
                    {number: "Opcion 6"},
                    {number: "Opcion 7"},
                    {number: "Opcion 8"},
                    {number: "Opcion 9"},
                    {number: "Opcion 10"},
                    {number: "Opcion 11"}
                ]
            },
            listeners: {
                change: function(record){
                    var value= record.getValue();
                    if(value.length===1){
                        this.lastSelected= value[0];
                    }
                },
                el: {
                    click: function() {
                        var selector=Ext.getCmp("multiselect-field");
                        if(selector.lastSelected!==null && !arrayContains(selector.arrayValues, selector.lastSelected)){
                            selector.arrayValues.push(selector.lastSelected);
                        }else{
                            selector.arrayValues= arrayRemove(selector.arrayValues, selector.lastSelected);
                        }
                        selector.setValue(selector.arrayValues);
                    },
                    scope: this
                },
                afterrender: function(  ){
                    alert("render");
                }
            }
        };
            
            
        /*]
            , listeners: {
                afterrender: function (ms) {
                    var view = ms.down('dataview');

                    view.myAllowDeselect = false;

                    view.on({
                        beforedeselect: function (selModel) {
                            var view = selModel.view;
                            view.lastSelected = Ext.Array.from(selModel.getSelection());
                            return view.myAllowDeselect;
                        }
                        , itemmousedown: function (view, record, item, i) {
                            var selModel = view.getSelectionModel()
                                , selected = selModel.isSelected(i);

                            if (view.lastSelected && !selected) {
                                selModel.select(i, true);
                            }
                            if (selected) {
                                view.myAllowDeselect = true;
                                selModel.deselect(record);
                                view.myAllowDeselect = false;
                            }
                        }
                    });
                }
            }
        })*/
        
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

            items: [
                {
                  "xtype": "numberfield",
                  "listeners": {
                    "change": function(){
                      if(this.getValue()!==null&&this.getValue()!==''){
                        Instance.entityExtController.filter.eq.id=this.getValue();
                      }else{
                        delete Instance.entityExtController.filter.eq.id;
                      }
                    }
                  },
                  "fieldLabel": "Id",
                  "name": "id"
                },
                {
                  "xtype": "textfield",
                  "listeners": {
                    "change": function(){
                      if(this.getValue()!==null&&this.getValue()!==''){
                        Instance.entityExtController.filter.lk.nombre=this.getValue();
                      }else{
                        delete Instance.entityExtController.filter.lk.nombre;
                      }
                    }
                  },
                  "fieldLabel": "Nombre",
                  "name": "nombre"
                },
                {
                  "xtype": "textfield",
                  "listeners": {
                    "change": function(){
                      if(this.getValue()!==null&&this.getValue()!==''){
                        Instance.entityExtController.filter.lk.apellidos=this.getValue();
                      }else{
                        delete Instance.entityExtController.filter.lk.apellidos;
                      }
                    }
                  },
                  "fieldLabel": "Apellidos",
                  "name": "apellidos"
                },
                {
                  "xtype": "textfield",
                  "listeners": {
                    "change": function(){
                      if(this.getValue()!==null&&this.getValue()!==''){
                        Instance.entityExtController.filter.lk.correo=this.getValue();
                      }else{
                        delete Instance.entityExtController.filter.lk.correo;
                      }
                    }
                  },
                  "fieldLabel": "Correo",
                  "name": "correo"
                },
                
                Instance.msForm,
                /*{
                    height: 200,
                    xtype: 'multiselect',
                    fieldLabel: 'MultiSelect Test',
                    name: 'multiselect',
                    id: 'multiselect-field-01',
                    allowBlank: false,
                    store: {
                        fields: [ 'number' ],
                        data: [{
                            number: 1
                        }, {
                            number: 2
                        }, {
                            number: 3
                        }, {
                            number: 4
                        }, {
                            number: 5
                        }, {
                            number: 6
                        }, {
                            number: 7
                        }]
                    },
                    valueField: 'number',
                    displayField: 'number'
                }*/
                ,
                {
                  "xtype": "checkbox",
                  "listeners": {
                    "change": function(){
                      if(this.getValue()!==null&&this.getValue()!==''){
                        Instance.entityExtController.filter.eq.valido=this.getValue();
                      }else{
                        delete Instance.entityExtController.filter.eq.valido;
                      }
                    }
                  },
                  "fieldLabel": "Válido",
                  "name": "valido"
                },
                {
                  "layout": "column",
                  "xtype": "panel",
                  "bodyStyle": "padding-bottom: 5px;",
                  "items": [
                    {
                      "columnWidth": 0.34,
                      "html": "Fecha Registro:&nbsp;",
                      "style": "text-align: right"
                    },
                    {
                      "xtype": "datefield",
                      "listeners": {
                        "change": function(){
                          if(Instance.entityExtController.filter.btw.fecha_registro===undefined){
                            Instance.entityExtController.filter.btw.fecha_registro=[
                              null,
                              null
                            ];
                          }if(this.getValue()!==null){
                            Instance.entityExtController.filter.btw.fecha_registro[
                              0
                            ]=Ext.Date.format(this.getValue(),
                            'd/m/Y');
                          }else{
                            Instance.entityExtController.filter.btw.fecha_registro[
                              0
                            ]=null;
                          }if(Instance.entityExtController.filter.btw.fecha_registro[
                            0
                          ]===null&&Instance.entityExtController.filter.btw.fecha_registro[
                            1
                          ]===null){
                            delete Instance.entityExtController.filter.btw.fecha_registro;
                          }
                        }
                      },
                      "name": "fecha_registro_start",
                      "format": "d/m/Y",
                      "tooltip": "Seleccione la fecha",
                      "columnWidth": 0.31
                    },
                    {
                      "columnWidth": 0.04,
                      "html": "&nbsp;-&nbsp;"
                    },
                    {
                      "xtype": "datefield",
                      "listeners": {
                        "change": function(){
                          if(Instance.entityExtController.filter.btw.fecha_registro===undefined){
                            Instance.entityExtController.filter.btw.fecha_registro=[
                              null,
                              null
                            ];
                          }if(this.getValue()!==null){
                            Instance.entityExtController.filter.btw.fecha_registro[
                              1
                            ]=Ext.Date.format(this.getValue(),
                            'd/m/Y');
                          }else{
                            Instance.entityExtController.filter.btw.fecha_registro[
                              1
                            ]=null;
                          }if(Instance.entityExtController.filter.btw.fecha_registro[
                            0
                          ]===null&&Instance.entityExtController.filter.btw.fecha_registro[
                            1
                          ]===null){
                            delete Instance.entityExtController.filter.btw.fecha_registro;
                          }
                        }
                      },
                      "name": "fecha_registro_end",
                      "format": "d/m/Y",
                      "tooltip": "Seleccione la fecha",
                      "columnWidth": 0.31
                    }
                  ]
                },
                {
                  "xtype": "textfield",
                  "listeners": {
                    "change": function(){
                      if(this.getValue()!==null&&this.getValue()!==''){
                        Instance.entityExtController.filter.lk.foto_perfil=this.getValue();
                      }else{
                        delete Instance.entityExtController.filter.lk.foto_perfil;
                      }
                    }
                  },
                  "fieldLabel": "Foto de Perfil",
                  "name": "foto_perfil"
                },
                {
                  "layout": "column",
                  "xtype": "panel",
                  "bodyStyle": "padding-bottom: 5px;",
                  "items": [
                    {
                      "columnWidth": 0.34,
                      "html": "Hora:&nbsp;",
                      "style": "text-align: right"
                    },
                    {
                      "xtype": "timefield",
                      "listeners": {
                        "change": function(){
                          if(Instance.entityExtController.filter.btw.hora_registro===undefined){
                            Instance.entityExtController.filter.btw.hora_registro=[
                              null,
                              null
                            ];
                          }if(this.getValue()!==null){
                            Instance.entityExtController.filter.btw.hora_registro[
                              0
                            ]=Ext.Date.format(this.getValue(),
                            'H:i:s');
                          }else{
                            Instance.entityExtController.filter.btw.hora_registro[
                              0
                            ]=null;
                          }if(Instance.entityExtController.filter.btw.hora_registro[
                            0
                          ]===null&&Instance.entityExtController.filter.btw.hora_registro[
                            1
                          ]===null){
                            delete Instance.entityExtController.filter.btw.hora_registro;
                          }
                        }
                      },
                      "name": "hora_registro_start",
                      "tooltip": "Seleccione la hora",
                      "columnWidth": 0.31
                    },
                    {
                      "columnWidth": 0.04,
                      "html": "&nbsp;-&nbsp;"
                    },
                    {
                      "xtype": "timefield",
                      "listeners": {
                        "change": function(){
                          if(Instance.entityExtController.filter.btw.hora_registro===undefined){
                            Instance.entityExtController.filter.btw.hora_registro=[
                              null,
                              null
                            ];
                          }if(this.getValue()!==null){
                            Instance.entityExtController.filter.btw.hora_registro[
                              1
                            ]=Ext.Date.format(this.getValue(),
                            'H:i:s');
                          }else{
                            Instance.entityExtController.filter.btw.hora_registro[
                              1
                            ]=null;
                          }if(Instance.entityExtController.filter.btw.hora_registro[
                            0
                          ]===null&&Instance.entityExtController.filter.btw.hora_registro[
                            1
                          ]===null){
                            delete Instance.entityExtController.filter.btw.hora_registro;
                          }
                        }
                      },
                      "name": "hora_registro_end",
                      "tooltip": "Seleccione la hora",
                      "columnWidth": 0.31
                    }
                  ]
                }
              ],
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
            items: [{"text":"Sistema","menu":{"items":[{"text":"Seguridad","menu":{"items":[{"text":"Gestionar Roles","href":"/vista/role/entity.htm"},{"text":"Gestionar Usuarios","href":"/vista/user/entity.htm"},{"text":"Gestionar Autorizaciones","href":"/vista/authorization/entity.htm"},{"text":"Gestionar Roles de Usuario","href":"/vista/userRole/entity.htm"},{"text":"Gestionar Recursos Web","href":"/vista/webResource/entity.htm"}]}},{"text":"Configuraci&oacute;n","menu":{"items":[{"text":"Gestionar Propiedades","href":"/vista/property/entity.htm"},{"text":"Gestionar Configuraci&oacute;n General","href":"/vista/generalConfig/configurationObject.htm"},{"text":"Mis datos","href":"/vista/myAccount/entity.htm"}]}},{"text":"Gestor de Contenidos","menu":{"items":[{"text":"Explorador de Archivos","href":"/vista/webFile/fileExplorer.htm"}]}},{"text":"Correos","menu":{"items":[{"text":"Gestionar Plantillas de Correo","href":"/vista/mailTemplate/entity.htm"},{"text":"Gestionar Correos","href":"/vista/mail/entity.htm"}]}},{"text":"Tablas Lead","menu":{"items":[{"text":"Gestionar Tablas Lead","href":"/vista/leadTable/entity.htm"}]}}]}},{"text":"Procesos de Negocio","menu":{"items":[{"text":"Gestionar Servicios Externos","href":"/vista/externalService/process.htm"},{"text":"Gestionar Proceso Main Location","href":"/vista/processMainLocation/process.htm"},{"text":"Gestionar Procesos de Producto","href":"/vista/processProduct/process.htm"},{"text":"Gestionar Procesos de Ordenes de Compra","href":"/vista/processPurchaseOrder/process.htm"},{"text":"Gestionar Clientes SOAP","href":"/vista/soapClients/process.htm"},{"text":"Gestionar Procesos de Usuario","href":"/vista/processUser/process.htm"}]}},{"text":"Comercios","menu":{"items":[{"text":"Gestionar Comercios","href":"/vista/commerce/entity.htm"},{"text":"Gestionar Ubicaciones Principales","href":"/vista/mainLocation/entity.htm"}]}},{"text":"Productos","menu":{"items":[{"text":"Gestionar Categorias","href":"/vista/category/entity.htm"},{"text":"Gestionar Productos","href":"/vista/product/entity.htm"}]}},{"text":"Pedidos","menu":{"items":[{"text":"Gestionar Ordenes de Inventario","href":"/vista/inventoryOrder/entity.htm"},{"text":"Gestionar Proveedores","href":"/vista/supplier/entity.htm"}]}},{"text":"Ordenes de Compra","menu":{"items":[{"text":"Gestionar Ordenes de Compra","href":"/vista/purchaseOrder/entity.htm"},{"text":"Mis Compras","href":"/vista/myShopping/entity.htm"}]}},{"text":"Pagos","menu":{"items":[{"text":"Gestionar Pagos","href":"/vista/payment/entity.htm"}]}}]
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

            var homeExtViewport= new DirectExtViewport();

            homeExtViewport.renderViewport();

            //Debe ser siempre la ultima linea**************************
            mvcExt.setHomeRequest("/direct");
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
            return '<a href="'+value+'" target="_blank">'+
                   '<img style="max-width:150%" src="'+value+'"></a>';
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
            return '<iframe width="528" height="287" src="https://www.youtube.com/embed/'+videoId+'" frameborder="0" allowfullscreen></iframe>';
        }else{
            return "";
        }
    };
    
    Instance.videoFileUploadRender= function(value, field) {
        Instance.setLinkFieldValue(field, value);
        if(value){
            return '<video style="width:528px;height:297px" controls>'+
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
            return '<audio style="width:500px" src="'+value+'" preload="auto" controls>'+
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
    var userAuthentication;
    try{
        userAuthentication = new UserAuthentication();
    }catch(e){
        console.error(e);
    }
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
