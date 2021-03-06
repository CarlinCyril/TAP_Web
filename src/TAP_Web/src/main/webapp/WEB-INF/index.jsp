<%-- 
    Document   : index
    Created on : 10 avr. 2018, 01:03:17
    Author     : cyrilcarlin
--%>

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
    
    </head>
            
    <body>
        <header class="header">
		<script src="JS/jquery.js"></script>
                <%@include file="/header.jsp"%>
        </header>
        <div class="home">
            <div class="title-home">
                <h2>Ecole de Super Héros</h2>
                <p>Gestion des activités périscolaires</p>
            </div>
        </div>
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
        <script src="JS/CustomSelect.js"></script>
    </body>
        

