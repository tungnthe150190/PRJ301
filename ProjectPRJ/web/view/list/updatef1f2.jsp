<%-- 
    Document   : updatef1f2
    Created on : Nov 3, 2021, 5:24:39 PM
    Author     : Tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update list F1 F2</title>
    </head>
    <body>
        <h1>Update F1,F2</h1>
         <a href="../view/menu/menu.jsp"><button>HOME</button></a><br/> <br/>
        <form action="updatef1f2" method="POST">
            Resident ID: <input type="hidden" name="id" value="${requestScope.f1f2.ID}"/>${requestScope.f1f2.ID}<br/>
            Apartment: ${requestScope.f1f2.resident.apartment.apartmentID} <br/>
            Full Name: ${requestScope.f1f2.resident.fullName} <br/>
            Date Of Birth: ${requestScope.f1f2.resident.dob} <br/>
            Home Town: ${requestScope.f1f2.resident.homeTown} <br/>
            Phone: ${requestScope.f1f2.resident.phone} <br/>
            Quarantine Start Date: <input type="date" name="quarantineStartDate" value="${requestScope.f1f2.quarantineStartDate}"/> <br/>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
