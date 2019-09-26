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
                    <table width="100%" class="table table-striped table-bordered table-hover display compact" id="grid">
                         <thead>
                             <tr>
                                 <th>ID</th>
                                 <th>Matricula</th>
                                 <th>Nome</th>
                                 <th>Email</th>
                                 <th>Evento</th>
                                 </tr>
                         </thead>
                         <tbody>
                             <c:forEach items="${listUsuarios}" var="usuario"> 
                                <tr>              
                                    <td class="odd gradeX" align="center" th:text="${usuario.id}">${usuario.id}</td>
                                    <td class="odd gradeX" align="center" th:text="${usuario.matricula}">${usuario.matricula}</td>
                                    <td class="odd gradeX" align="center" th:text="${usuario.nome}">${usuario.nome}</td>
                                    <td class="odd gradeX" align="center" th:text="${usuario.email}">${usuario.email}</td>
                                    <td class="odd gradeX" align="center">
                                       <a href="/editarUsuario/${usuario.id}">Edit</a>
                                       &nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                             </c:forEach>
                         </tbody>
                    </table>
                </div>
            </div>
        </div>
      
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    </body>
</html>