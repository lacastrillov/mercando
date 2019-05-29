/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
util.importJS('/libjs/util/Message.js');
util.importJS('/libjs/util/CommonExtView.js');
util.importJS('/admin/vista/user/ExtStore.htm?jsLib=1');

function UserClient() {

    var Instance = this;
    
    var message;
    
    var userExtStore;

    Instance.init = function () {
        $(document).ready(function () {
            message= new Message();
            userExtStore= new UserExtStore();
        });
    };
    
    Instance.registerValidate= function(){
        
        return true;
    };
    
    Instance.contactValidate= function(){
        
        return true;
    };
    
    Instance.registerUser= function(){
        if(Instance.registerValidate()){
            var data = {};
            $("#userRegistrationForm").serializeArray().map(function(x){data[x.name] = x.value;});
            userExtStore.doProcess("processClient", "registerUser", data, function(responseText){
                message.showMessage("Registro de usuario", JSON.parse(responseText).message);
                $('#userRegistrationForm').trigger("reset");
            });
        }
    };
    
    Instance.contactUser= function(){
        if(Instance.contactValidate()){
            var data = {};
            $("#userContactForm").serializeArray().map(function(x){data[x.name] = x.value;});
            userExtStore.doProcess("processClient", "contactUser", data, function(responseText){
                message.showMessage("Contacto de usuario", JSON.parse(responseText).message);
                $('#userContactForm').trigger("reset");
            });
        }
    };

    Instance.init();
}