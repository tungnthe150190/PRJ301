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
        <link href="../css/loginstyle.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <body>       
        <div class="container">          
            <div class="login-form">
                <a href="../view/menu/menu.jsp"><button>HOME</button></a><br/> 
                <br/>
                <div class="input-box">
                        <i ></i>
                        <a href="../resident/listresident"><button>View resident infomation</button></a><br/>
                        <br/><a href="../resident/searchresident"><button>Search resident infomation</button></a><br/>
                        <br/><a href="../resident/listF1F2"><button>View list F1F2</button></a>
                    </div>       
        <form action="insertf1f2" method="POST">  
            <h1>Insert F1/F2</h1>
            <div class="input-box">
                        <i ></i>
                      ID: <input type="number" name="ID"/>
                    </div>
            <div class="input-box">
                        <i ></i>
                      Quarantine Start Date: <input type="date" name="quarantineDate"/>
                    </div>
                    <div class="btn-box">
                        <button type="submit">
                            Insert F1/F2
                        </button>
                    </div>                                         
        </form>
            </div>
        </div>
    </body>

</html>
