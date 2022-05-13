<%-- 
    Document   : register
    Created on : 16/03/2022, 2:09:34 PM
    Author     : Kleanthis
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Tauri&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <body action='RegisterServlet'>
        <div class="navBar">
            <a class="title">Register</a>
            <a href="login.jsp"> Login </a>
            <a href="welcome.jsp"> Guest </a>         
        </div>
        <%
            //grab errors from session. Errors are populated in Servlet.
            ArrayList<String> errors = (ArrayList<String>) session.getAttribute("errors");
        %>
        <div class="login-container" style=" width: 35%">
            <form action="RegisterServlet" method="post">
                <label for="firstName">First Name:</label><br>
                <input type="text" id="firstName" name="firstName"><br>

                <label for="lastName">Last Name:</label><br>
                <input type="text" id="lastName" name="lastName"><br>
                
                <label for="birthday">Birthday:</label><br>
                <input type="date" id="birthday" name="birthday"><br>
                
                <label for="phoneNum">Phone Number:</label><br>
                <input type="text" id="phoneNum" name="phoneNum"><br>

                <label for="email">Email:</label><br>
                <input type="text" id="email" name="email"><br>

                <label for="password">Password:</label><br>
                <input type="password" id="password" name="password"><br>
                <br>
                <input type="submit" value="Register">

            </form>
            
            <%
                //if there are any errors, print a <p> for each of them.
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
