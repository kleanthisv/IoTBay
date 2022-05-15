<%-- 
    Document   : editUser
    Created on : 15/05/2022, 2:23:39 PM
    Author     : Richie
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
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
    <body action='EditUserServlet'>
        <div class="navBar">
            <a class="title">Edit User</a>
            <a href="logout.jsp"> Log Out</a>
            <a href="welcome.jsp"> Home </a>
            <a href="viewProfile.jsp"> Profile </a>
            <a href="CatalogueServlet"> Catalogue </a>
            <a href="manageUsers.jsp"> Manage Users </a>
        </div>
        <%
            User u = (User) session.getAttribute("userSelected");
            
            //grab errors from session. Errors are populated in Servlet.
            ArrayList<String> errors = (ArrayList<String>) session.getAttribute("editUserErrors");
        %>
        <div class="viewProfile" style=" width: 35%">
            <form action="EditUserServlet" method="post">
                <label for="firstName">First Name:</label><br>
                <input type="text" id="firstName" name="firstName" value="<%=(u.getFName())%>"><br>

                <label for="lastName">Last Name:</label><br>
                <input type="text" id="lastName" name="lastName" value="<%=(u.getLName())%>"><br>

                <label for="birthday">Birthday:</label><br>
                <input type="date" id="birthday" name="birthday" value="<%=(u.getDOB())%>"><br>

                <label for="phoneNum">Phone Number:</label><br>
                <input type="text" id="phoneNum" name="phoneNum" value="<%=(u.getPhoneNum())%>"><br>

                <label for="email">Email:</label><br>
                <input type="text" id="email" name="email" value="<%=(u.getEmail())%>"><br>

                <label for="password">Password:</label><br>
                <input type="password" id="password" name="password" value="<%=(u.getPassword())%>"><br>

                <label for="type">User Type</label>
                <br>
                <input type="radio" id="staff" name="type" value="ADMIN" 
                       <%if (u.isStaff()) {%>
                       checked="true"
                       <%}%>>
                <label for="staff">Staff</label>
                <br>
                <input type="radio" id="customer" name="type" value="CUSTOMER"
                       <%if (u.isCustomer()) { %>
                       checked="true"
                       <%}%>>
                <label for="customer">Customer</label>
                <br>

                <br>
                <input type="submit" value="Edit User">

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
