<%-- 
    Document   : searchresident
    Created on : Nov 2, 2021, 1:04:57 AM
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
        <form action="searchresident">
            Id : <input type="text" name="id" value="${requestScope.id}"/> <br/>
            Building <select name="buildID"> 
                <option value="-1">All</option>
                <c:forEach items="${requestScope.buildings}" var="b">
                    <option 
                        ${requestScope.buildID eq b.buildID ?"selected=\"selected\"":""}
                        value="${b.buildID}">${b.name}</option>
                </c:forEach> 
            </select>        
            <br/>
            Apartment <select name="apartmentID"> 
                <option value="">All</option>
                <c:forEach items="${requestScope.aparts}" var="a">
                    <option 
                        ${requestScope.apartmentID eq a.apartmentID ?"selected=\"selected\"":""}
                        value="${a.apartmentID}">${a.apartmentID}</option>
                </c:forEach> 
            </select>        
            <br/>
            Full Name : <input type="text" name="name" value="${requestScope.fullName}"/> <br/>
            Date Of Birth: <br/>
            From : <input type="date" value="${requestScope.from}" name="from"/> <br/>
            To : <input type="date" value="${requestScope.to}" name="to"/> <br/>
            Home Town : <input type="text" name="homeTown" value="${requestScope.homeTown}"/> <br/>
            Phone : <input type="text" name="phone" value="${requestScope.phone}"/> <br/>
            Vaccination : <br/>
            First Injection: 
            <input type="radio" name="firstInjection"
                   ${requestScope.firstInjection eq "Yes"?"checked=\"checked\"":""} 
                   value="Yes"/> Yes
            <input type="radio" name="firstInjection"
                   ${requestScope.firstInjection eq "No"?"checked=\"checked\"":""}
                   value="No"/> No
            <input type="radio" name="firstInjection" 
                   ${requestScope.firstInjection eq "all"?"checked=\"checked\"":""}
                   value="all"/> Both
            <br/>
            Second Injection: 
            <input type="radio" name="secondInjection"
                   ${requestScope.secondInjection eq "Yes"?"checked=\"checked\"":""} 
                   value="Yes"/> Yes
            <input type="radio" name="secondInjection"
                   ${requestScope.secondInjection eq "No"?"checked=\"checked\"":""}
                   value="No"/> No
            <input type="radio" name="secondInjection" 
                   ${requestScope.secondInjection eq "all"?"checked=\"checked\"":""}
                   value="all"/> Both
            <br/>
            <input type="submit" value="Search"/>  
        </form>
                   
        <table border="1px">
            <tr>
                <td>ID</td>
                <td>Apartment</td>
                <td>Building</td>
                <td>Fullname</td>
                <td>DateOfBirth</td>  
                <td>Home Town</td> 
                <td>Phone</td>
                <td>1st Injection</td>               
                <td>2nd Injection</td> 



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
                    <td>${r.vaccination.firstInjection?"Yes":"No"}</td>                   
                    <td>${r.vaccination.secondInjection?"Yes":"No"}</td>
 
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
