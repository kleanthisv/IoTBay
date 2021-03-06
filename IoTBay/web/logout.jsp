<%-- 
    Document   : logout
    Created on : 02/04/2022, 4:54:18 PM
    Author     : klean
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <% session.invalidate();%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>

        <link rel="stylesheet" type="text/css" href="styles.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Tauri&display=swap" rel="stylesheet">

    </head>
    <body>
        <div class="navBar">
            <a class="title">IoT Bay</a>   
        </div>

        <div class="index-container">
            <h1 align="center">Logged out successfully.</h1>
            <form action="index.jsp" method="get">
                <input type="submit" value="Return to home">
            </form>
        </div>
    </body>
</html>
