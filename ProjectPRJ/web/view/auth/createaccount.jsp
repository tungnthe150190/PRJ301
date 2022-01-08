<%-- 
    Document   : createaccount
    Created on : Nov 3, 2021, 9:37:57 PM
    Author     : Tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create account</title>
         <link href="css/loginstyle.css" rel="stylesheet" type="text/css"/>      
    </head>
    <body>
        <div class="container">
            <div class="login-form">
                <a href="view/menu/menu.jsp"><button>HOME</button></a><br/> <br/>
        <form action="createaccount" method="POST"> 
            <h1>Create Account</h1>
            <div class="input-box">
                        <i ></i>
                        <input type="text" name="username" placeholder="username">
                    </div>
                    <div class="input-box">
                        <i ></i>
                        <input type="password" name="password" placeholder="password">
                    </div>
            <div class="input-box">
                        <i ></i>
                        <input type="password" name="repassword" placeholder="re-password">
                    </div>
            <div class="input-box">
                        <i ></i>
                        <input type="text" name="displayname" placeholder="display name">
                    </div>
            <div class="input-box">
                        <i ></i>
                        Type Account: <select name="gid">
                <c:forEach items="${requestScope.groups}" var="g">
                   <option value="${g.gid}">${g.gname}</option>
                </c:forEach>
            </select>  
                    </div>
                    <div class="btn-box">
                        <button type="submit">
                            Create Account
                        </button>
                    </div>
        </form>
                </div>
            </div>
    </body>
</html>
