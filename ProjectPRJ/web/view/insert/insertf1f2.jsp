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
        <link href="../css/f1f2.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <table>
            <tr>
                <td><a href="../resident/listresident"><button>View resident infomation</button></a></td></tr>
            <tr>  <td><a href="../resident/searchresident"><button>Search resident infomation</button></a></td></tr>
            <tr>  <td><a href="../resident/listF1F2"><button>View list F1F2</button></a></td></tr>
            </table>
            <form action="insertf1f2" method="POST">          
                <table>
                    <tr><td><h3>Input F1/F2</h3></td></tr>
                <tr>
                    <td>ID</td>
                    <td> <input type="number" name="ID"/></td>  </tr>                   
                <tr>
                    <td>Quarantine Start Date</td>
                    <td> <input type="date" name="quarantineDate"/></td> 
                </tr>
                <tr>
                    <td></td>
                    <td> <input id="submit" type="submit" value="InsertF1/F2"/> </td>
                </tr>
        </table>
    </form>
</body>

</html>
