<%-- 
    Document   : F1F2
    Created on : Oct 30, 2021, 10:57:25 AM
    Author     : Tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>F1F2 Management</title>
        <script src="../js/pagger.js" type="text/javascript"></script>
        <link href="../css/pagger.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>F1F2 Management</h1>
         <div id="paggerTop" class="pagger"></div>
        <table border="1px">
            <tr>
                <td>ID</td>
                <td>Apartment</td>
                <td>Building</td>
                <td>Fullname</td>
                <td>DateOfBirth</td>
                <td>HomeTown</td> 
                <td>Phone</td>
                <td>QuarantineStartDate</td> 
                <td>NumberOfDaysQuarantine</td>


            </tr>
            <c:forEach items="${requestScope.listF1F2}" var="list">
                <tr>
                    <td>${list.ID}</td>
                    <td>${list.apartment.apartmentID}</td>
                    <td>${list.building.name}</td>
                    <td>${list.resident.fullName}</td>
                    <td>${list.resident.dob}</td>
                    <td>${list.resident.homeTown}</td>
                    <td>${list.resident.phone}</td>
                    <td>${list.quarantineStartDate}</td>
                    <td>${list.numberOfDays}</td>
                </tr>
            </c:forEach>
        </table>
         <div id="paggerBottom" class="pagger"></div>
        <script>
            createPagger('paggerTop',${requestScope.pageindex},2,${requestScope.totalpage},"listF1F2");
            createPagger('paggerBottom',${requestScope.pageindex},2,${requestScope.totalpage},"listF1F2");
        </script>
    </body>
</html>