<%-- 
    Document   : parent
    Created on : 24 avr. 2018, 00:19:47
    Author     : cyrilcarlin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Parents</title>
        
        <link href="CSS/content-tab.css" rel="stylesheet" type="text/css">
        
        <!-- Bootstrap -->
        <link rel="stylesheet" href="CSS/bootstrap.css" />
        
        <!-- CSS Header -->
        <link rel="stylesheet" href="CSS/header.css" />
        
        <!-- CSS Style -->
        <link rel="stylesheet" href="CSS/Style.css" />
        
        <!-- CSS Home Index -->
        <link rel="stylesheet" href="CSS/Home.css" />
        
        <link rel="stylesheet" href="CSS/Connection.css" />
        
        <link rel="stylesheet" href="CSS/accordion.css" />
        
        
    </head>
    <body>
        <header class="header">
		<script src="JS/jquery.js"></script>
                <%@include file="/header.jsp"%>
        </header>
        <div class="connection-title">
            <h4>Fiches Parents</h4>
        </div>

        <div class="panel-tab">
            <div class="container-panel l-r">
                <div class="tab">
                  <c:forEach items="${parents}" var="parent">
                      <button class="tablinks" onclick="openTab(event, '${parent.getFirstname()}')">${parent.getFirstname()}</button>
                  </c:forEach>
                  <button class="tablinks" onclick="openTab(event, 'add-parent')">Ajouter...</button>
                </div>

                <c:forEach items="${parents}" var="parent">
                    <div id="${parent.getFirstname()}" class="tabcontent">
                    <h3>Fiche Parent</h3>
                        <form method="post" action="Parent" accept-charset="UTF-8">
                            <input type="hidden" name="parentID" value="${parent.getIdParents()}">
                              <input type="text" class="form-control" name="surname" value="${parent.getName()}">
                              <input type="text" class="form-control" name="firstName" value="${parent.getFirstname()}">
                              <input type="text" class="form-control" name="address" value="${parent.getAddress()}">
                              <input type="text" class="form-control" name="phone" value="${parent.getPhoneNumber()}">
                              <div class="btn">
                                <input value="Modifier" class="l-btn" type="submit" name="editParent">
                                <input type="hidden" name="action" value="editParent" />
                                <input type="hidden" name="parentID" value=${parent.getIdParents()} />
                              </div>
                        </form>
                    </div>
                </c:forEach>

                <div id="add-parent" class="tabcontent">
                  <h3>Ajouter une fiche parent</h3>
                  <form method="post" action="Parent" accept-charset="UTF-8">
                        <input type="text" class="form-control" name="surname" placeholder="Nom de famille...">
                        <input type="text" class="form-control" name="firstName" placeholder="Prénom...">
                        <input type="text" class="form-control" name="address" placeholder="Adresse...">
                        <input type="text" class="form-control" name="phone" placeholder="Téléphone...">
                        <div class="btn">
                          <input value="Ajouter" class="l-btn" type="submit" name="addParent">
                          <input type="hidden" name="action" value="addParent" />
                        </div>
                  </form>
                </div>
            </div>
        </div>
        <script src="JS/content-tab.js"></script>
        <script src="JS/accordion.js"></script>
        <script src="JS/CustomSelect.js"></script>
    </body>
</html>
