<%-- 
    Document   : searchvaccine
    Created on : Nov 4, 2021, 4:35:11 PM
    Author     : Tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search vaccinated</title>
        <link href="../css/loginstyle.css" rel="stylesheet" type="text/css"/>
        <script src="../js/pagger.js" type="text/javascript"></script>
        <link href="../css/pagger.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="login-form">
                 <a href="../view/menu/menu.jsp"><button>HOME</button></a><br/> <br/>
                <form action="searchvaccine">
                    
                    <h1>Search Vaccine</h1>
                    <div class="input-box">
                        <i ></i>
                        Resident ID:<input type="text" name="id" value="${requestScope.id}"/>
                    </div>

                    <div class="input-box">
                        <i ></i>
                        Building: <select name="buildID"> 
                            <option value="-1">All</option>
                            <c:forEach items="${requestScope.buildings}" var="b">
                                <option 
                                    ${requestScope.buildID eq b.buildID ?"selected=\"selected\"":""}
                                    value="${b.buildID}">${b.name}</option>
                            </c:forEach> 
                        </select> 
                        Apartment: <select name="apartmentID"> 
                            <option value="">All</option>
                            <c:forEach items="${requestScope.aparts}" var="a">
                                <option 
                                    ${requestScope.apartmentID eq a.apartmentID ?"selected=\"selected\"":""}
                                    value="${a.apartmentID}">${a.apartmentID}</option>
                            </c:forEach> 
                        </select>
                    </div>
                    <div class="input-box">
                        <i ></i>
                        <h4>Vaccination:</h4><br/>                       
                        <table>
                            <tr>
                                <td></td>
                                <td> &ensp; Yes  </td>
                                <td> &ensp; No  </td>
                                <td> &ensp; Both  </td>
                                <td>&ensp;From</td>
                                <td>&ensp;To</td>
                            </tr>
                            <tr>
                                <td>First Injection </td>
                                <td><input type="radio" name="firstInjection"
                                           ${requestScope.firstInjection eq "Yes"?"checked=\"checked\"":""} 
                                           value="Yes"/></td>
                                <td><input type="radio" name="firstInjection"
                                           ${requestScope.firstInjection eq "No"?"checked=\"checked\"":""}
                                           value="No"/></td>
                                <td><input type="radio" name="firstInjection" 
                                           ${requestScope.firstInjection eq "all"?"checked=\"checked\"":""}
                                           value="all"/></td>
                                <td><input type="date" value="${requestScope.firstfrom}" name="firstfrom"/></td>
                                <td><input type="date" value="${requestScope.firstto}" name="firstto"/></td>
                            </tr>
                            <tr>                                
                                <td>Second Injection </td>
                                <td><input type="radio" name="secondInjection"
                                           ${requestScope.secondInjection eq "Yes"?"checked=\"checked\"":""} 
                                           value="Yes"/></td>
                                <td><input type="radio" name="secondInjection"
                                           ${requestScope.secondInjection eq "No"?"checked=\"checked\"":""}
                                           value="No"/></td>
                                <td><input type="radio" name="secondInjection" 
                                           ${requestScope.secondInjection eq "all"?"checked=\"checked\"":""}
                                           value="all"/></td>

                                <td><input type="date" value="${requestScope.secondfrom}" name="secondfrom"/></td>
                                <td><input type="date" value="${requestScope.secondto}" name="secondto"/></td>
                            </tr>
                        </table>                                        
                    </div>  
                    <div class="input-box">
                        <i ></i>
                        Full Name : <input type="text" name="name" value="${requestScope.fullName}"/>
                    </div>        
                    <div class="input-box">
                        <i ></i>
                        <h4>Date Of Birth:</h4><br/>
                        From : <input type="date" value="${requestScope.from}" name="from"/>
                        To : <input type="date" value="${requestScope.to}" name="to"/>
                    </div>
                    <div class="input-box">
                        <i ></i>
                        Home Town : <input type="text" name="homeTown" value="${requestScope.homeTown}"/>
                    </div>                          

                    <div class="btn-box">
                        <button type="submit">
                            Search
                        </button>
                    </div>
                </form>
            </div>
                    <div id="paggerTop" class="pagger"></div>
                    <table border="1" >
                <tr align="center" valign="middle" height="30px">
                    <th>ID</th>
                    <th>Apartment</th>
                    <th>Building</th>
                    <th>Fullname</th>
                    <th>DateOfBirth</th>  
                    <th>Home Town</th> 
                    <th>Phone</th>
                    <th>1st Injection</th>
                    <th>1st Injection Date</th> 
                    <th>2nd Injection</th> 
                    <th>2st Injection Date</th> 
                </tr>
                <c:forEach items="${requestScope.results}" var="r">
                    <tr align="center" valign="middle" height="30px">
                        <td>${r.ID}</td>
                        <td>${r.apartment.apartmentID}</td>
                        <td>${r.building.name}</td>
                        <td>${r.fullName}</td>
                        <td>${r.dob}</td>
                        <td>${r.homeTown}</td>
                        <td>${r.phone}</td>
                        <th>${r.vaccine.firstInjection?"Yes":"No"}</th>
                        <th>${r.vaccine.firstInjectionDate}</th>
                        <th>${r.vaccine.secondInjection?"Yes":"No"}</th>
                        <th>${r.vaccine.secondInjectionDate}</th>
                    </tr>
                </c:forEach>
            </table>
                    <div id="paggerBottom" class="pagger"></div>
<script>
            createSearchPagger('paggerTop',${requestScope.pageindex}, 2,${requestScope.totalpage}, "searchvaccine","&id=${requestScope.id}&buildID=${requestScope.buildID}&apartmentID=${requestScope.apartmentID}&firstInjection=${requestScope.firstInjection}&firstfrom=${requestScope.firstfrom}&firstto=${requestScope.firstto}&secondInjection=${requestScope.secondInjection}&secondfrom=${requestScope.secondfrom}&secondto=${requestScope.secondto}&name=${requestScope.fullName}&from=${requestScope.from}&to=${requestScope.to}&homeTown=${requestScope.homeTown}");
            createSearchPagger('paggerBottom',${requestScope.pageindex}, 2,${requestScope.totalpage}, "searchvaccine","&id=${requestScope.id}&buildID=${requestScope.buildID}&apartmentID=${requestScope.apartmentID}&firstInjection=${requestScope.firstInjection}&firstfrom=${requestScope.firstfrom}&firstto=${requestScope.firstto}&secondInjection=${requestScope.secondInjection}&secondfrom=${requestScope.secondfrom}&secondto=${requestScope.secondto}&name=${requestScope.fullName}&from=${requestScope.from}&to=${requestScope.to}&homeTown=${requestScope.homeTown}");
            
        </script>
        </div>     
    </body>
</html>
