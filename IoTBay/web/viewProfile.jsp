<%-- 
    Document   : viewProducts.jsp
    Created on : 10/05/2022, 4:33:50 PM
    Author     : alwin
--%>

<%@page import="model.User"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.CatalogueServlet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Tauri&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="styles.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
    </head>
    <body action="CatalogueServlet">

        <%
            ArrayList<Product> productList = (ArrayList<Product>) session.getAttribute("products");
            User user = (User) session.getAttribute("user");
            String searchError = (String) session.getAttribute("searchError");
            System.out.println(searchError);
            //grab errors from session. Errors are populated in Servlet.
            ArrayList<String> errors = (ArrayList<String>) session.getAttribute("errors");
            ArrayList<String> changed = (ArrayList<String>) session.getAttribute("changed");

        %>

        <div class="navBar">
            <a class="title">Profile</a>
            <%if (user.isGuest()) {%>
            <a href="login.jsp"> Login </a>
            <a href="welcome.jsp"> Home </a>
            <a href="CatalogueServlet"> Catalogue </a>
            <a href="PaymentServlet"> Payment </a>
            <a href="cart.jsp"> Cart </a>
            <%} else {%>
            <a href="logout.jsp"> Log Out</a>
            <a href="welcome.jsp"> Home </a>
            <a href="viewProfile.jsp"> Profile </a>
            <a href="CatalogueServlet"> Catalogue </a>
            <a href="PaymentServlet"> Payment </a>
            <a href="cart.jsp"> Cart </a>
            <%}%>
            <%if (user.isAdmin()) {%>
            <a href="UserServlet"> Manage Users </a>
            <%}%>
        </div>

        <div class="viewProfile">
            <form style="padding-bottom: 0px;" action="viewProfileServlet" method="post" autocomplete="off">
                <h2> Update Details: </h2>
                <label for="email">Email:</label><br>
                <input type="text" id="email" name="email" placeholder="Email Address" value="<%= user.getEmail()%>"><br>

                <label for="firstName">First Name:</label><br>
                <input type="text" id="firstName" name="firstName" placeholder="First Name" value="<%= user.getFName()%>"><br>

                <label for="lastName">Last Name:</label><br>
                <input type="text" id="lastName" name="lastName" placeholder="Last Name" value="<%= user.getLName()%>"><br>

                <label for="birthday">Birthday:</label><br>
                <input type="date" id="birthday" name="birthday" value="<%= user.getDOB()%>"><br>

                <label for="phoneNum">Phone Number:</label><br>
                <input type="text" id="phoneNum" name="phoneNum" placeholder="Phone Number" value="<%= user.getPhoneNum()%>"><br>

                <h3>Permissions:</h3>
                <p><%= user.getType()%></p>

                <h2> Change Password: </h2>
                <label for="password">Current Password:</label><br>
                <input type="password" id="password" name="password" placeholder="Current Password"><br>
                <label for="newPassword">New Password:</label><br>
                <input type="password" id="newPassword" name="newPassword" placeholder="New Password"><br>
                <label for="newPasswordConfirm">Confirm New Password:</label><br>
                <input type="password" id="newPasswordConfirm" name="newPasswordConfirm" placeholder="Confirm New Password"><br>
                <br>

                <input class="centerH" type="submit" value="Update Details">
            </form>
            <form style="padding-top: 0px;" action="viewProfileServlet" method="get">
                <input class="centerH" type="submit" value="Delete Account">
            </form>
            <form style="padding-top: 0px;" action="viewLogs.jsp" method="get">
                <input class="centerH" type="submit" value="View Logs">
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
                if (changed != null) {
                    for (String change : changed) {
            %>
            <p> <%= change%> </p>
            <%
                    }
                }%>
        </div>



    </body>
</html>