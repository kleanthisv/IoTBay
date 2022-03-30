<%-- 
    Document   : welcome
    Created on : 16/03/2022, 2:10:55 PM
    Author     : klean
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <% boolean isGuest = true;%>
        <% String name = request.getParameter("name"); %>
        <% String email = request.getParameter("email"); %>
        <% if(email != null) isGuest = false;%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%if(!isGuest){%>
        <title>Welcome <%= name%></title>
        <%} else{%>
        <title>Welcome Guest!</title>
        <%}%>
        
    </head>
    <body>
        <h1>Welcome!</h1>
        <p> Welcome to IoT Bay</p>
        
        <!-- put incoming parameters into variables -->

        <!-- to do: handle login and register details to create account / reference other account -->
        <%if(!isGuest){%>
        <p> Welcome <%= name %> </p>
        <p> Your email is: <%= email %> </p>
        <%}else{%>
        <p> Welcome Guest!</p>
        <p> If you're a returning customer please <a href="login.jsp">log in.</a></p>
        <p> If you'd like to save your details please <a href="register.jsp">sign up.</a></p>
        <%}%>
    </body>
</html>
