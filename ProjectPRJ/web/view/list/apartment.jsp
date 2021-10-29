<%-- 
    Document   : apartment
    Created on : Oct 29, 2021, 12:36:14 AM
    Author     : Tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Apartment</title>
    </head>
    <body>
        <table border="1px">
            <tr>
                <td>ApartmentID</td>
                <td>Build</td>
                <td>AmountOfPeople</td>
            </tr>
            <c:forEach items="${requestScope.apartments}" var="a">
                <tr>
                    <td>${a.apartmentID}</td>
                    <td>${a.build.buildID}</td>
                    <td>${a.amountPeople}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
