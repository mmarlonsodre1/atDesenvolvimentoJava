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
                <div class="panel-body">
                    <form:form action="api/novaDisciplinaApi" modelAttribute="disciplina" method="post">
                        <div class="form-group">
                            <div class="form-group">
                                <form:label path="nome">Nome</form:label>
                                <form:input path="nome" class="form-control" placeholder="Nome" required = "true"/>
                            </div> 
                            <div class="form-group">
                                <form:label path="codigo">Código</form:label>
                                <form:input path="codigo" class="form-control" placeholder="Codigo" required = "true"/>
                            </div> 
                            <div class="form-group">
                                <form:label class="control-label" path="curso_id">Curso</form:label>
                                <form:select path="curso_id" id="curso_id" class="form-control">
                                    <c:forEach items="${listCursos}" var="curso">        
                                        <form:option value="${curso.id}">${curso.nome}</form:option>
                                    </c:forEach>
                                </form:select>
                            </div>
                            <input class="btn btn-lg btn-info btn-block" type="submit" value="Salvar Disciplina"/>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    </body>
</html>