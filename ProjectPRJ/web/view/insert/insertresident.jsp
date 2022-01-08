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
        <link href="../css/loginstyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>       
        <div class="container">
            <div class="login-form">
                 <a href="../view/menu/menu.jsp"><button>HOME</button></a><br/> <br/>
                <form action="insertresident" method="POST">
                    <h1>Insert Resident</h1>
                    <div class="input-box">
                        <i ></i>
                        Resident ID:<input type="text" name="id"/>
                    </div>                                  
                    <div class="input-box">
                        <i ></i>                       
                        Apartment: <select name="apartmentID"> 
                            <option value="">All</option>
                            <c:forEach items="${requestScope.aparts}" var="a">
                                <option value="${a.apartmentID}">${a.apartmentID}</option>
                            </c:forEach> 
                        </select>
                    </div>
                    <div class="input-box">
                        <i ></i>
                        Full Name : <input type="text" name="name"/>
                    </div>        
                    <div class="input-box">
                        <i ></i>
                        Date Of Birth: <input type="date" name="dob"/>                                            
                    </div>
                    <div class="input-box">
                        <i ></i>
                        Home Town : <input type="text" name="homeTown"/>
                    </div>   
                    <div class="input-box">
                        <i ></i>
                        Phone : <input type="text" name="phone"/> <br/>
                    </div>      
                    <div class="input-box">
                        <i ></i>
                        <h4>Vaccination:</h4><br/>                       
                        <table>
                            <tr>
                                <td></td>
                                <td>&nbsp;Yes&nbsp;</td>
                                <td>&nbsp;No&nbsp;</td>                              
                                <td>&ensp;Injection Date</td>
                            </tr>  
                            <tr>
                                <td>First Injection</td>
                                <td><input type="radio" checked="checked" name="firstInjection" value="Yes" /></td>
                                <td><input type="radio" name="firstInjection" value="No"  /></td>                              
                                <td><input type="date" name="1stDate"/></td>
                            </tr>  
                            <tr>
                                <td>Second Injection</td>
                                <td><input type="radio" checked="checked" name="secondInjection" value="Yes" /></td>
                                <td><input type="radio" name="secondInjection" value="No" /></td>                              
                                <td><input type="date" name="2ndDate"/></td>
                            </tr> 
                        </table>
                    </div>   
                    <div class="btn-box">
                        <button type="submit">
                            Save
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
