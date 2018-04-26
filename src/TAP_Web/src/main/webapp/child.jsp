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
                  <c:forEach items="${children}" var="child">
                      <button class="tablinks" onclick="openTab(event, '${child.getIdChild()}')">${child.getFirstName()}</button>
                  </c:forEach>
                  <button class="tablinks" onclick="openTab(event, 'add-child')">Ajouter...</button>
                </div>
                  
                <c:forEach items="${children}" var="child">
                    <div id="${child.getIdChild()}" class="tabcontent">
                        <h3>Fiche Enfant</h3>
                        <button class="accordion">Informations</button>
                        <div class="panel" style="display:none">
                            <form method="post" action="Child" accept-charset="UTF-8">
                                <div class="input-child">
                                    <input type="hidden" name="childID" value="${child.getIdChild()}">
                                  <input type="text" class="form-control" name="surname" value="${child.getName()}">
                                  <input type="text" class="form-control" name="firstName" value="${child.getFirstName()}">
                                  <input type="date" class="form-control" name="birthdate">
                                </div>
                                  <div class="custom-select2">
                                        <p>Sexe : </p>
                                      <select name="gender" class="sources" >
                                          <option value="M" <c:if test="${child.getGender() == 'M'}">selected</c:if>>M</option>
                                              <option value="F" <c:if test="${child.getGender() == 'F'}">selected</c:if>>F</option>
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
                    <button class="accordion">Inscriptions</button>
                    <div class="panel" style="display:none">
                    <c:set var="hasBooked" value="${not empty child.getReservation()}"/>
                        <form method="post" action="Child" accept-charset="UTF-8">
                            <div id="input-garderie">
                                <input type="checkbox" name="nursery0" value="true" <c:if test="${hasBooked && child.getReservation().checkNursery('nursery0')}">checked</c:if>>La garderie du matin : de 7h00 – 8h30<br>
                                <input type="checkbox" name="nursery1" value="true" <c:if test="${hasBooked && child.getReservation().checkNursery('nursery1')}">checked</c:if>>Garderie du soir 1 : 15h45 – 16h30<br>
                                <input type="checkbox" name="nursery2" value="true" <c:if test="${hasBooked && child.getReservation().checkNursery('nursery2')}">checked</c:if>>Garderie du soir 2 : 16h30 – 17h15<br>
                                <input type="checkbox" name="nursery3" value="true" <c:if test="${hasBooked && child.getReservation().checkNursery('nursery3')}">checked</c:if>>Garderie du soir 3 : 17h15 – 18h00<br>
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
                                        <td><input type="checkbox" name="cafeteria-mon" value="1" <c:if test="${hasBooked && child.getReservation().checkCafeteria(1)}">checked</c:if>></td>
                                        <td><input type="checkbox" name="cafeteria-tue" value="2" <c:if test="${hasBooked && child.getReservation().checkCafeteria(2)}">checked</c:if>></td>
                                        <td><input type="checkbox" name="cafeteria-wed" value="4" <c:if test="${hasBooked && child.getReservation().checkCafeteria(4)}">checked</c:if>></td>
                                        <td><input type="checkbox" name="cafeteria-thu" value="8" <c:if test="${hasBooked && child.getReservation().checkCafeteria(8)}">checked</c:if>></td>
                                        <td><input type="checkbox" name="cafeteria-fri" value="16" <c:if test="${hasBooked && child.getReservation().checkCafeteria(16)}">checked</c:if>></td>
                                    </tr>
                                </table>
                            </div>
                      <table id="catalogue">
                      <c:if test="${empty child.getReservation()}">
                            <c:forEach items="${activities}" var="activity">
                                <tr class="accordion">
                                    <th colspan="2">${activity.getName()}</th>
                                    <th colspan="2">${activity.getPrice()}€</th>
                                </tr>
                                <c:forEach items="${groups}" var="group">
                                    <c:if test="${group.getActivity().equals(activity.getID_Activity())}">
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
                        </c:if>
                      <c:if test="${not empty child.getReservation()}">
                          <c:forEach items="${activities}" var="activity">
                              <c:if test="${child.getReservation().checkActivity(activity.getID_Activity())}">
                                <tr class="accordion">
                                    <th colspan="2">${activity.getName()}</th>
                                    <th colspan="2">${activity.getPrice()}€</th>
                                </tr>
                                <c:forEach items="${groups}" var="group">
                                    <c:if test="${group.getActivity().equals(activity.getID_Activity()) && child.getReservation().checkGroup(group.getID_Group())}">
                                        <tr class="panel" style="display:none">
                                            <td>${group.getDayOfTheWeek()}</td>
                                            <td>${group.getStartTime()}/${group.getEndTime()}</td>
                                            <td>${group.toStringLevels()}</td>
                                            <td>
                                                <select name="${group.toStringWish()}">
                                                    <option value="0" selected>- Accepté(e) -</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                              </c:if>
                            </c:forEach>
                      </c:if>
                        </table>
                        <c:if test="${empty child.getReservation()}">
                          <div class="btn">
                            <input value="Réserver" class="l-btn" type="submit" name="booking">
                            <input type="hidden" name="childID" value="${child.getIdChild()}">
                            <input type="hidden" name="diet" value="${child.getDiet()}">
                            <input type="hidden" name="action" value="bookChild" />
                          </div>
                        </c:if>
                      </form>
                    </div>
                    </div>
                </c:forEach>
                    
                

                <div id="add-child" class="tabcontent">
                  <h3>Ajouter une fiche enfant</h3>
                  
                  
                    <form method="post" action="Child" accept-charset="UTF-8">
                        <div class="input-child">
                          <input type="text" class="form-control" name="surname" placeholder="Nom de famille...">
                          <input type="text" class="form-control" name="firstName" placeholder="Prénom...">
                          <input type="date" class="form-control" name="birthdate" placeholder="Date de naissance (aaaa-mm-jj)">
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
            </div>
        </div>
        <script src="JS/content-tab.js"></script>
        <script src="JS/accordion.js"></script>
        <script src="JS/CustomSelect.js"></script>
    </body>
</html>
