<%-- 
    Document   : child
    Created on : 24 avr. 2018, 00:19:47
    Author     : cyrilcarlin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Enfants</title>
        
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
		<script src="jquery.js"></script>
                <%@include file="header.jsp"%>
        </header>
        
        <h4>Fiches Enfants</h4>

        <div class="panel-tab">
            <div class="container-panel l-r">
                <div class="tab">
                  <button class="tablinks" onclick="openTab(event, 'London')">London</button>
                  <button class="tablinks" onclick="openTab(event, 'Paris')">Paris</button>
                  <c:forEach items="${children}" var="child">
                      <button class="tablinks" onclick="openTab(event, '${child.firstName}')">${child.firstName}</button>
                  </c:forEach>
                  <button class="tablinks" onclick="openTab(event, 'add-child')">Ajouter...</button>
                </div>

                <div id="London" class="tabcontent">
                  <h3>London</h3>
                  <p>London is the capital city of England.</p>
                </div>

                <div id="Paris" class="tabcontent">
                  <h3>Paris</h3>
                  <p>Paris is the capital of France.</p> 
                </div>
                  
                <c:forEach items="${children}" var="child">
                    <div id="Paris" class="tabcontent">
                        <h3>Fiche Enfant</h3>
                            <form method="post" action="Child" accept-charset="UTF-8">
                                  <input type="text" class="form-control" name="surname" placeholder="${child.name}">
                                  <input type="text" class="form-control" name="firstName" placeholder="${child.firstName}">
                                  <input type="date" class="form-control" name="birthdate">
                                  <input type="text" class="form-control" name="phone" placeholder="${child.phone}">
                                  <div class="btn">
                                    <input value="Modifier" class="l-btn" type="submit" name="editChild">
                                    <input type="hidden" name="action" value="editChild" />
                                  </div>
                            </form>
                    </div>
                </c:forEach>

                <div id="add-child" class="tabcontent">
                  <h3>Ajouter une fiche enfant</h3>
                  <button class="accordion">Informations</button>
                  <div class="panel">
                    <form method="post" action="Child" accept-charset="UTF-8">
                          <input type="text" class="form-control" name="surname" placeholder="Nom de famille...">
                          <input type="text" class="form-control" name="firstName" placeholder="Prénom...">
                          <input type="date" class="form-control" name="birthdate">
                          <input type="text" class="form-control" name="phone" placeholder="Téléphone...">
                          <div class="custom-select2">
                            <select name="Select Category" class="sources" >
                                    <option value="c1">Option 1</option>
                                    <option value="c2">Option 2</option>
                                    <option value="c3">Option 3</option>
                                    <option value="c4">Option 4</option>
                                    <option value="c5">Option 5</option>
                            </select>
                        </div>
                          <div class="btn">
                            <input value="Ajouter" class="l-btn" type="submit" name="addChild">
                            <input type="hidden" name="action" value="addChild" />
                          </div>
                    </form>
                  </div>
                  <button class="accordion">Inscriptions</button>
                    <div class="panel">
                      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                    </div>
                </div>
            </div>
        </div>
        <script src="JS/content-tab.js"></script>
        <script src="JS/accordion.js"></script>
        <script src="JS/CustomSelect.js"></script>
    </body>
</html>
