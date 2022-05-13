<%-- 
    Document   : login
    Created on : 23/03/2022, 2:28:53 PM
    Author     : Kleanthis
--%>

<%@page import="java.util.ArrayList"%>
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
            <a href="index.jsp"> Home </a>
        </div>

        <%
            //grab errors from session. Errors are populated in Servlet.
            ArrayList<String> errors = (ArrayList<String>) session.getAttribute("errors");
        %>
        <div class="login-container">
            <form action="LoginServlet" method="post">
                <label for="email">Email:</label>
                <input type="text" id="email" name="email" placeholder="Your email..">

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Your password..">

                <input type="submit" value="Login">
            </form>

            <%
                //if there are errors in the session, print a paragraph displaying each one.
                if (errors != null) {
                    for (String error : errors) {
            %>
            <p class="error"> <%= error%> </p>
            <%
                    }
                }
            %>

        </div>


    </body>
</html>
