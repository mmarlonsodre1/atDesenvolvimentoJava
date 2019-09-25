<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>AT DESENVOLVIMENTO</title>
        
        <c:url value="/vendor/bootstrap/css/bootstrap.min.css" var="bootstrap" />
        <c:url value="/vendor/metisMenu/metisMenu.min.css" var="metisMenu" />
        <c:url value="/vendor/sb-admin/css/sb-admin-2.css" var="css" />
        <c:url value="/vendor/font-awesome/css/font-awesome.min.css" var="font" />
        
        <link href="${bootstrap}" rel="stylesheet">
        <link href="${metisMenu}" rel="stylesheet">
        <link href="${css}" rel="stylesheet">
        <link href="${font}" rel="stylesheet" type="text/css">
        
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    </head>
    <body>
        <div class="container">      
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default"> 
                    <div class="panel-heading" align="middle">
                        <h3 class="panel-title">LOGIN</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" action="/login" modelAttribute="usuario" method="post">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="E-mail" name="email" type="text autofocus email">
                                           </div>
                                           <div class="form-group">
                                           <input class="form-control" placeholder="Senha" name="senha" type="password">
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="submit" class="btn btn-lg btn-info btn-block" placeholder="Realizar Login">
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="container">      
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default"> 
                    <div class="panel-heading" align="middle">
                        <h3 class="panel-title">CADASTRO</h3>
                    </div>
                    <div class="panel-body">
                        <form:form role="form" action="/cadastro" method="post" modelAttribute="usuario">
                            <fieldset>
                                <div class="form-group">
                                    <form:input class="form-control" placeholder="Matricula" path="matricula"/>
                                </div>
                                <div class="form-group">
                                    <form:input class="form-control" placeholder="Nome" path="nome"/>
                                </div>
                                <div class="form-group">
                                    <form:input class="form-control" placeholder="E-mail" path="email" type="email"/>
                                </div>
                                <div class="form-group">
                                    <form:input class="form-control" placeholder="Senha" path="senha" type="password"/>
                                </div>
                                <div class="form-group col-xs-2 col-lg-2">
                                                <form:label class="control-label" path="perfil_id">Perfil</form:label>
                                                <form:select path="perfil_id" id="perfil_id" class="form-control">
                                                   <c:forEach items="${listPerfil}" var="perfil">        
                                                        <form:option value="${perfil.id}">${perfil.nome}</form:option>
                                                    </c:forEach>                                                
                                                </form:select>
                                            </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="submit" class="btn btn-lg btn-info btn-block" placeholder="Realizar Cadastro">
                            </fieldset>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
        
        <c:url value="/vendor/jquery/jquery.min.js" var="jQuery" />
        <c:url value="/vendor/bootstrap/js/bootstrap.min.js" var="bootstrap" />
        <c:url value="/vendor/metisMenu/metisMenu.min.js" var="metisMenu" />
        <c:url value="/vendor/sb-admin/js/sb-admin-2.js" var="CSS" />
        <script src="${jQuery}"></script>
        <script src="${bootstrap}"></script>
        <script src="${metisMenu}"></script>
        <script src="${CSS}"></script>
    
    </body>
</html>