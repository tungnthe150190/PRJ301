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
        <table border="1px">
            <tr>
                <td>BuildID</td>
                <td>Name</td>
                <td>NumberOfFloors</td>
                <td>NumberOfPeople</td>
                <td>NumberF1F2</td>
            </tr>
            <c:forEach items="${requestScope.buildings}" var="b">
                <tr>
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
