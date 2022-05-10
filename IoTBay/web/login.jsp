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

        <link rel="stylesheet" href="stylesheet.css">
        <%
            String existError = (String) session.getAttribute("existError");
            String emailError = (String) session.getAttribute("emailError");
            String passError = (String) session.getAttribute("passwordError");
            String inputError = (String) session.getAttribute("inputError");
        %>
    </head>
    <body>
        <div class="navBar">
            <a class="title" style>Login</a>
            <a href="register.jsp"> Register </a>
            <a href="welcome.jsp"> Home </a>
        </div>
        
        <p> PENIS </p>
        
        <div class="container">
            <form action="LoginServlet" method="post">
                <label for="fname">Email:</label>
                <input type="text" id="email" name="email" placeholder="Your email..">

                <label for="lname">Password:</label>
                <input type="text" id="password" name="password" placeholder="Your password..">

                <input type="submit" value="Login">
            </form>
        </div>

        <p> <%= (inputError != null ? inputError : "")%></p>
        <p> <%= (existError != null ? existError : "")%></p>
        <p> <%= (emailError != null ? emailError : "")%></p>
        <p> <%= (passError != null ? passError : "")%></p>
    </body>
</html>
