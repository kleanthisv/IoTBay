<%-- 
    Document   : welcome
    Created on : 16/03/2022, 2:10:55 PM
    Author     : Kleanthis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ page import="model.*"%>
        <% User user = new User();%>
        <% boolean isGuest = true;%>
        <!-- put incoming details from POST into user object  -->
        <% user.setName(request.getParameter("name")); %>
        <% user.setEmail(request.getParameter("email")); %>
        <% if(user.getEmail() != null) isGuest = false;%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%if(!isGuest){%>
        <title>Welcome <%= user.getName()%></title>
        <%} else{%>
        <title>Welcome Guest!</title>
        <%}%>
                
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
        
    </head>
    <body>
        <h1>Welcome!</h1>
        <p> Welcome to IoT Bay</p>
        

        <%if(!isGuest){%>
        <p> Welcome <%= user.getName() %> </p>
        <p> Your email is: <%= user.getEmail() %> </p>
        <br>
        <form action="logout.jsp" method="post">
        <input TYPE="submit" VALUE="Logout">
        </form>

        <%}else{%>
        <p> Welcome Guest!</p>
        <p> If you're a returning customer please <a href="login.jsp">log in.</a></p>
        <p> If you'd like to save your details please <a href="register.jsp">sign up.</a></p>
        <%}%>
    </body>
</html>
