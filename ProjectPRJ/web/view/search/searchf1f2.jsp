<%-- 
    Document   : searchf1f2
    Created on : Nov 4, 2021, 4:35:21 PM
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
    <body>
        <div class="container">
            <div class="login-form">
                <a href="../view/menu/menu.jsp"><button>HOME</button></a><br/> <br/>
                <form action="searchf1f2">
                    <h1>Search F1F2</h1>
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
                        Full Name : <input type="text" name="name" value="${requestScope.fullName}"/>
                    </div>                                               
                    <div class="input-box">
                        <i ></i>
                        Phone : <input type="text" name="phone" value="${requestScope.phone}"/>
                    </div>  
                    <div class="input-box">
                        <i ></i>
                        <h4>Quarantine Date:</h4><br/>
                        From : <input type="date" value="${requestScope.from}" name="from"/>

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
                            </tr>
                        </table> 

                    </div>   
                    <div class="btn-box">
                        <button type="submit">
                            Search
                        </button>
                    </div>
                </form>                              
            </div>
            <div id="paggerTop" class="pagger"></div>
            <table border="1px">
                <tr align="center" valign="middle" height="30px">
                    <th>ID</th>
                    <th>Apartment</th>
                    <th>Building</th>
                    <th>Full Name</th>                       
                    <th>Phone</th>
                    <th>QuarantineStartDate</th>
                    <th>NumberOfDaysQuarantine</th>
                    <th>1st Injection</th>               
                    <th>2nd Injection</th>
                    <td></td>
                    <td></td>



                </tr>
                <c:forEach items="${requestScope.results}" var="f">
                    <tr align="center" valign="middle" height="30px">
                        <td>${f.ID}</td>
                        <td>${f.resident.apartment.apartmentID}</td>
                        <td>${f.resident.building.name}</td>
                        <td>${f.resident.fullName}</td>                          
                        <td>${f.resident.phone}</td>
                        <td>${f.quarantineStartDate}</td>
                        <td>${f.numberOfDays}</td>
                        <td>${f.resident.vaccine.firstInjection?"Yes":"No"}</td>                   
                        <td>${f.resident.vaccine.secondInjection?"Yes":"No"}</td>
                        <td> <input type="button" onclick="doUpdate(${f.ID});" value="Update"/></td>
                    <td>
                    <input type="button" onclick="doDelete(${f.ID});" value="Delete"/>
                </td>

                    </tr>
                </c:forEach>
            </table>
            <div id="paggerBottom" class="pagger"></div>
             <script>
            createSearchPagger('paggerTop',${requestScope.pageindex}, 2,${requestScope.totalpage}, "searchf1f2","&id=${requestScope.id}&buildID=${requestScope.buildID}&apartmentID=${requestScope.apartmentID}&name=${requestScope.fullName}&phone=${requestScope.phone}&from=${requestScope.from}&firstInjection=${requestScope.firstInjection}&secondInjection=${requestScope.secondInjection}");
            createSearchPagger('paggerBottom',${requestScope.pageindex}, 2,${requestScope.totalpage}, "searchf1f2","&id=${requestScope.id}&buildID=${requestScope.buildID}&apartmentID=${requestScope.apartmentID}&name=${requestScope.fullName}&phone=${requestScope.phone}&from=${requestScope.from}&firstInjection=${requestScope.firstInjection}&secondInjection=${requestScope.secondInjection}");
        </script>
        </div>
    </body>
</html>
