<%-- 
    Document   : logout
    Created on : 02/04/2022, 4:54:18 PM
    Author     : klean
--%>

<%@page import="model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete</title>

        <link rel="stylesheet" type="text/css" href="styles.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Tauri&display=swap" rel="stylesheet">

    </head>
    <body>    
        
        <%
        User user = (User) session.getAttribute("user");
        if(user == null){
            user = new User(); }
        %>
        
        <div class="navBar">
            <a class="title">Delete Account</a>
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
            <%if (user.isStaff()) {%>
            <a href="UserServlet"> Manage Users </a>
            <%}%>
        </div>
        <% if(!user.isGuest()){ %>
        <div class="index-container">
            <h1 align="center">Are you sure you want to delete your account?</h1>
            <h2 align="center">This cannot be undone</h2>
            <form action="DeleteProfileServlet" method="post">
                <input type="submit" value="Confirm">
            </form>
            <form action="DeleteProfileServlet" method="get">
                <input type="submit" value="Cancel">
            </form>
        </div>
        
        <%} else{%>
            <h1> Oops! You seem lost, <a href='index.jsp'>return to index.</a></h1>
        <%}%>
    </body>
</html>