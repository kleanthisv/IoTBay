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
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Tauri&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="styles.css">

    </head>
    <body>
        <div class="navBar">
            <a class="title" style>Login</a>
            <a href="register.jsp"> Register </a>
            <a href="welcome.jsp"> Home </a>
        </div>

        <%
            String existError = (String) session.getAttribute("existError");
            String emailError = (String) session.getAttribute("emailError");
            String passError = (String) session.getAttribute("passwordError");
            String inputError = (String) session.getAttribute("inputError");
        %>
        <div class="container">
            <form action="LoginServlet" method="post">
                <label for="email">Email:</label>
                <input type="text" id="email" name="email" placeholder="Your email..">

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Your password..">

                <input type="submit" value="Login">
            </form>
            <p class="error"> <%= (inputError != null ? inputError : "")%></p>
            <p class="error"> <%= (existError != null ? existError : "")%></p>
            <p class="error"> <%= (emailError != null ? emailError : "")%></p>
            <p class="error"> <%= (passError != null ? passError : "")%></p>
        </div>


    </body>
</html>
