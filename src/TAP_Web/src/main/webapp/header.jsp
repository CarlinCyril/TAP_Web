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
			<li><a class="title" href="basket_test.jsp">CALENDRIER </a></li>
                        <c:if test="${sessionScope.login}">
                            <li><a class="title" href="Parent">PARENTS </a></li>
                        </c:if>
                        <c:if test="${sessionScope.login}">
                            <li><a class="title" href="Child">ENFANTS </a></li>
                        </c:if>
                        <c:if test="${sessionScope.admin && login}">
                        <li><a class="title" href="admin.jsp">ADMIN</a>
                        </c:if>
		</ul>
	</div>
</div>
