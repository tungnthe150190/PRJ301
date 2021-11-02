<%-- 
    Document   : menu
    Created on : Oct 27, 2021, 2:53:26 PM
    Author     : Tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
        <link href="../../css/styplemenu.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            Welcome <h2>${requestScope.account.displayname}</h2>
            <h1>WEBSITE FOR POPULATION MANAGEMENT</h1>
            <img src="../../img/247551-maintainratio-w750-h1060-of-1-FFFFFF-ministry-health-poster_final.jpg" alt="5k"/></br>
            <a href="../../resident/listbuilding"><button>List Building</button></a></br>
            <a href="../../resident/listapartment"><button>List Apartment</button></a></br>
            <a href="../../resident/listresident"><button>List Resident</button></a></br>
            <a href="../../resident/listvaccine"><button>List Vaccinated</button></a></br>
            <a href="../../resident/listF1F2"><button>List F1,F2</button></a></br>

        </div>

    </body>
</html>
