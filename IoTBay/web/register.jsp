<%-- 
    Document   : register
    Created on : 16/03/2022, 2:09:34 PM
    Author     : Kleanthis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
    </head>
    <body>
        <div class="navBar">
            <a class="title">Register</a>
            <a href="login.jsp"> Login </a>
            <a href="welcome.jsp"> Guest </a>         
        </div>
        
        
        <form action="RegisterServlet" method="post">
            <label for="firstName">First Name:</label><br>
            <input type="text" id="firstName" name="firstName"><br>
            
            <label for="lastName">Last Name:</label><br>
            <input type="text" id="lastName" name="lastName"><br>
            
            <label for="email">Email:</label><br>
            <input type="text" id="email" name="email"><br>
            
            <label for="password">Password:</label><br>
            <input type="password" id="password" name="password"><br>
            <br>
            <input type="submit" value="Register">
            
        </form>
        
    </body>
</html>
