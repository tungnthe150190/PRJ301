<%-- 
    Document   : searchresident
    Created on : Nov 1, 2021, 8:41:16 PM
    Author     : Tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="searchresidentbyID">          
            ID: <input type="text" name="id"/> <br/>                         
            <input type="submit" value="Check infomation"/>
        </form>
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
            <c:forEach items="${requestScope.resident}" var="r">
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
    </body>
</html>
