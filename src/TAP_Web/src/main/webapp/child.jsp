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
        <div class="connection-title">
            <h4>Fiches Enfants</h4>
        </div>

        <div class="panel-tab">
            <div class="container-panel l-r">
                <div class="tab">
                  <button class="tablinks" onclick="openTab(event, 'London')">Théo</button>
                  <button class="tablinks" onclick="openTab(event, 'Paris')">Julie</button>
                  <c:forEach items="${children}" var="child">
                      <button class="tablinks" onclick="openTab(event, '${child.getIdChild()}')">${child.getFirstName()}</button>
                  </c:forEach>
                  <button class="tablinks" onclick="openTab(event, 'add-child')">Ajouter...</button>
                </div>

                <div id="London" class="tabcontent">
                  <h3>Théo</h3>
                  <p>London is the capital city of England.</p>
                </div>

                <div id="Paris" class="tabcontent">
                  <h3>Julie</h3>
                  <p>Paris is the capital of France.</p> 
                </div>
                  
                <c:forEach items="${children}" var="child">
                    <div id="${child.getIdChild()}" class="tabcontent">
                        <h3>Fiche Enfant</h3>
                            <form method="post" action="Child" accept-charset="UTF-8">
                                  <input type="text" class="form-control" name="surname" placeholder="${child.getName}">
                                  <input type="text" class="form-control" name="firstName" placeholder="${child.getFirstName}">
                                  <input type="date" class="form-control" name="birthdate">
                                  <div class="custom-select2">
                                        <p>Sexe : </p>
                                      <select name="gender" class="sources" >
                                          <option value="M" <c:if test="${child.getGender() == 'M'}">selected</c:if>>M</option>
                                              <option value="F">F</option>
                                      </select>
                                  </div>
                                  <div class="custom-select2">
                                    <p>Régime : </p>
                                    <select name="diet" class="sources" >
                                          <c:forEach items="${diets}" var="diet">
                                              <option value="${diet.getIdDiet()}" <c:if test="${child.getDiet() == diet.getIdDiet()}">selected</c:if>>${diet.getDescriptif()}</option>
                                          </c:forEach>
                                      </select>
                                  </div>
                                  <div class="custom-select2">
                                        <p>Classe : </p>
                                        <select name="level" class="sources" >
                                            <c:forEach items="${levels}" var="level">
                                                <option value="${level.getLevel()}" <c:if test="${child.getLevel() == level.getLevel()}">selected</c:if>>${level.getLevel()}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
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
                  <div class="panel" style="display:none">
                    <form method="post" action="Child" accept-charset="UTF-8">
                        <div class="input-child">
                          <input type="text" class="form-control" name="surname" placeholder="Nom de famille...">
                          <input type="text" class="form-control" name="firstName" placeholder="Prénom...">
                          <input type="date" class="form-control" name="birthdate">
                        </div>
                        <div class="custom-select2">
                              <p>Sexe : </p>
                            <select name="gender" class="sources" >
                                    <option value="M">M</option>
                                    <option value="F">F</option>
                            </select>
                        </div>
                          <div class="custom-select2">
                              <p>Régime : </p>
                            <select name="diet" class="sources" >
                                <c:forEach items="${diets}" var="diet">
                                    <option value="${diet.getIdDiet()}">${diet.getDescriptif()}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="custom-select2">
                            <p>Classe : </p>
                            <select name="level" class="sources" >
                                <c:forEach items="${levels}" var="level">
                                    <option value="${level.getLevel()}">${level.getLevel()}</option>
                                </c:forEach>
                            </select>
                        </div>
                          <div class="btn">
                            <input value="Ajouter" class="l-btn" type="submit" name="addChild">
                            <input type="hidden" name="action" value="addChild" />
                          </div>
                    </form>
                  </div>
                  <button class="accordion">Inscriptions</button>
                    <div class="panel" style="display:none">
                        <form method="post" action="Child" accept-charset="UTF-8">
                            <div id="input-garderie">
                                <input type="checkbox" name="nursery0" value="false">La garderie du matin : de 7h00 – 8h30<br>
                                <input type="checkbox" name="nursery1" value="false">Garderie du soir 1 : 15h45 – 16h30<br>
                                <input type="checkbox" name="nursery2" value="false">Garderie du soir 2 : 16h30 – 17h15<br>
                                <input type="checkbox" name="nursery3" value="false">Garderie du soir 3 : 17h15 – 18h00<br>
                            </div>
                            <div id="input-cafeteria">
                                <table>
                                    <tr>
                                        <th></th>
                                        <th>Lundi</th>
                                        <th>Mardi</th>
                                        <th>Mercredi</th>
                                        <th>Jeudi</th>
                                        <th>Vendredi</th>
                                    </tr>
                                    <tr>
                                        <td>Cantine</td>
                                        <td><input type="checkbox" name="cafeteria-mon" value="false"></td>
                                        <td><input type="checkbox" name="cafeteria-tue" value="false"></td>
                                        <td><input type="checkbox" name="cafeteria-wed" value="false"></td>
                                        <td><input type="checkbox" name="cafeteria-thu" value="false"></td>
                                        <td><input type="checkbox" name="cafeteria-fri" value="false"></td>
                                    </tr>
                                </table>
                            </div>
                      <table id="catalogue">
                            <tr class="accordion">
                                <th colspan="2">Basketball</th>
                                <th colspan="2">50€</th>
                            </tr>
                            <tr class="panel" style="display:none">
                                <td>Mardi</td>
                                <td>15h30/16h30</td>
                                <td>CP</td>
                                <td>
                                    <select name="wish" class="sources" >
                                        <option value="c1">- Choix -</option>
                                        <option value="c1">Vœux 1</option>
                                        <option value="c2">Vœux 2</option>
                                        <option value="c3">Vœux 3</option>
                                        <option value="c4">Vœux 4</option>
                                        <option value="c5">Vœux 5</option>
                                    </select>
                                </td>
                            </tr>
                            <tr class="panel" style="display:none">
                                <td>Lundi</td>
                                <td>15h30/16h30</td>
                                <td>CE1</td>
                                <td><select name="wish" class="sources" >
                                        <option value="c1">- Choix -</option>
                                        <option value="c1">Vœux 1</option>
                                        <option value="c2">Vœux 2</option>
                                        <option value="c3">Vœux 3</option>
                                        <option value="c4">Vœux 4</option>
                                        <option value="c5">Vœux 5</option>
                                    </select>
                                </td>
                            </tr>
                            <tr class="accordion">
                                <th colspan="2">Volleyball</th>
                                <th colspan="2">70€</th>
                            </tr>
                            <tr class="panel" style="display:none">
                                <td>Jeudi</td>
                                <td>15h30/16h30</td>
                                <td>CP</td>
                                <td><select name="wish" class="sources" >
                                        <option value="c0" selected="selected">- Choix -</option>
                                        <option value="c1">Vœux 1</option>
                                        <option value="c2">Vœux 2</option>
                                        <option value="c3">Vœux 3</option>
                                        <option value="c4">Vœux 4</option>
                                        <option value="c5">Vœux 5</option>
                                    </select>
                                </td>
                            </tr>
                            <c:forEach items="${activities}" var="activity">
                                <tr class="accordion">
                                    <th colspan="2">${activity.getName()}</th>
                                    <th colspan="2">${activity.getPrice()}</th>
                                </tr>
                                <c:forEach items="${groups}" var="group">
                                    <c:if test="${group.getActivity().getName().equals(activity.getName())}">
                                        <tr class="panel" style="display:none">
                                            <td>${group.getDayOfTheWeek()}</td>
                                            <td>${group.getStartTime()}/${group.getEndTime()}</td>
                                            <td>${group.toStringLevels()}</td>
                                            <td>
                                                <select name="${group.toStringWish()}">
                                                    <option value="0" selected>- Choix -</option>
                                                    <option value="1">Vœux 1</option>
                                                    <option value="2">Vœux 2</option>
                                                    <option value="3">Vœux 3</option>
                                                    <option value="4">Vœux 4</option>
                                                    <option value="5">Vœux 5</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                        </table>
                          <div class="btn">
                            <input value="Réserver" class="l-btn" type="submit" name="booking">
                            <input type="hidden" name="action" value="bookChild" />
                          </div>
                      </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="JS/content-tab.js"></script>
        <script src="JS/accordion.js"></script>
        <script src="JS/CustomSelect.js"></script>
    </body>
</html>
