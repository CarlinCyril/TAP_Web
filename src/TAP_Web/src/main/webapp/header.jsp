<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="logo">
	<div class="connection-bar">
            <c:if test="${login}">
		<a class="sign-in" href="Login?action=logOut">Se déconnecter</a>
            </c:if>
            <c:if test="${empty login || !login}">
                <a class="sign-in" href="connection.jsp">Se connecter</a>
            </c:if>
	</div>
        <div id="tab">
		<ul id="tab-title">
			<li class="active"><a class="title" href="Home">ACCUEIL    </a></li>
			<li><a class="title" href="Activity">ACTIVITES </a></li>
			<li><a class="title" href="config.html">CALENDRIER </a></li>
                        <c:if test="${login}">
                            <li><a class="title" href="parent.jsp">PARENTS </a></li>
                        </c:if>
                        <c:if test="${login}">
                            <li><a class="title" href="child.jsp">ENFANTS </a></li>
                        </c:if>
		</ul>
	</div>
</div>
