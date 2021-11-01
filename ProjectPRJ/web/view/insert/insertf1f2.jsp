<%-- 
    Document   : insertf1f2
    Created on : Nov 1, 2021, 5:24:36 PM
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
        <form action="insertf1f2" method="POST">          
            ID: <input type="text" name="ID"/> <br/><br/>                    
            Quarantine Date: <input type="date" name="quarantineDate"/> <br/>
            <input type="submit" value="InsertF1/F2"/>
        </form>
    </body>
</html>
