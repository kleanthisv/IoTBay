<%-- 
    Document   : welcome
    Created on : 16/03/2022, 2:10:55 PM
    Author     : Kleanthis
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <body>
        
        <%
        User user = (User) session.getAttribute("user");
        if(user == null){
            user = new User();
        }
        %>
        
        <div class="navBar">
            <a class="title">Home Page</a>
            <%if(user.isGuest()){%>
                <a href="login.jsp"> Login </a>
            <%}else{%>
                <a href="logout.jsp"> Log Out</a>
            <%}%>
            <a href="welcome.jsp"> Home </a>
            <a href="CatalogueServlet"> Catalogue </a>
        </div>

        <p> Welcome <%= (user.getFName() != null ? user.getFName() : "")%> </p>
        <p> email: <%= user.getEmail() %> </p>
        <p> Your permissions are: <%= user.getType() %></p
        <br>
    </body>
</html>
