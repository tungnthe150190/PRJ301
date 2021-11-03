<%-- 
    Document   : login
    Created on : Oct 27, 2021, 2:31:36 PM
    Author     : Tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href="css/loginstyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>       
         <main>
        <div class="container">
            <div class="login-form">
        <form action="login" method="POST"> 
            <h1>Login</h1>
            <div class="input-box">
                        <i ></i>
                        <input type="text" name="user" placeholder="username">
                    </div>
                    <div class="input-box">
                        <i ></i>
                        <input type="password" name="pass" placeholder="password">
                    </div>
           
                    <div class="btn-box">
                        <button type="submit">
                            Login
                        </button>
                    </div>
        </form>
                </div>
            </div>
               </main>     
    </body>
</html>
