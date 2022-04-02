<%-- 
    Document   : logout
    Created on : 02/04/2022, 4:54:18 PM
    Author     : klean
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <% session.invalidate(); %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
        <title>Logout</title>
    </head>
    <body>
        <h1>Logout Successful!</h1>
        <br>
        <p><a href="index.jsp">Click here to return to home page</a></p>
    </body>
</html>
