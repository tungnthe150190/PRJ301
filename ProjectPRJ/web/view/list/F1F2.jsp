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
        <script>
            function doUpdate(id) {
                window.location.href = "updatef1f2?id=" + id;
            }
            function doDelete(id)
            {
                var c = confirm("Are you sure?");
                if (c)
                {
                    window.location.href = "deletef1f2?id=" + id;
                }
            }
        </script>
    </head>
    <body>
        <h1>F1F2 Management</h1>
         <a href="../view/menu/menu.jsp"><button>HOME</button></a><br/> <br/>
        <div id="paggerTop" class="pagger"></div>
        <table border="1px">
            <tr align="center" valign="middle" height="30px">
                <th>ID</th>
                <th>Apartment</th>
                <th>Building</th>
                <th>Fullname</th>
                <th>DateOfBirth</th>
                <th>HomeTown</th> 
                <th>Phone</th>
                <th>QuarantineStartDate</th> 
                <th>NumberOfDaysQuarantine</th>
                <td></td>
                <td></td>
            </tr>
            <c:forEach items="${requestScope.listF1F2}" var="list">
                <tr align="center" valign="middle" height="30px">
                    <td>${list.ID}</td>
                    <td>${list.resident.apartment.apartmentID}</td>
                    <td>${list.resident.building.name}</td>
                    <td>${list.resident.fullName}</td>
                    <td>${list.resident.dob}</td>
                    <td>${list.resident.homeTown}</td>
                    <td>${list.resident.phone}</td>
                    <td>${list.quarantineStartDate}</td>
                    <td>${list.numberOfDays}</td>
                    <td> <input type="button" onclick="doUpdate(${list.ID});" value="Update"/></td>
                    <td>
                    <input type="button" onclick="doDelete(${list.ID});" value="Delete"/>
                </td>
                </tr>
            </c:forEach>
        </table>
        <div id="paggerBottom" class="pagger"></div>
        <script>
            createPagger('paggerTop',${requestScope.pageindex}, 2,${requestScope.totalpage}, "listF1F2");
            createPagger('paggerBottom',${requestScope.pageindex}, 2,${requestScope.totalpage}, "listF1F2");
        </script>
    </body>
</html>
