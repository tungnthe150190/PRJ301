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
        <link href="css/stylelogin.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <form action="login" method="POST"> 
            <table>
                <tr>
                    <td>Username</td>
                    <td>
                        <input type="text" name="user" placeholder="Enter username">
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <input type="password" name="pass" placeholder="Enter password">
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input id="submit" type="submit" value="Login" />
                    </td>
                </tr>

            </table>
        </form>
    </body>
</html>
