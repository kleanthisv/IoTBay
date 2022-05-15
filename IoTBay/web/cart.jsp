<%-- 
    Document   : Cart
    Created on : 15/05/2022, 1:08:42 PM
    Author     : noahd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Cart </title>
        
    </head>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <body>
        
        <div class="navBar">
            <a class="title">Viewing Cart</a>
            <a href="logout.jsp"> Logout </a>
            <a href="welcome.jsp"> Home </a>
            <a href="PaymentServlet"> Payment Options </a>
            
        </div>

        <h1> Cart Content </h1>
        <table width="600" border="1" cellspacing="0" cellpadding="3" border="0"/>
        
        <tr>
            <th>Item</th>
            <th>Quantity</th>
            <th>Price</th>    
        </tr>
    
    
        
  