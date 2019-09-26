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
        
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    </head>
    <body>
        <div class="container text-center">      
                <div class="login-panel panel panel-default"> 
                    <div class="panel-heading" align="middle">
                        <h3 class="panel-title">LOGIN</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" action="/login" modelAttribute="usuario" method="post">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="E-mail" name="email" type="email" required="true">
                                           </div>
                                           <div class="form-group">
                                           <input class="form-control" placeholder="Senha" name="senha" type="password" required="true">
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="submit" class="btn btn-lg btn-info btn-block" placeholder="Realizar Login">
                            </fieldset>
                        </form>
                    </div>
                </div>
        </div>
        
        <div class="container">      
                <div class="login-panel panel panel-default"> 
                    <div class="panel-heading" align="middle">
                        <h3 class="panel-title">CADASTRO</h3>
                    </div>
                    <div class="panel-body">
                        <form:form role="form" method="post" name="form_cadastro" action="/cadastro" modelAttribute="usuario">
                            <fieldset>
                                <div class="form-group">
                                    <form:input class="form-control" placeholder="Matricula" path="matricula" required="true"/>
                                </div>
                                <div class="form-group">
                                    <form:input class="form-control" placeholder="Nome" path="nome" required="true"/>
                                </div>
                                <div class="form-group">
                                    <form:input class="form-control" placeholder="E-mail" path="email" type="email" required="true"/>
                                </div>
                                <div class="form-group">
                                    <form:input class="form-control" placeholder="Senha" path="senha" type="password" required="true"/>
                                </div>
                                <div class="form-group">
                                    <form:label class="control-label" path="perfil_id">Perfil</form:label>
                                    <form:select path="perfil_id" id="perfil_id" onChange="showPerfil(this)" class="form-control">
                                        <form:option value="0">Selecione uma opção</form:option>
                                       <c:forEach items="${listPerfil}" var="perfil">        
                                            <form:option value="${perfil.id}">${perfil.nome}</form:option>
                                        </c:forEach>                                                
                                    </form:select>
                                </div>
                                <div class="form-group" id="titulacao" style="display: none">
                                    <input class="form-control" id="titulacao_var" placeholder="Titulação" name="titulacao"/>
                                </div>
                                <div class="form-group" id="datanasc" style="display: none">
                                    <input class="form-control" id="datanasc_var" placeholder="Dt Nascimento" name="datanasc"/>
                                </div>
                                <div class="form-group" id="curso" style="display: none">
                                    <label class="control-label" name="curso_id">Perfil</label>
                                    <select name="curso_id" class="form-control">
                                       <c:forEach items="${listCursos}" var="curso">        
                                            <option value="${curso.id}">${curso.nome}</option>
                                        </c:forEach>                                                
                                    </select>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="submit" class="btn btn-lg btn-info btn-block" id="cadastro_submit" disabled="disabled" placeholder="Realizar Cadastro">
                            </fieldset>
                        </form:form>
                    </div>
                </div>
        </div>
        
        <script type="text/javascript">
            function showPerfil(select){
                titulacao_var.value = null;
                datanasc_var.value = null;
                
                if(select.value == 2){
                    document.getElementById("titulacao").style.display = "block";
                    document.getElementById("datanasc").style.display = "none";
                    document.getElementById("curso").style.display = "none";                    
                    titulacao_var.required= true;
                    datanasc_var.required = false;
                    document.getElementById("cadastro_submit").disabled = false;
                } else if (select.value == 1){
                    document.getElementById("datanasc").style.display = "block";
                    document.getElementById("curso").style.display = "block";
                    document.getElementById("titulacao").style.display = "none";
                    datanasc_var.required = true;
                    titulacao_var.required = false;
                    document.getElementById("cadastro_submit").disabled = false;
                } else {
                    document.getElementById("datanasc").style.display = "none";
                    document.getElementById("titulacao").style.display = "none";
                    document.getElementById("curso").style.display = "none";
                    datanasc_var.required = false;
                    titulacao_var.required = false;
                    document.getElementById("cadastro_submit").disabled = true;
                }
            }
        </script>
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    </body>
</html>