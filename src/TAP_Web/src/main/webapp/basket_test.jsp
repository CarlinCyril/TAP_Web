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
        
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600" rel="stylesheet">
	<link rel="stylesheet" href="CSS/reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="CSS/styleCal.css"> <!-- Resource style -->
    
    </head>
            
    <body>
        <header class="header">
		<script src="jquery.js"></script>
                <%@include file="header.jsp"%>
        </header>
        <div class='activity-title'>
            <h1>Basketball</h1>
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
				<div class="top-info"><span>Monday</span></div>

				<ul>
					<li class="single-event" data-start="17:30" data-end="18:30" data-content="event-abs-circuit" data-event="event-1">
						<a href="#0">
							<em class="event-name">Basketball CP/CE1</em>
						</a>
					</li>

					<li class="single-event" data-start="15:30" data-end="16:30" data-content="event-rowing-workout" data-event="event-2">
						<a href="#0">
							<em class="event-name">Basketball CM1/CM2</em>
						</a>
					</li>

					<li class="single-event" data-start="16:30" data-end="17:30"  data-content="event-yoga-1" data-event="event-3">
						<a href="#0">
							<em class="event-name">Basketball PS/MS/GS</em>
						</a>
					</li>
				</ul>
			</li>

			<li class="events-group">
				<div class="top-info"><span>Tuesday</span></div>

				<ul>
					<li class="single-event" data-start="15:30" data-end="16:30"  data-content="event-rowing-workout" data-event="event-2">
						<a href="#0">
							<em class="event-name">Basketball CE1/CE2</em>
						</a>
					</li>

					<li class="single-event" data-start="16:30" data-end="17:30"  data-content="event-restorative-yoga" data-event="event-4">
						<a href="#0">
							<em class="event-name">Basketball CM2</em>
						</a>
					</li>
				</ul>
			</li>
                        <li class="events-group">
				<div class="top-info"><span>Wednesday</span></div>
                                <ul></ul>
                        </li>
                        <li class="events-group">
				<div class="top-info"><span>Thursday</span></div>
                                <ul></ul>
                        </li>
                        <li class="events-group">
				<div class="top-info"><span>Friday</span></div>
                                <ul></ul>
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

