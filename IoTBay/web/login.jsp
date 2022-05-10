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
        <%
            String existError = (String) session.getAttribute("existError");
            String emailError = (String) session.getAttribute("emailError");
            String passError = (String) session.getAttribute("passwordError");
            String inputError = (String) session.getAttribute("inputError");
        %>
        
        
        <h2>Enter your Login details below: </h2>
        
        <form action="LoginServlet" method="post">
            <label for="email">Email:</label><br>
            <input type="text" placeholder="Enter email" id="email" name="email"><br><br>
            
            <label for="passowrd">Password:</label><br>
            <input type="password" placeholder="Enter password" id="password" name="password"><br>
            <br>
            <input type="submit" value="login" />
        </form>
        
        <p> <%= (inputError != null ? inputError : "")%></p>
        <p> <%= (existError != null ? existError : "")%></p>
        <p> <%= (emailError != null ? emailError : "")%></p>
        <p> <%= (passError != null ? passError : "")%></p>
    </body>
</html>
