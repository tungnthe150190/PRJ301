<%-- 
    Document   : building
    Created on : Oct 28, 2021, 11:53:00 PM
    Author     : Tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Building</title>
    </head>
    <body>
        <h1>Building Infomation</h1>
         <a href="../view/menu/menu.jsp"><button>HOME</button></a><br/> <br/>
        <table border="1px">
            <tr align="center" valign="middle" height="30px">
                <th>BuildID</th>
                <th>Name</th>
                <th>NumberOfFloors</th>
                <th>NumberOfPeople</th>
                <th>NumberF1F2</th>
            </tr>
            <c:forEach items="${requestScope.buildings}" var="b">
                <tr align="center" valign="middle" height="30px">
                <td>${b.buildID}</td>
                <td>${b.name}</td>
                <td>${b.numberOfFloors}</td>
                <td>${b.numberOfPeople}</td>
                <td>${b.numberOfF1F2}</td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>
