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
            <c:if test="${login}">
		<a class="sign-in" href="Login?action=logOut">Se déconnecter</a>
            </c:if>
            <c:if test="${empty login || !login}">
                <a class="sign-in" href="connection.jsp">Se connecter</a>
            </c:if>
	</div>
</div>
