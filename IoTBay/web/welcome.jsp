<%-- 
    Document   : welcome
    Created on : 16/03/2022, 2:10:55 PM
    Author     : Kleanthis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ page import="model.*"%>
        <% User user = new User();
        boolean isGuest = true;
        HttpSession mysession = request.getSession();
        %>
        <!-- put incoming details from POST into user object  -->
        <% user.setFName(request.getParameter("firstName")); %>
        <% user.setLName(request.getParameter("lastName")); %>
        <% user.setEmail(request.getParameter("email")); %>
        <% user.setPassword(request.getParameter("password")); %>
        <% if(user.getEmail() != null) isGuest = false;%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%if(!isGuest){%>
        <title>Welcome <%= user.getFName()%></title>
        <%} else{%>
        <title>Welcome Guest!</title>
        <%}%>
                
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
        
    </head>
    <body>
        <%if(isGuest){%>
        <div class="navBar">
            <a class="title" style>Home Page</a>
            <a href="login.jsp"> Login </a>
            <a href="register.jsp"> Register </a>       
        </div>
        <%}else{%>
        <div class="navBar">
            <a class="title" style>Home Page</a>
            <a href="logout.jsp"> Log Out</a>   
            <a href="welcome.jsp"> Home </a>
            <form action="CatalogueServlet" method="post">
            <input type="submit" value="Catalogue">
            </form>
        </div>
        <%}%>

        <%if(!isGuest){%>
        <p> Welcome <%= user.getFName()%> <%= user.getLName()%> </p>
        <p> Your email is: <%= user.getEmail() %> </p>
        <br>

        <%}else{%>
        <p> Welcome Guest!</p>
        <p> If you're a returning customer please <a href="login.jsp">log in.</a></p>
        <p> If you'd like to save your details please <a href="register.jsp">sign up.</a></p>
        <%}%>
    </body>
</html>
