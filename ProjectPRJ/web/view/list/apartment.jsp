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
        <script src="../js/pagger.js" type="text/javascript"></script>
        <link href="../css/pagger.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
         <div id="paggerTop" class="pagger"></div>
        <table border="1px">
            <tr>
                <td>ApartmentID</td>
                <td>BuildID</td>
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
        <div id="paggerBottom" class="pagger"></div>
        <script>
            createPagger('paggerTop',${requestScope.pageindex},2,${requestScope.totalpage},"listapartment");
            createPagger('paggerBottom',${requestScope.pageindex},2,${requestScope.totalpage},"listapartment");
        </script>
    </body>
</html>
