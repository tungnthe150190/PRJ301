<%-- 
    Document   : resident
    Created on : Oct 29, 2021, 11:46:04 PM
    Author     : Tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Resident</title>
        <script src="../js/pagger.js" type="text/javascript"></script>
        <link href="../css/pagger.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
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
            </tr>
            <c:forEach items="${requestScope.residents}" var="r">
                <tr>
                    <td>${r.ID}</td>
                    <td>${r.apartment.apartmentID}</td>
                    <td>${r.building.name}</td>
                    <td>${r.fullName}</td>
                    <td>${r.dob}</td>
                    <td>${r.homeTown}</td>
                    <td>${r.phone}</td>
                </tr>
            </c:forEach>
        </table>
         <div id="paggerBottom" class="pagger"></div>
        <script>
            createPagger('paggerTop',${requestScope.pageindex},2,${requestScope.totalpage},"listresident");
            createPagger('paggerBottom',${requestScope.pageindex},2,${requestScope.totalpage},"listresident");
        </script>
    </body>
</html>
