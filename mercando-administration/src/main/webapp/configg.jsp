<%-- 
    Document   : configg
    Created on : 5/12/2017, 05:08:04 PM
    Author     : grupot
--%>





<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Configuraci&oacute;n General - Administraci&oacute;n MERCANDO</title>
        <link rel="icon" type="image/icon" href="/img/habitares.png" />
        
            
    <script src="http://maps.google.com/maps?file=api&amp;v=3&amp;key=AIzaSyD_IP-Js3_ETbJ9psH605u-4iqZihp_-Jg&sensor=true" type="text/javascript"></script>
    
    <script src="/js/libs/jquery/jquery-3.1.0.min.js" type="text/javascript"></script>
    <script src="/js/util/Util.js"></script>
    <script src="/js/web/usuario/UserAuthentication.js"></script>
    
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


        
        <style>
            .x-html-editor-input textarea{white-space: pre !important;}
            .x-tree-icon-leaf {background-image: url("http://jsonviewer.stack.hu/blue.gif") !important; }
            .x-tree-icon-parent, .x-tree-icon-parent-expanded {background-image: url("http://jsonviewer.stack.hu/object.gif") !important;background-repeat:no-repeat;}
        </style>
        
        <!-- ############################ IMPORT LAYOUTS ################################ -->
        
        
        
        <!-- ############################ IMPORT MODELS ################################### -->
        
        
            
<script>

function GeneralConfigExtModel(){
    
    var Instance = this;
    
    
    Instance.defineportalConfigModel= function(modelName){
        Ext.define(modelName, {
            extend: 'Ext.data.Model',
            fields: [{"name":"banner","type":"string"},{"name":"corporateMail","type":"string"},{"name":"language","type":"string"},{"name":"mainOffice","type":"string"},{"name":"name","type":"string"},{"name":"promVideo","type":"string"},{"name":"review","type":"string"}],
            validations: []
        });
    };
    
    Instance.definecontactConfigModel= function(modelName){
        Ext.define(modelName, {
            extend: 'Ext.data.Model',
            fields: [{"name":"cellPhone","type":"string"},{"name":"comments","type":"string"},{"name":"mail","type":"string"},{"name":"userName","type":"string"},{"name":"usuario.correo","type":"string"},{"name":"usuario.estado","type":"string"},{"dateFormat":"d/m/Y","name":"usuario.fechaRegistro","type":"date"},{"name":"usuario.nombre","type":"string"},{"name":"usuario.rol.estado","type":"string"},{"name":"usuario.rol.nombre","type":"string"},{"name":"usuario.telefono","type":"int"}],
            validations: [{"min":1,"field":"mail","type":"length"},{"min":1,"field":"userName","type":"length"},{"min":1,"field":"usuario.correo","type":"length"},{"min":1,"field":"usuario.nombre","type":"length"},{"min":1,"field":"usuario.rol.nombre","type":"length"}]
        });
    };
    
    
}
</script>
        
        
        <!-- ############################ IMPORT STORES ################################### -->
        
        
            
<script>

function GeneralConfigExtStore(){
    
    var Instance = this;
    
    var commonExtView= new CommonExtView();
    
    
    Instance.saveConfig= function(configurationObjectRef, data, func){
        Ext.MessageBox.show({
            msg: 'Guardando...',
            width:200,
            wait:true,
            waitConfig: {interval:200}
        });
        Ext.Ajax.request({
            url: Ext.context+"/rest/generalConfig/saveConfig.htm",
            method: "POST",
            headers: {
                'Content-Type' : 'application/json'
            },
            jsonData: {'configurationObjectRef': configurationObjectRef, 'data': util.remakeJSONObject(data)},
            success: function(response){
                Ext.MessageBox.hide();
                var result= Ext.decode(response.responseText);
                func(configurationObjectRef, result);
            },
            failure: function(response){
                commonExtView.processFailure(response);
            }
        });
    };
    
    Instance.loadConfig= function(configurationObjectRef, func){
        Ext.MessageBox.show({
            msg: 'Cargando...',
            width:200,
            wait:true,
            waitConfig: {interval:200}
        });
        Ext.Ajax.request({
            url: Ext.context+"/rest/generalConfig/loadConfig/"+configurationObjectRef+".htm",
            method: "GET",
            success: function(response){
                var result= Ext.decode(response.responseText);
                func(result.data);
                Ext.MessageBox.hide();
            },
            failure: function(response){
                commonExtView.processFailure(response);
            }
        });
    };
    
    Instance.upload= function(form, configurationObjectRef, func){
        form.submit({
            url: Ext.context+'/rest/generalConfig/diskupload/'+configurationObjectRef+'.htm',
            waitMsg: 'Subiendo archivo...',
            success: function(form, action) {
                func(action.result);
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

function GeneralConfigExtView(parentExtController, parentExtView){
    
    var Instance= this;
    
    Instance.id= "/generalConfig";
    
    var util= new Util();
    
    // MODELS **********************************************
    
    Instance.entityExtModel= new GeneralConfigExtModel();
    
    // STORES **********************************************
    
    Instance.entityExtStore= new GeneralConfigExtStore();
    
    // COMPONENTS *******************************************
    
    Instance.commonExtView= new CommonExtView(parentExtController, Instance, 'GeneralConfig');
    
    //*******************************************************
    
    
    Instance.init= function(){
        
        Instance.entityExtModel.defineportalConfigModel("portalConfigModel");
        
        Instance.entityExtModel.definecontactConfigModel("contactConfigModel");
        
        
        Instance.createMainView();
    };
    
    
        
    function getTreeMenuConfigurationObjects(){
        var store1 = {
            //model: 'Item',
            root: {
                text: 'Root 1',
                expanded: true,
                children: [
                    
                    {
                        id: 'form-portalConfig',
                        text: 'Configuraci&oacute;n del Portal',
                        leaf: true
                    },
                    
                    {
                        id: 'form-contactConfig',
                        text: 'Configuraci&oacute;n de Contacto',
                        leaf: true
                    },
                    
                ]
            }
        };
        
        var treePanelConfigurationObjects = Ext.create('Ext.tree.Panel', {
            id: 'tree-panel-process',
            title: 'Configuraci&oacute;n',
            region:'west',
            collapsible: true,
            split: true,
            width: 300,
            minSize: 200,
            height: '100%',
            rootVisible: false,
            autoScroll: true,
            store: store1
        });
        
        treePanelConfigurationObjects.getSelectionModel().on('select', function(selModel, record) {
            if (record.get('leaf')) {
                Ext.getCmp('content-configurationObjects').layout.setActiveItem(record.getId());
            }
        });
        
        return treePanelConfigurationObjects;
    }
    
    
    function getFormContainerportalConfig(){
        var formFields= [{"fieldLabel":"Nombre","name":"name"},Instance.commonExtView.getSimpleCombobox('language','Lenguaje','form',['ES:Español','EN:Inglés','FR:Francés']),{"vtype":"email","fieldLabel":"Correo Corporativo","name":"corporateMail"},{"fieldLabel":"Banner","name":"banner"},{"renderer":Instance.commonExtView.imageRender,"fieldLabel": "&nbsp;","xtype":"displayfield","name":"banner"},{"xtype":"filefield","emptyText":"Seleccione una imagen","fieldLabel":"&nbsp;","name":"banner_File"},{"renderer":Instance.commonExtView.googleMapsRender,"xtype":"displayfield","fieldLabel":"Oficina Principal","name":"mainOffice"},{"emptyText":"Google Maps Point","fieldLabel":"&nbsp;","name":"mainOffice"},{"renderer":Instance.commonExtView.videoYoutubeRender,"xtype":"displayfield","fieldLabel":"Video Promocional","name":"promVideo"},{"emptyText":"Url Youtube","fieldLabel":"&nbsp;","name":"promVideo"},{"xtype":"htmleditor","fieldLabel":"Reseña","name":"review","enableColors":true,"enableAlignments":true,"height":400},{"itemTop":0,"layout":"anchor","xtype":"fieldset","fieldDefaults":{"labelAlign":"right","anchor":"100%"},"minWidth":300,"id":"locations","title":"Ubicaciones:","collapsible":true,"items":[{"fieldLabel":"Item 0","name":"locations[0]","id":"locations[0]"},{"hidden":true,"fieldLabel":"Item 1","name":"locations[1]","disabled":true,"id":"locations[1]"},{"hidden":true,"fieldLabel":"Item 2","name":"locations[2]","disabled":true,"id":"locations[2]"},{"hidden":true,"fieldLabel":"Item 3","name":"locations[3]","disabled":true,"id":"locations[3]"},{"hidden":true,"fieldLabel":"Item 4","name":"locations[4]","disabled":true,"id":"locations[4]"},{"hidden":true,"fieldLabel":"Item 5","name":"locations[5]","disabled":true,"id":"locations[5]"},{"hidden":true,"fieldLabel":"Item 6","name":"locations[6]","disabled":true,"id":"locations[6]"},{"hidden":true,"fieldLabel":"Item 7","name":"locations[7]","disabled":true,"id":"locations[7]"},{"hidden":true,"fieldLabel":"Item 8","name":"locations[8]","disabled":true,"id":"locations[8]"},{"hidden":true,"fieldLabel":"Item 9","name":"locations[9]","disabled":true,"id":"locations[9]"},{"hidden":true,"fieldLabel":"Item 10","name":"locations[10]","disabled":true,"id":"locations[10]"},{"hidden":true,"fieldLabel":"Item 11","name":"locations[11]","disabled":true,"id":"locations[11]"},{"hidden":true,"fieldLabel":"Item 12","name":"locations[12]","disabled":true,"id":"locations[12]"},{"hidden":true,"fieldLabel":"Item 13","name":"locations[13]","disabled":true,"id":"locations[13]"},{"hidden":true,"fieldLabel":"Item 14","name":"locations[14]","disabled":true,"id":"locations[14]"},{"hidden":true,"fieldLabel":"Item 15","name":"locations[15]","disabled":true,"id":"locations[15]"},{"hidden":true,"fieldLabel":"Item 16","name":"locations[16]","disabled":true,"id":"locations[16]"},{"hidden":true,"fieldLabel":"Item 17","name":"locations[17]","disabled":true,"id":"locations[17]"},{"hidden":true,"fieldLabel":"Item 18","name":"locations[18]","disabled":true,"id":"locations[18]"},{"hidden":true,"fieldLabel":"Item 19","name":"locations[19]","disabled":true,"id":"locations[19]"},{"handler":function(){                   var itemsGroup= Ext.getCmp('locations');                   if(itemsGroup.itemTop<19){                       itemsGroup.itemTop+= 1;                       var itemEntity= Ext.getCmp('locations['+itemsGroup.itemTop+']');                       itemEntity.setVisible(true);                       itemEntity.setDisabled(false);                       if(itemEntity.query){                           itemEntity.query('.field').forEach(function(c){                             c.setDisabled(false);                           });                       }                   }               },"xtype":"button","width":100,"style":"margin:5px","text":"Agregar"},{"handler":function(){                   var itemsGroup= Ext.getCmp('locations');                   if(itemsGroup.itemTop>=0){                       var itemEntity= Ext.getCmp('locations['+itemsGroup.itemTop+']');                       itemsGroup.itemTop-= 1;                       itemEntity.setVisible(false);                       itemEntity.setDisabled(true);                       if(itemEntity.query){                           itemEntity.query('.field').forEach(function(c){                               c.setDisabled(true);                           });                       }                   }               },"xtype":"button","width":100,"style":"margin:5px","text":"Quitar"}],"defaultType":"textfield"}];

        Instance.defineWriterForm("portalConfigModel", formFields);
        
        return Ext.create('Ext.container.Container', {
            id: 'form-portalConfig',
            type: 'fit',
            align: 'stretch',
            items: [{
                itemId: 'formportalConfigItem',
                xtype: 'writerformportalConfigModel',
                title: 'Configuraci&oacute;n del Portal',
                border: false,
                width: '60%',
                minWidth: 300,
                listeners: {
                    saveConfig: function(form, data){
                        Instance.entityExtStore.saveConfig('portalConfig', data, function(configurationObjectRef, result){
                            
                            var formComponent= Ext.getCmp('form-'+configurationObjectRef).child('#form'+configurationObjectRef+'Item');
                            Instance.entityExtStore.upload(formComponent, configurationObjectRef, function(responseUpload){
                                Ext.MessageBox.alert('Status', responseUpload.message);
                                if(responseUpload.success){
                                    parentExtController.populateForm(configurationObjectRef, JSON.parse(responseUpload.data));
                                    parentExtController.formSavedResponse(result);
                                }
                            });
                            
                            
                        });
                    },
                    cancelConfig: function(form){
                        parentExtController.loadFormData('portalConfig');
                    },
                    render: function(panel) {
                        Instance.commonExtView.enableManagementTabHTMLEditor();
                    }
                }
            }],
            listeners:{
                activate: function(panel) {
                    parentExtController.loadFormData('portalConfig');
                }
            }
        });
    };
    
    function getFormContainercontactConfig(){
        var formFields= [{"allowBlank":false,"fieldLabel":"Nombre de Usuario","name":"userName"},{"allowBlank":false,"vtype":"email","fieldLabel":"Correo","name":"mail"},{"fieldLabel":"Celular","name":"cellPhone"},{"xtype":"textarea","fieldLabel":"Comentarios","name":"comments","height":200},{"layout":"anchor","xtype":"fieldset","fieldDefaults":{"labelAlign":"right","anchor":"100%"},"minWidth":300,"title":"Usuario","collapsible":true,"items":[{"allowBlank":false,"fieldLabel":"Nombre","name":"usuario.nombre"},{"allowBlank":false,"vtype":"email","fieldLabel":"Correo","name":"usuario.correo"},{"xtype":"numberfield","fieldLabel":"Telefono","name":"usuario.telefono"},{"xtype":"datefield","fieldLabel":"Fecha Registro","name":"usuario.fechaRegistro","format":"d/m/Y","tooltip":"Seleccione la fecha"},Instance.commonExtView.getSimpleCombobox('usuario.estado','Estado','form',['Active','Inactive','Locked','Deleted']),{"layout":"anchor","xtype":"fieldset","fieldDefaults":{"labelAlign":"right","anchor":"100%"},"minWidth":300,"title":"Rol","collapsible":true,"items":[{"allowBlank":false,"fieldLabel":"Nombre","name":"usuario.rol.nombre"},Instance.commonExtView.getSimpleCombobox('usuario.rol.estado','Estado','form',['Active','Inactive','Locked','Deleted']),{"itemTop":0,"layout":"anchor","xtype":"fieldset","fieldDefaults":{"labelAlign":"right","anchor":"100%"},"minWidth":300,"id":"usuario.rol.autorizaciones","title":"Autorizaciones:","collapsible":true,"items":[{"layout":"anchor","xtype":"fieldset","fieldDefaults":{"labelAlign":"right","anchor":"100%"},"id":"usuario.rol.autorizaciones[0]","title":"Item 0","collapsible":true,"items":[{"fieldLabel":"Nombre","name":"usuario.rol.autorizaciones[0].nombre"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"usuario.rol.autorizaciones[1]","title":"Item 1","collapsible":true,"items":[{"fieldLabel":"Nombre","name":"usuario.rol.autorizaciones[1].nombre"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"usuario.rol.autorizaciones[2]","title":"Item 2","collapsible":true,"items":[{"fieldLabel":"Nombre","name":"usuario.rol.autorizaciones[2].nombre"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"usuario.rol.autorizaciones[3]","title":"Item 3","collapsible":true,"items":[{"fieldLabel":"Nombre","name":"usuario.rol.autorizaciones[3].nombre"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"usuario.rol.autorizaciones[4]","title":"Item 4","collapsible":true,"items":[{"fieldLabel":"Nombre","name":"usuario.rol.autorizaciones[4].nombre"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"usuario.rol.autorizaciones[5]","title":"Item 5","collapsible":true,"items":[{"fieldLabel":"Nombre","name":"usuario.rol.autorizaciones[5].nombre"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"usuario.rol.autorizaciones[6]","title":"Item 6","collapsible":true,"items":[{"fieldLabel":"Nombre","name":"usuario.rol.autorizaciones[6].nombre"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"usuario.rol.autorizaciones[7]","title":"Item 7","collapsible":true,"items":[{"fieldLabel":"Nombre","name":"usuario.rol.autorizaciones[7].nombre"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"usuario.rol.autorizaciones[8]","title":"Item 8","collapsible":true,"items":[{"fieldLabel":"Nombre","name":"usuario.rol.autorizaciones[8].nombre"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"usuario.rol.autorizaciones[9]","title":"Item 9","collapsible":true,"items":[{"fieldLabel":"Nombre","name":"usuario.rol.autorizaciones[9].nombre"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"usuario.rol.autorizaciones[10]","title":"Item 10","collapsible":true,"items":[{"fieldLabel":"Nombre","name":"usuario.rol.autorizaciones[10].nombre"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"usuario.rol.autorizaciones[11]","title":"Item 11","collapsible":true,"items":[{"fieldLabel":"Nombre","name":"usuario.rol.autorizaciones[11].nombre"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"usuario.rol.autorizaciones[12]","title":"Item 12","collapsible":true,"items":[{"fieldLabel":"Nombre","name":"usuario.rol.autorizaciones[12].nombre"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"usuario.rol.autorizaciones[13]","title":"Item 13","collapsible":true,"items":[{"fieldLabel":"Nombre","name":"usuario.rol.autorizaciones[13].nombre"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"usuario.rol.autorizaciones[14]","title":"Item 14","collapsible":true,"items":[{"fieldLabel":"Nombre","name":"usuario.rol.autorizaciones[14].nombre"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"usuario.rol.autorizaciones[15]","title":"Item 15","collapsible":true,"items":[{"fieldLabel":"Nombre","name":"usuario.rol.autorizaciones[15].nombre"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"usuario.rol.autorizaciones[16]","title":"Item 16","collapsible":true,"items":[{"fieldLabel":"Nombre","name":"usuario.rol.autorizaciones[16].nombre"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"usuario.rol.autorizaciones[17]","title":"Item 17","collapsible":true,"items":[{"fieldLabel":"Nombre","name":"usuario.rol.autorizaciones[17].nombre"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"usuario.rol.autorizaciones[18]","title":"Item 18","collapsible":true,"items":[{"fieldLabel":"Nombre","name":"usuario.rol.autorizaciones[18].nombre"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"usuario.rol.autorizaciones[19]","title":"Item 19","collapsible":true,"items":[{"fieldLabel":"Nombre","name":"usuario.rol.autorizaciones[19].nombre"}],"defaultType":"textfield"},{"handler":function(){                   var itemsGroup= Ext.getCmp('usuario.rol.autorizaciones');                   if(itemsGroup.itemTop<19){                       itemsGroup.itemTop+= 1;                       var itemEntity= Ext.getCmp('usuario.rol.autorizaciones['+itemsGroup.itemTop+']');                       itemEntity.setVisible(true);                       itemEntity.setDisabled(false);                       if(itemEntity.query){                           itemEntity.query('.field').forEach(function(c){                             c.setDisabled(false);                           });                       }                   }               },"xtype":"button","width":100,"style":"margin:5px","text":"Agregar"},{"handler":function(){                   var itemsGroup= Ext.getCmp('usuario.rol.autorizaciones');                   if(itemsGroup.itemTop>=0){                       var itemEntity= Ext.getCmp('usuario.rol.autorizaciones['+itemsGroup.itemTop+']');                       itemsGroup.itemTop-= 1;                       itemEntity.setVisible(false);                       itemEntity.setDisabled(true);                       if(itemEntity.query){                           itemEntity.query('.field').forEach(function(c){                               c.setDisabled(true);                           });                       }                   }               },"xtype":"button","width":100,"style":"margin:5px","text":"Quitar"}],"defaultType":"textfield"}],"defaultType":"textfield"}],"defaultType":"textfield"},{"itemTop":0,"layout":"anchor","xtype":"fieldset","fieldDefaults":{"labelAlign":"right","anchor":"100%"},"minWidth":300,"id":"tags","title":"Tags:","collapsible":true,"items":[{"layout":"anchor","xtype":"fieldset","fieldDefaults":{"labelAlign":"right","anchor":"100%"},"id":"tags[0]","title":"Item 0","collapsible":true,"items":[{"xtype":"numberfield","fieldLabel":"Codigo","name":"tags[0].codigo"},Instance.commonExtView.getSimpleCombobox('tags[0].estado','Estado','form',['Active','Inactive','Locked','Deleted']),{"allowBlank":false,"fieldLabel":"Nombre","name":"tags[0].nombre"},{"xtype":"checkbox","uncheckedValue":"false","fieldLabel":"Visible","name":"tags[0].visible","inputValue":"true"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"tags[1]","title":"Item 1","collapsible":true,"items":[{"xtype":"numberfield","fieldLabel":"Codigo","name":"tags[1].codigo"},Instance.commonExtView.getSimpleCombobox('tags[1].estado','Estado','form',['Active','Inactive','Locked','Deleted']),{"allowBlank":false,"fieldLabel":"Nombre","name":"tags[1].nombre"},{"xtype":"checkbox","uncheckedValue":"false","fieldLabel":"Visible","name":"tags[1].visible","inputValue":"true"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"tags[2]","title":"Item 2","collapsible":true,"items":[{"xtype":"numberfield","fieldLabel":"Codigo","name":"tags[2].codigo"},Instance.commonExtView.getSimpleCombobox('tags[2].estado','Estado','form',['Active','Inactive','Locked','Deleted']),{"allowBlank":false,"fieldLabel":"Nombre","name":"tags[2].nombre"},{"xtype":"checkbox","uncheckedValue":"false","fieldLabel":"Visible","name":"tags[2].visible","inputValue":"true"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"tags[3]","title":"Item 3","collapsible":true,"items":[{"xtype":"numberfield","fieldLabel":"Codigo","name":"tags[3].codigo"},Instance.commonExtView.getSimpleCombobox('tags[3].estado','Estado','form',['Active','Inactive','Locked','Deleted']),{"allowBlank":false,"fieldLabel":"Nombre","name":"tags[3].nombre"},{"xtype":"checkbox","uncheckedValue":"false","fieldLabel":"Visible","name":"tags[3].visible","inputValue":"true"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"tags[4]","title":"Item 4","collapsible":true,"items":[{"xtype":"numberfield","fieldLabel":"Codigo","name":"tags[4].codigo"},Instance.commonExtView.getSimpleCombobox('tags[4].estado','Estado','form',['Active','Inactive','Locked','Deleted']),{"allowBlank":false,"fieldLabel":"Nombre","name":"tags[4].nombre"},{"xtype":"checkbox","uncheckedValue":"false","fieldLabel":"Visible","name":"tags[4].visible","inputValue":"true"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"tags[5]","title":"Item 5","collapsible":true,"items":[{"xtype":"numberfield","fieldLabel":"Codigo","name":"tags[5].codigo"},Instance.commonExtView.getSimpleCombobox('tags[5].estado','Estado','form',['Active','Inactive','Locked','Deleted']),{"allowBlank":false,"fieldLabel":"Nombre","name":"tags[5].nombre"},{"xtype":"checkbox","uncheckedValue":"false","fieldLabel":"Visible","name":"tags[5].visible","inputValue":"true"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"tags[6]","title":"Item 6","collapsible":true,"items":[{"xtype":"numberfield","fieldLabel":"Codigo","name":"tags[6].codigo"},Instance.commonExtView.getSimpleCombobox('tags[6].estado','Estado','form',['Active','Inactive','Locked','Deleted']),{"allowBlank":false,"fieldLabel":"Nombre","name":"tags[6].nombre"},{"xtype":"checkbox","uncheckedValue":"false","fieldLabel":"Visible","name":"tags[6].visible","inputValue":"true"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"tags[7]","title":"Item 7","collapsible":true,"items":[{"xtype":"numberfield","fieldLabel":"Codigo","name":"tags[7].codigo"},Instance.commonExtView.getSimpleCombobox('tags[7].estado','Estado','form',['Active','Inactive','Locked','Deleted']),{"allowBlank":false,"fieldLabel":"Nombre","name":"tags[7].nombre"},{"xtype":"checkbox","uncheckedValue":"false","fieldLabel":"Visible","name":"tags[7].visible","inputValue":"true"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"tags[8]","title":"Item 8","collapsible":true,"items":[{"xtype":"numberfield","fieldLabel":"Codigo","name":"tags[8].codigo"},Instance.commonExtView.getSimpleCombobox('tags[8].estado','Estado','form',['Active','Inactive','Locked','Deleted']),{"allowBlank":false,"fieldLabel":"Nombre","name":"tags[8].nombre"},{"xtype":"checkbox","uncheckedValue":"false","fieldLabel":"Visible","name":"tags[8].visible","inputValue":"true"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"tags[9]","title":"Item 9","collapsible":true,"items":[{"xtype":"numberfield","fieldLabel":"Codigo","name":"tags[9].codigo"},Instance.commonExtView.getSimpleCombobox('tags[9].estado','Estado','form',['Active','Inactive','Locked','Deleted']),{"allowBlank":false,"fieldLabel":"Nombre","name":"tags[9].nombre"},{"xtype":"checkbox","uncheckedValue":"false","fieldLabel":"Visible","name":"tags[9].visible","inputValue":"true"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"tags[10]","title":"Item 10","collapsible":true,"items":[{"xtype":"numberfield","fieldLabel":"Codigo","name":"tags[10].codigo"},Instance.commonExtView.getSimpleCombobox('tags[10].estado','Estado','form',['Active','Inactive','Locked','Deleted']),{"allowBlank":false,"fieldLabel":"Nombre","name":"tags[10].nombre"},{"xtype":"checkbox","uncheckedValue":"false","fieldLabel":"Visible","name":"tags[10].visible","inputValue":"true"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"tags[11]","title":"Item 11","collapsible":true,"items":[{"xtype":"numberfield","fieldLabel":"Codigo","name":"tags[11].codigo"},Instance.commonExtView.getSimpleCombobox('tags[11].estado','Estado','form',['Active','Inactive','Locked','Deleted']),{"allowBlank":false,"fieldLabel":"Nombre","name":"tags[11].nombre"},{"xtype":"checkbox","uncheckedValue":"false","fieldLabel":"Visible","name":"tags[11].visible","inputValue":"true"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"tags[12]","title":"Item 12","collapsible":true,"items":[{"xtype":"numberfield","fieldLabel":"Codigo","name":"tags[12].codigo"},Instance.commonExtView.getSimpleCombobox('tags[12].estado','Estado','form',['Active','Inactive','Locked','Deleted']),{"allowBlank":false,"fieldLabel":"Nombre","name":"tags[12].nombre"},{"xtype":"checkbox","uncheckedValue":"false","fieldLabel":"Visible","name":"tags[12].visible","inputValue":"true"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"tags[13]","title":"Item 13","collapsible":true,"items":[{"xtype":"numberfield","fieldLabel":"Codigo","name":"tags[13].codigo"},Instance.commonExtView.getSimpleCombobox('tags[13].estado','Estado','form',['Active','Inactive','Locked','Deleted']),{"allowBlank":false,"fieldLabel":"Nombre","name":"tags[13].nombre"},{"xtype":"checkbox","uncheckedValue":"false","fieldLabel":"Visible","name":"tags[13].visible","inputValue":"true"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"tags[14]","title":"Item 14","collapsible":true,"items":[{"xtype":"numberfield","fieldLabel":"Codigo","name":"tags[14].codigo"},Instance.commonExtView.getSimpleCombobox('tags[14].estado','Estado','form',['Active','Inactive','Locked','Deleted']),{"allowBlank":false,"fieldLabel":"Nombre","name":"tags[14].nombre"},{"xtype":"checkbox","uncheckedValue":"false","fieldLabel":"Visible","name":"tags[14].visible","inputValue":"true"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"tags[15]","title":"Item 15","collapsible":true,"items":[{"xtype":"numberfield","fieldLabel":"Codigo","name":"tags[15].codigo"},Instance.commonExtView.getSimpleCombobox('tags[15].estado','Estado','form',['Active','Inactive','Locked','Deleted']),{"allowBlank":false,"fieldLabel":"Nombre","name":"tags[15].nombre"},{"xtype":"checkbox","uncheckedValue":"false","fieldLabel":"Visible","name":"tags[15].visible","inputValue":"true"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"tags[16]","title":"Item 16","collapsible":true,"items":[{"xtype":"numberfield","fieldLabel":"Codigo","name":"tags[16].codigo"},Instance.commonExtView.getSimpleCombobox('tags[16].estado','Estado','form',['Active','Inactive','Locked','Deleted']),{"allowBlank":false,"fieldLabel":"Nombre","name":"tags[16].nombre"},{"xtype":"checkbox","uncheckedValue":"false","fieldLabel":"Visible","name":"tags[16].visible","inputValue":"true"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"tags[17]","title":"Item 17","collapsible":true,"items":[{"xtype":"numberfield","fieldLabel":"Codigo","name":"tags[17].codigo"},Instance.commonExtView.getSimpleCombobox('tags[17].estado','Estado','form',['Active','Inactive','Locked','Deleted']),{"allowBlank":false,"fieldLabel":"Nombre","name":"tags[17].nombre"},{"xtype":"checkbox","uncheckedValue":"false","fieldLabel":"Visible","name":"tags[17].visible","inputValue":"true"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"tags[18]","title":"Item 18","collapsible":true,"items":[{"xtype":"numberfield","fieldLabel":"Codigo","name":"tags[18].codigo"},Instance.commonExtView.getSimpleCombobox('tags[18].estado','Estado','form',['Active','Inactive','Locked','Deleted']),{"allowBlank":false,"fieldLabel":"Nombre","name":"tags[18].nombre"},{"xtype":"checkbox","uncheckedValue":"false","fieldLabel":"Visible","name":"tags[18].visible","inputValue":"true"}],"defaultType":"textfield"},{"layout":"anchor","xtype":"fieldset","hidden":true,"fieldDefaults":{"labelAlign":"right","anchor":"100%","disabled":true},"id":"tags[19]","title":"Item 19","collapsible":true,"items":[{"xtype":"numberfield","fieldLabel":"Codigo","name":"tags[19].codigo"},Instance.commonExtView.getSimpleCombobox('tags[19].estado','Estado','form',['Active','Inactive','Locked','Deleted']),{"allowBlank":false,"fieldLabel":"Nombre","name":"tags[19].nombre"},{"xtype":"checkbox","uncheckedValue":"false","fieldLabel":"Visible","name":"tags[19].visible","inputValue":"true"}],"defaultType":"textfield"},{"handler":function(){                   var itemsGroup= Ext.getCmp('tags');                   if(itemsGroup.itemTop<19){                       itemsGroup.itemTop+= 1;                       var itemEntity= Ext.getCmp('tags['+itemsGroup.itemTop+']');                       itemEntity.setVisible(true);                       itemEntity.setDisabled(false);                       if(itemEntity.query){                           itemEntity.query('.field').forEach(function(c){                             c.setDisabled(false);                           });                       }                   }               },"xtype":"button","width":100,"style":"margin:5px","text":"Agregar"},{"handler":function(){                   var itemsGroup= Ext.getCmp('tags');                   if(itemsGroup.itemTop>=0){                       var itemEntity= Ext.getCmp('tags['+itemsGroup.itemTop+']');                       itemsGroup.itemTop-= 1;                       itemEntity.setVisible(false);                       itemEntity.setDisabled(true);                       if(itemEntity.query){                           itemEntity.query('.field').forEach(function(c){                               c.setDisabled(true);                           });                       }                   }               },"xtype":"button","width":100,"style":"margin:5px","text":"Quitar"}],"defaultType":"textfield"}];

        Instance.defineWriterForm("contactConfigModel", formFields);
        
        return Ext.create('Ext.container.Container', {
            id: 'form-contactConfig',
            type: 'fit',
            align: 'stretch',
            items: [{
                itemId: 'formcontactConfigItem',
                xtype: 'writerformcontactConfigModel',
                title: 'Configuraci&oacute;n de Contacto',
                border: false,
                width: '60%',
                minWidth: 300,
                listeners: {
                    saveConfig: function(form, data){
                        Instance.entityExtStore.saveConfig('contactConfig', data, function(configurationObjectRef, result){
                            
                            
                            parentExtController.formSavedResponse(result);
                            
                        });
                    },
                    cancelConfig: function(form){
                        parentExtController.loadFormData('contactConfig');
                    },
                    render: function(panel) {
                        Instance.commonExtView.enableManagementTabHTMLEditor();
                    }
                }
            }],
            listeners:{
                activate: function(panel) {
                    parentExtController.loadFormData('contactConfig');
                }
            }
        });
    };
    
    
    Instance.defineWriterForm= function(modelName, fields){
        Ext.define('WriterForm'+modelName, {
            extend: 'Ext.form.Panel',
            alias: 'widget.writerform'+modelName,

            requires: ['Ext.form.field.Text'],

            initComponent: function(){
                //this.addEvents('create');
                
                var buttons= [];
                
                buttons= [{
                    itemId: 'save'+modelName,
                    text: 'Guardar',
                    scope: this,
                    handler: this.onSave
                }, {
                    //iconCls: 'icon-reset',
                    text: 'Cancelar',
                    scope: this,
                    handler: this.onCancel
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
                        anchor: '100%',
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
                this.getForm().reset();
                if (this.activeRecord) {
                    this.getForm().setValues(this.activeRecord.data);
                }
            },
                    
            getActiveRecord: function(){
                return this.activeRecord;
            },
            
            onSave: function(){
                var form = this.getForm();
                
                if (form.isValid()) {
                    this.fireEvent('saveConfig', this, form.getValues());
                }
            },
            
            onCancel: function(){
                this.fireEvent('cancelConfig', this);
            },
                    
            onSeeAll: function(){
                this.doLayout();
            }
    
        });
        
    };
    
    
    
    Instance.createMainView= function(){
        
        Instance.menuConfigurationObjects= getTreeMenuConfigurationObjects();
        

        Instance.tabsContainer= Ext.widget('tabpanel', {
            region: 'center',
            activeTab: 0,
            style: 'background-color:#dfe8f6; margin:0px',
            defaults: {bodyStyle: 'padding:15px', autoScroll:true},
            items:[
                
                {
                    title: 'Gestionar Objetos de Configuraci&oacute;n',
                    layout: 'border',
                    bodyStyle: 'padding:0px',
                    items:[
                        Instance.menuConfigurationObjects,
                        {
                            id: 'content-configurationObjects',
                            region: 'center',
                            layout: 'card',
                            margins: '0 0 0 0',
                            autoScroll: true,
                            activeItem: 0,
                            border: false,
                            items: [
                                
                                getFormContainerportalConfig(),
                                
                                getFormContainercontactConfig(),
                                
                            ]
                       }
                    ]
                },
                
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
        Instance.tabsContainer.getTabBar().hide();
        
        Instance.mainView= {
            id: Instance.id,
            title: 'Gestionar Configuraci&oacute;n General',
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

function GeneralConfigExtController(parentExtController, parentExtView){
    
    var Instance= this;
    
    Instance.id= "/generalConfig";
    
    Instance.modelName="GeneralConfigModel";
    
    Instance.services= {};
    
    var util= new Util();
    
    Instance.MAX_LIST_ITEMS= 20;
    
    // VIEWS *******************************************
    
    Instance.entityExtView= new GeneralConfigExtView(Instance, null);
    
    //*******************************************************
    
    
    Instance.init= function(){
        Instance.entityRef= "generalConfig";
        Instance.typeController= "";
        mvcExt.mappingController(Instance.id, Instance);
        Instance.initFilter();
    };
    
    Instance.initFilter= function(){
        Instance.filter={};
    };
    
    Instance.services.index= function(request){
        var configObj= util.getParameter(request,"configObj");
        Instance.loadFormData(configObj);
    };
    
    Instance.loadFormData= function(configObj){
        if(configObj!==""){
            Instance.entityExtView.entityExtStore.loadConfig(configObj, function(data){
                //Show Process
                Ext.getCmp('content-configurationObjects').layout.setActiveItem('form-'+configObj);
                
                //Populate Form
                Instance.populateForm(configObj, data);
            });
        }
    };
    
    Instance.populateForm= function(configObj, data){
        var record= Ext.create(configObj+"Model");
        record.data= util.unremakeJSONObject(data);
        var formComponent= Ext.getCmp('form-'+configObj).child('#form'+configObj+'Item');
        formComponent.setActiveRecord(record);

        Instance.showListItems(formComponent);
    };
    
    Instance.formSavedResponse= function(result){
        Ext.MessageBox.alert('Status', result.message);
    };
    
    Instance.showListItems= function(formComponent){
        formComponent.query('.fieldset').forEach(function(c){
            if(c.itemTop!==undefined){
                var itemsGroup=Ext.getCmp(c.id);
                for(var i=1; i<Instance.MAX_LIST_ITEMS; i++){
                    var itemEntity=Ext.getCmp(c.id+'['+i+']');
                    var filled= false;
                    if(itemEntity.query){
                        itemEntity.query('.field').forEach(function(c){
                            var text=c.getValue();
                            if(text!==null && text!=="" && text!==false){
                                filled=true;
                                c.setDisabled(false);
                            }
                        });
                    }else{
                        var text=itemEntity.getValue();
                        if(text!==null && text!=="" && text!==false){
                            filled=true;
                        }
                    }
                    if(filled){
                        itemEntity.setVisible(true);
                        itemEntity.setDisabled(false);
                        itemsGroup.itemTop=i;
                    }else{
                        itemEntity.setVisible(false);
                        itemEntity.setDisabled(true);
                    }
                }
            }
        });
    };

    Instance.init();
}
</script>
        
        <!-- ############################ IMPORT BASE ELEMENTES ################################### -->
        
        
<script>

function GeneralConfigExtViewport(){
    
    Ext.context= "";
    
    var Instance= this;
    
    var util= new Util();
    
    Instance.entityExtController= new GeneralConfigExtController(null, Instance);
    
    
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
        
        
        Instance.menuBar= Ext.create('Ext.toolbar.Toolbar', {
            region: 'north',
            items: [{"text":"Seguridad","menu":{"items":[{"text":"Gestionar Roles","href":"/vista/role/entity.htm"},{"text":"Gestionar Usuarios","href":"/vista/user/entity.htm"},{"text":"Gestionar Autorizaciones","href":"/vista/authorization/entity.htm"},{"text":"Gestionar Roles de Usuario","href":"/vista/userRole/entity.htm"},{"text":"Gestionar Recursos Web","href":"/vista/webResource/entity.htm"}]}},{"text":"Configuraci&oacute;n","menu":{"items":[{"text":"Gestionar Propiedades","href":"/vista/property/entity.htm"},{"text":"Gestionar Configuraci&oacute;n General","href":"/vista/generalConfig/configurationObject.htm"},{"text":"Mis datos","href":"/vista/myAccount/entity.htm"}]}},{"text":"Gestor de Contenidos","menu":{"items":[{"text":"Explorador de Archivos","href":"/vista/webFile/fileExplorer.htm"}]}},{"text":"Procesos","menu":{"items":[{"text":"Gestionar Servicios Externos","href":"/vista/externalService/process.htm"},{"text":"Gestionar Proceso Main Location","href":"/vista/processMainLocation/process.htm"},{"text":"Gestionar Procesos de Producto","href":"/vista/processProduct/process.htm"},{"text":"Gestionar Procesos de Ordenes de Compra","href":"/vista/processPurchaseOrder/process.htm"},{"text":"Gestionar Procesos de Usuario","href":"/vista/processUser/process.htm"}]}},{"text":"Correos","menu":{"items":[{"text":"Gestionar Plantillas de Correo","href":"/vista/mailTemplate/entity.htm"},{"text":"Gestionar Correos","href":"/vista/mail/entity.htm"}]}},{"text":"Comercios","menu":{"items":[{"text":"Gestionar Comercios","href":"/vista/commerce/entity.htm"},{"text":"Gestionar Ubicaciones Principales","href":"/vista/mainLocation/entity.htm"}]}},{"text":"Productos","menu":{"items":[{"text":"Gestionar Categorias","href":"/vista/category/entity.htm"},{"text":"Gestionar Productos","href":"/vista/product/entity.htm"},{"text":"Reporte de Productos","href":"/vista/product/report/reporteProductos.htm"}]}},{"text":"Pedidos","menu":{"items":[{"text":"Gestionar Ordenes de Inventario","href":"/vista/inventoryOrder/entity.htm"},{"text":"Gestionar Proveedores","href":"/vista/supplier/entity.htm"}]}},{"text":"Ordenes de Compra","menu":{"items":[{"text":"Gestionar Ordenes de Compra","href":"/vista/purchaseOrder/entity.htm"},{"text":"Mis Compras","href":"/vista/myShopping/entity.htm"}]}},{"text":"Pagos","menu":{"items":[{"text":"Gestionar Pagos","href":"/vista/payment/entity.htm"}]}},{"text":"Tablas Lead","menu":{"items":[{"text":"Gestionar Tablas Lead","href":"/vista/leadTable/entity.htm"}]}}]
        });
        
        
    };
    
    
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

            var homeExtViewport= new GeneralConfigExtViewport();

            homeExtViewport.renderViewport();

            //Debe ser siempre la ultima linea**************************
            mvcExt.setHomeRequest("/generalConfig");
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
        if(value){
            return "<a target='_blank' href='"+value+"'>"+value+"</a>";
        }else{
            return value;
        }
    };
    
    Instance.pdfRender= function(value, field){
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
        setTimeout(function(){
            var nvalue= document.getElementsByName(field.name)[0].value;
            var link= document.getElementById('link'+field.name);
            link.href=nvalue;
            var image= document.getElementById('image'+field.name);
            image.src=nvalue;
        },1000);
        return '<a id="link'+field.name+'" href="" target="_blank">'+
               '<img id="image'+field.name+'" style="max-width:150%" src=""></a>';
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
        var videoId= util.getParameter(value, "v");
        if(videoId!==""){
            try{
                setTimeout(function(){
                    document.getElementsByName(field.name)[0].value= value;
                },1000);
            }catch(e){
                console.log(e);
            }
            return '<a id="linkFile" href="'+value+'" target="_blank">'+value+'</a>'+
                   '<iframe width="528" height="287" src="https://www.youtube.com/embed/'+videoId+'" frameborder="0" allowfullscreen></iframe>';
        }else{
            return "";
        }
    };
    
    Instance.videoFileUploadRender= function(value, field) {
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
        try{
            setTimeout(function(){
                googleMaps.load(field.name, value);
            },1000);
        }catch(e){
            console.log(e);
        }
        return '<div class="googleMaps">'+
               '    <input id="'+field.name+'Address" type="text" size="50" placeholder="Bogot&aacute; Colombia" />'+
               '    <input type="button" value="Buscar" onclick="googleMaps.showAddress(\''+field.name+'\')" />'+
               '    <div id="'+field.name+'Map" style="width: 100%; height: 400px"></div>'+
               '</div>';
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
    <a href="/"><img src="/img/habitares.png" class="logoAdmin"></a>
    <h1>Administraci&oacute;n MERCANDO</h1>
    
    
        <a class="logout" onclick="userAuthentication.logout()" href="javascript:void(0)">&nbsp;Cerrar sesi&oacute;n&nbsp;</a>
        <a class="home" href="/account/home?redirect=user">&nbsp;Inicio&nbsp;</a>
        <p class="userSession"><b>lcastrillo</b> - Luis Alberto Castrillo</p>
    
</div>

    </body>
</html>

