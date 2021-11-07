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
        <script>
            function doUpdate(id) {
                window.location.href = "updateresident?id=" + id;
            }
            function doDelete(id)
            {
                var c = confirm("Are you sure?");
                if (c)
                {
                    window.location.href = "deleteresident?id=" + id;
                }
            }

        </script>
    </head>
    <body>
        <h1>Resident Infomation</h1>
         <a href="../view/menu/menu.jsp"><button>HOME</button></a><br/> <br/>
        <div id="paggerTop" class="pagger"></div>
        <table border="1px">
            <tr align="center" valign="middle" height="30px">
                <th>ID</th>
                <th>Apartment</th>
                <th>Building</th>
                <th>Fullname</th>
                <th>DateOfBirth</th>  
                <th>Home Town</th> 
                <th>Phone</th>
                <th>Is F1/F2</th>
                <td></td>
                <td></td>
            </tr>
            <c:forEach items="${requestScope.residents}" var="r">
                <tr align="center" valign="middle" height="30px">
                    <td>${r.ID}</td>
                    <td>${r.apartment.apartmentID}</td>
                    <td>${r.building.name}</td>
                    <td>${r.fullName}</td>
                    <td>${r.dob}</td>
                    <td>${r.homeTown}</td>
                    <td>${r.phone}</td>
                    <td>${r.isF1F2?"Yes":"No"}</td>
                    <td>
                        <input type="button" onclick="doUpdate(${r.ID});" value="Update"/>
                    </td>
                    <td>
                        <input type="button" onclick="doDelete(${r.ID});" value="Delete"/>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div id="paggerBottom" class="pagger"></div>
        <script>
            createPagger('paggerTop',${requestScope.pageindex}, 2,${requestScope.totalpage}, "listresident");
            createPagger('paggerBottom',${requestScope.pageindex}, 2,${requestScope.totalpage}, "listresident");
        </script>
    </body>
</html>
