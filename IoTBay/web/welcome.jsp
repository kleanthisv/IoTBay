<%-- 
    Document   : welcome
    Created on : 16/03/2022, 2:10:55 PM
    Author     : klean
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Registration Complete!</h1>
        <p> Congrats! you made it </p>
        
        //get parameters from register / login form and initiate into variables
        <% String name = request.getParameter("name"); %>
        <% String email = request.getParameter("email"); %>
        
        <p> Welcome <%= name %> </p>
        <p> Welcome <%= email %> </p>
        
    </body>
</html>
