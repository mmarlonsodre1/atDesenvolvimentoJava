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
        <link rel="shortcut icon" href="../includes/img/favicon.ico" type="image/x-icon" />
        <title>Meu Condomínio</title>
        
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
        <div id="wrapper">
            <!-- Navbar e Menu -->
            <%@include file="menu.jsp" %>

            <div id="page-wrapper">
                <!-- /#page-wrapper -->
                <br>
                <div class="panel panel-default">
                    <div class="panel-heading"><i class="fa fa-car"></i> Edição de Veiculos </div>
                    <div class="panel-body">
                        <div class="row">
                            <form:form class="form" action="/salvarEdicaoVeiculo" modelAttribute="veiculo" name="formulario" method='post' id="formulario"> 
                                <div class="col-xs-12 col-lg-12">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="form-group col-xs-2 col-md-2 col-lg-2">
                                                <form:label path="placa">Placa</form:label>
                                                <form:input path="placa" id="placa" class="form-control" placeholder="Placa" value=""/>
                                            </div>   
                                            <div class="form-group col-xs-2 col-lg-2">
                                                <form:label class="control-label" path="marca">Marca</form:label>
                                                <form:select class="form-control" path="marca" id="marca">
                                                    <form:option value="">---</form:option>
                                                    <form:option value="Audi">Audi</form:option>
                                                    <form:option value="BMW">BMW</form:option>
                                                    <form:option value="CAOA Chery">CAOA Chery</form:option>
                                                    <form:option value="Chevrolet">Chevrolet</form:option>
                                                    <form:option value="Citroën">Citroën</form:option>
                                                    <form:option value="Fiat">Fiat</form:option>
                                                    <form:option value="Ford">Ford</form:option>
                                                    <form:option value="Honda">Honda</form:option>
                                                    <form:option value="Hyundai">Hyundai</form:option>
                                                    <form:option value="Iveco">Iveco</form:option>
                                                    <form:option value="JAC">JAC</form:option>
                                                    <form:option value="Jeep">Jeep</form:option>
                                                    <form:option value="Kia">Kia</form:option>
                                                    <form:option value="Land Rover">Land Rover</form:option>
                                                    <form:option value="Lifan">Lifan</form:option>
                                                    <form:option value="Mercedes-Benz">Mercedes-Benz</form:option>
                                                    <form:option value="Mitsubishi">Mitsubishi</form:option>
                                                    <form:option value="Nissan">Nissan</form:option>
                                                    <form:option value="Peugeot">Peugeot</form:option>
                                                    <form:option value="Renault">Renault</form:option>
                                                    <form:option value="Suzuki">Suzuki</form:option>
                                                    <form:option value="Toyota">Toyota</form:option>
                                                    <form:option value="Volkswagen">Volkswagen</form:option>
                                                </form:select>
                                            </div> 
                                            <div class="form-group col-xs-2 col-md-2 col-lg-2">
                                                <form:label path="modelo">Modelo</form:label>
                                                <form:input path="modelo" id="modelo" class="form-control" placeholder="Modelo" value=""/>
                                            </div>
                                            <div class="form-group col-xs-2 col-md-2 col-lg-2">
                                                <form:label path="ano">Ano</form:label>
                                                <form:input path="ano" id="ano" class="form-control" placeholder="Ano" value="" type="number"/>
                                            </div>
                                            <div class="form-group col-xs-2 col-md-2 col-lg-2">
                                                <form:label path="cor">Cor</form:label>
                                                <form:input path="cor" id="cor" class="form-control" placeholder="Cor" value=""/>
                                            </div>
                                            <div class="form-group col-xs-2 col-lg-2">
                                                <form:label class="control-label" path="id_unidade">Unidade</form:label>
                                                <form:select path="id_unidade" id="id_unidade" class="form-control">
                                                   <c:forEach items="${listUnidade}" var="unidade">        
                                                        <form:option value="${unidade.id}">${unidade.unidade}</form:option>
                                                    </c:forEach>                                                
                                                </form:select>
                                            </div> 
                                        </div>
                                        <!-- FIM LINHA -->
                                        <div class="row">
                                            <div class="form-group col-xs-3 col-lg-3">
                                                <button type="submit" id="submit" value="submit" class="btn btn-primary"> <i class="glyphicon glyphicon-ok"></i> Salvar </button>
                                            </div>                                   
                                        </div>    
                                    </div> <!-- DIV FORM GROUP-->
                                </div>  
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