<%-- 
    Document   : deletePayment
    Created on : 02/04/2022, 4:54:18 PM
    Author     : Edward
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Tauri&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="styles.css">

    </head>
    <body>
        <div class="navBar">
              <a class="title" style>Payment Delete</a>
            <a href="register.jsp"> Register </a>
            <a href="index.jsp"> Home </a>
            <a href="PaymentManagement.jsp"> Payment </a>
        </div>

        <div class="index-container">
            <h1 align="center">Successfully Deleted Payment Method.</h1>
            <form action="PaymentManagement.jsp" method="get">
                <input type="submit" value="Return to Payment Method">
            </form>
        </div>
    </body>
</html>
