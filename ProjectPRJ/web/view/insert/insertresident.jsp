<%-- 
    Document   : insertresident
    Created on : Oct 31, 2021, 11:17:32 PM
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
        <form action="insertresident" method="POST">
            ID: <input type="text" name="id"/> <br/>
            Apartment: <select name="apartmentID">
                <c:forEach items="${requestScope.aparts}" var="a">
                   <option value="${a.apartmentID} ">${a.apartmentID}</option>
                </c:forEach>
            </select>  </br>         
            Full Name: <input type="text" name="fullName"/> <br/>
            Date Of Birth: <input type="date" name="dob"/> <br/>
            Home Town: <input type="text" name="homeTown"/> <br/>
            Phone: <input type="text" name="phone"/> <br/>
            <h3>Vaccination</h3>
            First Injection: <input type="radio" checked="checked" name="firstInjection" value="Yes" /> Yes
            <input type="radio" name="firstInjection" value="No"  /> No <br/>
            First Injection Date: <input type="date" name="1stDate"/> <br/>
            Second Injection: <input type="radio" checked="checked" name="secondInjection" value="Yes" /> Yes
            <input type="radio" name="secondInjection" value="No" /> No <br/>
            Second Injection Date: <input type="date" name="2ndDate"/> <br/>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
