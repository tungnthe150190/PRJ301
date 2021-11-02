<%-- 
    Document   : updateresident
    Created on : Nov 2, 2021, 11:15:56 PM
    Author     : Tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Resident Infomation</title>
        
    </head>
    <body>
        <form action="updateresident" method="POST">
            Resident ID: <input type="hidden" name="id" value="${requestScope.resident.ID}"/>${requestScope.resident.ID}<br/>
            Apartment: <select name="apartmentID">
                <c:forEach items="${requestScope.aparts}" var="a">
                    <option ${(a.apartmentID == requestScope.resident.apartment.apartmentID) ? "selected=\"selected\"" : ""} value="${a.apartmentID} ">${a.apartmentID}</option>
                </c:forEach>
            </select>  </br> 
            Full Name: <input type="text" name="fullName" value="${requestScope.resident.fullName}"/> <br/>
            Date Of Birth: <input type="date" name="dob" value="${requestScope.resident.dob}"/> <br/>
            Home Town: <input type="text" name="homeTown" value="${requestScope.resident.homeTown}"/> <br/>
            Phone: <input type="text" name="phone" value="${requestScope.resident.phone}"/> <br/>
            <h3>Vaccination</h3>
            First Injection: <input type="radio" ${(requestScope.resident.vaccine.firstInjection)?"checked=\"checked\"" : ""} name="firstInjection" value="Yes" /> Yes
            <input type="radio" ${(!requestScope.resident.vaccine.firstInjection)?"checked=\"checked\"" : ""} name="firstInjection" value="No"  /> No <br/>
            First Injection Date: <input type="date" name="1stDate" value="${requestScope.resident.vaccine.firstInjectionDate}"/> <br/>
            Second Injection: <input type="radio" ${(requestScope.resident.vaccine.secondInjection)?"checked=\"checked\"" : ""} name="secondInjection" value="Yes" /> Yes
            <input type="radio" ${(!requestScope.resident.vaccine.secondInjection)?"checked=\"checked\"" : ""} name="secondInjection" value="No"  /> No <br/>
            First Injection Date: <input type="date" name="2ndDate" value="${requestScope.resident.vaccine.secondInjectionDate}"/> <br/>
             
<!--            <input type="button" onclick="doUpdate(${requestScope.resident.ID});" value="Update"/>-->
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
