<%-- 
    Document   : connection
    Created on : 10 avr. 2018, 00:14:33
    Author     : cyrilcarlin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        
        <title>Connection</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
            
        <!-- Bootstrap -->
        <link rel="stylesheet" href="CSS/bootstrap.css" />
        
        <!-- CSS Header -->
        <link rel="stylesheet" href="CSS/header.css" />
        
        <!-- CSS Style -->
        <link rel="stylesheet" href="CSS/Style.css" />
        
        <!-- CSS Connection Page -->
        <link rel="stylesheet" href="CSS/Connection.css" />
        
        
    </head>
    <body>
        <header class="header">
            <script src="jquery.js"></script>
            <%@include file="header.jsp"%>
        </header>
        <div>
            <div class="connection-title">
                <h4>Accéder à son espace personnel </h4>
            </div>
            <div class="panel-frame">
            	<div class="l-r">
                    <div class="container">
                        <div class="col-md-6 login">
                            <h3>Se Connecter</h3>
                            <form method="post" action="Login" accept-charset="UTF-8">
                                <input type="text" class="form-control" name="login" placeholder="Nom d'utilisateur...">
                                <input type="password" class="form-control" name="password" placeholder="Mot de passe...">
                                <c:if test="${(not empty login) && (!login)}" >
                                    <h5 style="color: red;margin: 0;">Identifiants incorrects</h5>
                                </c:if>
                                <div class="btn">
                                    <input value="Se connecter" class="l-btn" type="submit" name="login">
                                    <input type="hidden" name="action" value="logIn" />
                                </div>
                                <div class="r-txt">Identifiants <a href="#">oubliés</a>?
                                </div>
                            </form>
                        </div>		
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
