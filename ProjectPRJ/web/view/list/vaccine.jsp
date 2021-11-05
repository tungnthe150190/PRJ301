<%-- 
    Document   : vaccine
    Created on : Oct 30, 2021, 2:05:28 AM
    Author     : Tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vaccination</title>
        <script src="../js/pagger.js" type="text/javascript"></script>
        <link href="../css/pagger.css" rel="stylesheet" type="text/css"/>
        <script>
            function doUpdate(id)
            {
                
                 window.location.href = "updateresident?id="+id;
             
            }
           
        </script>
    </head>
    <body>
        <h1>List of residents who have been vaccinated</h1>
         <a href="../view/menu/menu.jsp"><button>HOME</button></a><br/> <br/>
        <div id="paggerTop" class="pagger"></div>
        <table border="1px">
            <tr align="center" valign="middle" height="30px">
                <th>ID</th>
                <th>Apartment</th>
                <th>Building</th>
                <th>Fullname</th>
                <th>DateOfBirth</th>             
                <th>Phone</th>
                <th>1st Injection</th>
                <th>1st Date</th>
                <th>2nd Injection</th> 
                <th>2nd Date</th>
                <td></td>

            </tr>
            <c:forEach items="${requestScope.listVaccine}" var="list">
                <tr align="center" valign="middle" height="30px">
                    <td>${list.ID}</td>
                    <td>${list.resident.apartment.apartmentID}</td>
                    <td>${list.resident.building.name}</td>
                    <td>${list.resident.fullName}</td>
                    <td>${list.resident.dob}</td>
                    <td>${list.resident.phone}</td>
                    <td>${list.firstInjection?"Yes":"No"}</td>
                    <td>${list.firstInjectionDate}</td>
                    <td>${list.secondInjection?"Yes":"No"}</td>
                    <td>${list.secondInjectionDate}</td>
                    <td>
                        <input type="button" onclick="doUpdate(${list.ID});" value="Update"/>
                </td>
                </tr>
            </c:forEach>
        </table>
        <div id="paggerBottom" class="pagger"></div>
        <script>
            createPagger('paggerTop',${requestScope.pageindex}, 2,${requestScope.totalpage}, "listvaccine");
            createPagger('paggerBottom',${requestScope.pageindex}, 2,${requestScope.totalpage}, "listvaccine");
        </script>
    </body>
</html>
