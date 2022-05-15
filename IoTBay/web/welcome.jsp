<%-- 
    Document   : welcome
    Created on : 16/03/2022, 2:10:55 PM
    Author     : Kleanthis
--%>

<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Tauri&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="styles.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        
        <%
        User user = (User) session.getAttribute("user");
        ArrayList<Product> cart = new ArrayList<Product>();
        session.setAttribute("cart",cart);
        if(user == null){
            user = new User();
        }
        %>
        
        <div class="navBar">
            <a class="title">Home Page</a>
            <%if (user.isGuest()) {%>
            <a href="login.jsp"> Login </a>
            <a href="welcome.jsp"> Home </a>
            <a href="CatalogueServlet"> Catalogue </a>
            <a href="PaymentManagement.jsp"> Payment </a>
            <a href="cart.jsp"> Cart </a>
            <%} else {%>
            <a href="logout.jsp"> Log Out</a>
            <a href="welcome.jsp"> Home </a>
            <a href="viewProfile.jsp"> Profile </a>
            <a href="CatalogueServlet"> Catalogue </a>
            <a href="PaymentManagement.jsp"> Payment </a>
            <a href="cart.jsp"> Cart </a>
            <%}%>
            <%if (user.isAdmin()) {%>
            <a href="UserServlet"> Manage Users </a>
            <%}%>
        </div>

        <p> Welcome <%= (user.getFName() != null ? user.getFName() : "")%> </p>
        <p> <%= (user.getEmail() != null ? "email: " + user.getEmail() : "")%> </p>
        <p> Your permissions are: <%= user.getType() %></p
        <br>
    </body>
</html>
