<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="logo">
	<div id="tab">
		<ul id="tab-title">
			<li class="active"><a class="title" href="Home">ACCUEIL    </a></li>
			<li><a class="title" href="Activity">ACTIVITES </a></li>
			<li><a class="title" href="config.html">CALENDRIER </a></li>
		</ul>
	</div>
	<div class="connection-bar">
		<a class="sign-in" href="connection.jsp"
                   <c:if test="${login}">style="display:none"</c:if>>
                    Se connecter</a>
	</div>
</div>
