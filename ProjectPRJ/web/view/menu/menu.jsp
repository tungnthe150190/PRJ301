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
        <link href="../../css/menustyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Ek+Mukta">
    </head>
    <body>        
        <div class="wrapper">
            <h1>WEBSITE FOR POPULATION MANAGEMENT</h1>
            <h4>Welcome, ${sessionScope.account.displayname}</h4>
            <nav class="menu">
                <ul class="clearfix">
                    <li><a href="menu.jsp">Trang chủ</a></li>
                    <li>
                        <a>Infomation <span class="arrow"></span></a>

                        <ul class="sub-menu">
                            <li><a href="../../resident/listbuilding">List Building</a></li>
                            <li><a href="../../resident/listapartment">List Apartment</a></li>
                            <li><a href="../../resident/listresident">List Resident</a></li>
                            <li><a href="../../resident/listvaccine">List Vaccinated</a></li>
                            <li><a href="../../resident/listF1F2">List Vaccinated</a></li>
                        </ul>
                    </li>
                    <li>
                        <a>Insert<span class="arrow"></span></a>
                        <ul class="sub-menu">
                            <li><a href="../../resident/insertresident">Insert Resident</a></li>
                            <li><a href="../../resident/insertf1f2">List Apartment</a></li>                   
                        </ul>
                    </li>                  
                    <li><a href="#">Liên hệ</a></li>
                </ul>
            </nav>
        </div>
    </body>
</html>
