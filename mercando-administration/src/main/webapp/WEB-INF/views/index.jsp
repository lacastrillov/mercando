<%-- 
    Document   : index
    Created on : 6/10/2017, 11:25:16 AM
    Author     : grupot
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mercando :: Servicios REST</title>
        <script src="${pageContext.request.scheme}://${pageContext.request.serverName}:8080/ext-4.2.1/examples/shared/include-ext.js"></script>
        <script src="<%=request.getContextPath()%>/libjs/jquery/jquery-3.1.0.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath()%>/libjs/util/Util.js"></script>
        <script src="<%=request.getContextPath()%>/account/UserAuthentication"></script>
        <link href="/css/generic.css" rel="stylesheet" type="text/css">
        <link rel="icon" type="image/icon" href="/img/favicon.png" />
        <script>
            var userAuthentication = new UserAuthentication();
            
            function login(){
                userAuthentication.ajaxAuthenticate("ajaxFormLogin", function(data){
                    if(data.success){
                        $("#idUserInSession").val(data.user.id);
                        $("#userName").val(data.user.username);
                        $("#name").val(data.user.firstName+" "+data.user.lastName);
                        $("#userEmail").val(data.user.email);
                        $("#loginUserTable").hide();
                        $("#userInSessionTable").show();
                    }else{
                        alert(data.message);
                    }
                });
            }
            
            function logout(){
                userAuthentication.ajaxLogout(function(data){
                    $("#loginUserTable").show();
                    $("#userInSessionTable").hide();
                });
            }
            
        </script>
    </head>
    <body>
        <h1>Mercando :: Administraci&oacute;n</h1>
        <div class="content-wrapper">
            <div class="w-container">
                <div class="w-row">
                    <div class="w-hidden-small w-hidden-tiny w-col w-col-1"></div>
                    <div class="content-column w-col w-col-11">
                        <c:set var="userInfo" value="none" />
                        <sec:authorize access="isAuthenticated()">
                            <sec:authentication var="userSession" property="principal" />
                            <c:set var="userInfo" value="block" />
                        </sec:authorize>
                        <div id="userInSessionTable" class="post-wrapper" style="display: ${userInfo}">
                            <div class="loginDiv post-content">
                                <div class="body-copy w-richtext">
                                    <h1>Usuario en Sesi&oacute;n</h1>
                                </div>
                                <div class="form-wrapper w-form">
                                    <form id="formLogin" action="<c:url value='/account/ajax/authenticate'/>" method="post">
                                        <label>Usuario</label>
                                        <input id="userName" type="text" class="text-field w-input" value="${userSession.username}" maxlength="50" minlength="3" readonly />
                                        <label>Nombre</label>
                                        <input id="name" type="text" class="text-field w-input" value="${userSession.nombre} ${userSession.apellidos}" maxlength="50" minlength="3" readonly />
                                        <label>Correo</label>
                                        <input id="userEmail" type="text" class="text-field w-input" value="${userSession.user.email}" maxlength="50" minlength="3" readonly />
                                        
                                        <input value="Entrar" type="button" onclick="location.href='/account/home';" class="button w-button" />
                                        <input value="Cerrar sesi&oacute;n" type="button" onclick="logout()" class="button w-button" />
                                    </form>
                                </div>
                            </div>
                        </div>
                        
                        <c:set var="loginDiv" value="none" />
                        <sec:authorize access="isAnonymous()">
                            <c:set var="loginDiv" value="block: block" />
                        </sec:authorize>
                        <div id="loginUserTable" class="post-wrapper" style="display: ${loginDiv}">
                            <div class="loginDiv post-content">
                                <div class="body-copy w-richtext">
                                    <h1>Iniciar Sesi&oacute;n</h1>
                                </div>
                                <div class="form-wrapper w-form">
                                    <form id="ajaxFormLogin" action="<c:url value='/account/ajax/authenticate'/>" method="post">
                                        <label for="Name">Usuario</label>
                                        <input placeholder="usuario" id="j_username" type="text" class="text-field w-input" name="j_username" value="" maxlength="50" minlength="3" />
                                        <label for="Email">Contrase&ntilde;a</label>
                                        <input placeholder="* * * * * *" id="j_password" type="password" class="text-field w-input" name="j_password" value="" maxlength="50" minlength="3" />
                                        <input value="Ingresar" type="button" onclick="login()" class="button w-button" />
                                        <input value="&iquest;Olvidaste tu clave?" type="button" onclick="userAuthentication.changeForm('changePasswordDiv')" class="button w-button" />
                                    </form>

                                </div>
                            </div>
                            <div class="changePasswordDiv post-content" style="display: none">
                                <div class="body-copy w-richtext">
                                    <h1>Recuperar Contrase&ntilde;a</h1>

                                </div>
                                <div class="form-wrapper w-form">
                                    <form id="changePasswordForm" action="<%=request.getContextPath()%>/web/usuario/ajax/recuperarContrasena" method="post">
                                        <label for="Email">Email Address</label>
                                        <input id="correoElectronico" name="correoElectronico" type="text" class="text-field w-input" placeholder="Correo electr&oacute;nico" />
                                        <input value="Ingresar" type="button" onclick="userAuthentication.resetPassword();" class="button w-button" />
                                        <input value="Volver" type="button" onclick="userAuthentication.changeForm('loginDiv')" class="button w-button" />
                                    </form>

                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        
    </body>
</html>
