<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>

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


    </head>
    <body>
        <header class="header">
		<script src="JS/jquery.js"></script>
                <%@include file="header.jsp"%>
        </header>

        <h4>Admin</h4>

        <div class="panel-tab">
            <div class="container-panel l-r">
                <div class="tab">
                  <button class="tablinks" onclick="openTab(event, 'add-act')">Ajouter...</button>
                  <button class="tablinks" onclick="openTab(event, 'set-cost')">Ajouter...</button>
                  <button class="tablinks" onclick="openTab(event, 'del-act')">Ajouter...</button>
                  <button class="tablinks" onclick="openTab(event, 'add-grp')">Ajouter...</button>
                  <button class="tablinks" onclick="openTab(event, 'del-grp')">Ajouter...</button>
                </div>

                <div id="add-act" class="tabcontent">
                  <h3>Ajouter une activité</h3>
                  <form method="post" action="Activity" accept-charset="UTF-8">
                        <input type="text" class="form-control" name="name" placeholder="Nom de l'activité...">
                        <input type="text" class="form-control" name="cost" placeholder="€...">
                        <div class="btn">
                          <input value="Ajouter" class="l-btn" type="submit" name="addAct">
                          <input type="hidden" name="action" value="addAct" />
                        </div>
                  </form>
                </div>
                <div id="add-grp" class="tabcontent">
                  <h3>Ajouter un Group</h3>
                  <form method="post" action="Group" accept-charset="UTF-8">
                        <input type="text" class="form-control" name="activity" placeholder="Nom de l'activité...">
                        <input type="text" class="form-control" name="days" placeholder="jours...">
                        <input type="text" class="form-control" name="start" placeholder="debut...">
                        <input type="text" class="form-control" name="end" placeholder="fin...">
                        <input type="text" class="form-control" name="enrol" placeholder="Enrollement...">
                        <div class="btn">
                          <input value="Ajouter" class="l-btn" type="submit" name="addGroup">
                          <input type="hidden" name="action" value="addGroup" />
                        </div>
                  </form>
                </div>
                <div id="del-act" class="tabcontent">
                  <h3>supprimer une activité</h3>
                  <form method="post" action="Activity" accept-charset="UTF-8">
                        <input type="text" class="form-control" name="id" placeholder="id de l'activité...">
                        <div class="btn">
                          <input value="Delete" class="l-btn" type="submit" name="delAct">
                          <input type="hidden" name="action" value="delAct" />
                        </div>
                  </form>
                </div>

                <div id="del-grp" class="tabcontent">
                  <h3>supprimer un groupe</h3>
                  <form method="post" action="Group" accept-charset="UTF-8">
                        <input type="text" class="form-control" name="id" placeholder="id du groupe...">
                        <div class="btn">
                          <input value="Delete" class="l-btn" type="submit" name="delGroup">
                          <input type="hidden" name="action" value="delGroup" />
                        </div>
                  </form>
                </div>

                <div id="set-cost" class="tabcontent">
                  <h3>modifier le cout d'une activité</h3>
                  <form method="post" action="Activity" accept-charset="UTF-8">
                        <input type="text" class="form-control" name="id" placeholder="id de l'activité...">
                        <input type="text" class="form-control" name="id" placeholder="nouveau prix...">
                        <div class="btn">
                          <input value="Set" class="l-btn" type="submit" name="setCost">
                          <input type="hidden" name="action" value="SetCost" />
                        </div>
                  </form>
                </div>


            </div>
        </div>
        <script src="JS/content-tab.js"></script>
    </body>
</html>
