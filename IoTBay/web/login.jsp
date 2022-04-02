<%-- 
    Document   : login
    Created on : 23/03/2022, 2:28:53 PM
    Author     : Kleanthis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Portal</title>
                
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
    </head>
    <body>
        <h2>Enter your Login details below: </h2>
        
        <form action="welcome.jsp" method="post">
            <label for="email">Email:</label><br>
            <input type="text" id="email" name="email"><br><br>
            
            <label for="passowrd">Password:</label><br>
            <input type="password" id="password" name="password"><br>
            <br>
            <input type="submit" value="login" />
        </form>
    </body>
</html>
