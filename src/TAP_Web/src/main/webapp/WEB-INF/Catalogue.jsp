<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Ecole de super héros</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        
        <!-- Bootstrap -->
		<link rel="stylesheet" href="CSS/bootstrap.css" />
        
        <!-- CSS Header -->
        <link rel="stylesheet" href="CSS/header.css" />
        
        <!-- CSS Style -->
        <link rel="stylesheet" href="CSS/Style.css" />
        
        <!-- CSS Home Index -->
        <link rel="stylesheet" href="CSS/Home.css" />
        
        <!-- CSS Play Page -->
        <link rel="stylesheet" href="CSS/Catalogue.css" />
    </head>
    <body>
        <header class="header">
		<script src="jquery.js"></script>
		<%@include file="../header.jsp"%>
        </header>
        <div class="container">
                <div class="col-md-12 search-box">
                    <h4>Rechercher une activité</h4>
                    <div class="browse-box">
						<form class="form-inline">
							<div class="form-group">
                                                            <div class="custom-select">
								<select name="Select Category" class="sources" >
									<option value="c1">Option 1</option>
									<option value="c2">Option 2</option>
									<option value="c3">Option 3</option>
									<option value="c4">Option 4</option>
									<option value="c5">Option 5</option>
								</select>
                                                            </div>
							</div>
						  
							<div class="form-group">
                                                            <div class="custom-select">
								<select name="Select Category" class="sources" >
									<option value="c1">Option 1</option>
									<option value="c2">Option 2</option>
									<option value="c3">Option 3</option>
									<option value="c4">Option 4</option>
									<option value="c5">Option 5</option>
								</select>
                                                            </div>
                                                        </div>
						  
							<div class="form-group">
								<span style="color: white;">OR</span>
							</div>
							
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Nom de l'activité...">
							</div>
							
							<div class="form-group">
								<a href="#" class="search-btn">Search</a>
							</div>
						  
						</form>
					</div>
                </div>
            </div>
        <table id="catalogue">
            <tr onClick="window.location.href = 'basket_test.jsp';">
                <th>Basketball</th>
                <th>CP/CE1</th>
                <th>50€</th>
            </tr>
            <tr>
                <th>Volleyball</th>
                <th>CM1/CM2</th>
                <th>70€</th>
            </tr>
            <c:forEach items="${activities}" var="activity">
                <tr onclick="Activity?action=getDetailActivity&activityName=${activity.name}">
                    <th>${activity.name}</th>
                    <th>${activity.levels}</th>
                    <th>${activity.price}</th>
                </tr>
            </c:forEach>
        </table>
        <script src="JS/CustomSelect.js"></script>
    </body>
</html>
