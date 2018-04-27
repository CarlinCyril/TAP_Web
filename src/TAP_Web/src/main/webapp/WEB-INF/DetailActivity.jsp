<%-- 
    Document   : DetailActivity
    Created on : 11 avr. 2018, 00:25:01
    Author     : cyrilcarlin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600" rel="stylesheet">
	<link rel="stylesheet" href="CSS/reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="CSS/styleCal.css"> <!-- Resource style -->
    
    </head>
            
    <body>
        <header class="header">
		<script src="JS/jquery.js"></script>
                <%@include file="/header.jsp"%>
        </header>
        <div class='activity-title'>
            <h1>${activity.name}</h1>
        </div>
        <div class="cd-schedule loading">
            <div class="timeline">
		<ul>
			<li><span>10:00</span></li>
			<li><span>10:30</span></li>
			<li><span>11:00</span></li>
			<li><span>11:30</span></li>
			<li><span>12:00</span></li>
			<li><span>12:30</span></li>
			<li><span>13:00</span></li>
			<li><span>13:30</span></li>
			<li><span>14:00</span></li>
			<li><span>14:30</span></li>
			<li><span>15:00</span></li>
			<li><span>15:30</span></li>
			<li><span>16:00</span></li>
			<li><span>16:30</span></li>
			<li><span>17:00</span></li>
			<li><span>17:30</span></li>
			<li><span>18:00</span></li>
                        <li><span>19:00</span></li>
                        <li><span>20:00</span></li>
		</ul>
            </div> <!-- .timeline -->

            <div class="events">
		<ul>
			<li class="events-group">
				<div class="top-info"><span>Lundi</span></div>

				<ul>
                                    <c:forEach items="${mondayGroups}" var="group">
					<li class="single-event" data-start="${group.startTime}" data-end="${group.endTime}" data-content="event-abs-circuit" data-event="event-1">
						<a href="#0">
							<em class="event-name">{group.name}</em>
						</a>
					</li>
                                    </c:forEach>
				</ul>
			</li>

			<li class="events-group">
				<div class="top-info"><span>Mardi</span></div>

				<ul>
                                    <c:forEach items="${tuesdayGroups}" var="group">
					<li class="single-event" data-start="${group.startTime}" data-end="${group.endTime}" data-content="event-abs-circuit" data-event="event-1">
						<a href="#0">
							<em class="event-name">{group.name}</em>
						</a>
					</li>
                                    </c:forEach>
				</ul>
			</li>
                        <li class="events-group">
				<div class="top-info"><span>Mercredi</span></div>
                                <ul>
                                    <c:forEach items="${wednesdayGroups}" var="group">
					<li class="single-event" data-start="${group.startTime}" data-end="${group.endTime}" data-content="event-abs-circuit" data-event="event-1">
						<a href="#0">
							<em class="event-name">{group.name}</em>
						</a>
					</li>
                                    </c:forEach>
                                </ul>
                        </li>
                        <li class="events-group">
				<div class="top-info"><span>Jeudi</span></div>
                                <ul>
                                    <c:forEach items="${thursdayGroups}" var="group">
					<li class="single-event" data-start="${group.startTime}" data-end="${group.endTime}" data-content="event-abs-circuit" data-event="event-1">
						<a href="#0">
							<em class="event-name">{group.name}</em>
						</a>
					</li>
                                    </c:forEach>
                                </ul>
                        </li>
                        <li class="events-group">
				<div class="top-info"><span>Vendredi</span></div>
                                <ul>
                                    <c:forEach items="${fridayGroups}" var="group">
					<li class="single-event" data-start="${group.startTime}" data-end="${group.endTime}" data-content="event-abs-circuit" data-event="event-1">
						<a href="#0">
							<em class="event-name">{group.name}</em>
						</a>
					</li>
                                    </c:forEach>
                                </ul>
                        </li>
                </ul>
            </div>
        </div>
        <script src="JS/modernizr.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
        <script>
                if( !window.jQuery ) document.write('<script src="JS/jquery-3.0.0.min.js"><\/script>');
        </script>
        <script src="JS/main.js"></script> <!-- Resource jQuery -->
    </body>
</html>
