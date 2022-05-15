<%-- 
    Document   : addUser
    Created on : 15/05/2022, 1:07:25 AM
    Author     : Richie
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add User</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Tauri&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <body action='AddUserServlet'>
        <div class="navBar">
            <a class="title">Add User</a>
            <a href="logout.jsp"> Log Out</a>
            <a href="welcome.jsp"> Home </a>
            <a href="viewProfile.jsp"> Profile </a>
            <a href="CatalogueServlet"> Catalogue </a>
            <a href="manageUsers.jsp"> Manage Users </a>
        </div>
        <%
            //grab errors from session. Errors are populated in Servlet.
            ArrayList<String> errors = (ArrayList<String>) session.getAttribute("errors");
        %>
        <div class="viewProfile" style=" width: 35%">
            <form action="AddUserServlet" method="post">
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
                
                <label for="type">User Type</label>
                <br>
                <input type="radio" id="staff" name="type" value="ADMIN">
                <label for="staff">Staff</label>
                <br>
                <input type="radio" id="customer" name="type" value="CUSTOMER">
                <label for="customer">Customer</label>
                <br>
                
                <br>
                <input type="submit" value="Add User">

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
