<%-- 
    Document   : searchstaff
    Created on : May 15, 2022, 7:05:55 PM
    Author     : billi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<link rel="stylesheet" href="./css/customer.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<div class="main-component">

<div class="dashboard-form-container with-bg has-subheading">
        <title>Search user</title>
    </head>
    <body>
        <h1>Search User!</h1>
        <form action="View_Staff" method="POST">
<label for="USERNAME"> Search Staff : </label><br>
<p><input type="SEARCH" name="SEARCH" value="" placeholder="Username or Firstname or Lastname" size="50"><br></p>
        <input type="submit" value="Search"></form>
        <p></p>
        <form action="index.html" method="POST">
        <input type="submit" value="Back"></form>

    </body>

</html>