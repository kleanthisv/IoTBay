<%-- 
    Document   : adminViewUserLog
    Created on : 15/05/2022, 9:44:17 PM
    Author     : Richie
--%>

<%@page import="model.User"%>
<%@page import="model.Log"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.UserServlet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Tauri&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="styles.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Users</title>
    </head>
    <body action="AdminViewUserLog">

        <%
            User user = (User) session.getAttribute("user");
            ArrayList<Log> logs = (ArrayList<Log>) session.getAttribute("logs");
            String errors = (String) session.getAttribute("errors");
        %>

        <div class="navBar">
            <a class="title">User Log</a>
            <%if (user.isGuest()) {%>
            <a href="login.jsp"> Login </a>
            <a href="welcome.jsp"> Home </a>
            <a href="CatalogueServlet"> Catalogue </a>
            <a href="PaymentServlet"> Payment </a>
            <a href="cart.jsp"> Cart </a>
            <%} else {%>
            <a href="logout.jsp"> Log Out</a>
            <a href="welcome.jsp"> Home </a>
            <a href="viewProfile.jsp"> Profile </a>
            <a href="CatalogueServlet"> Catalogue </a>
            <a href="PaymentServlet"> Payment </a>
            <a href="cart.jsp"> Cart </a>
            <%}%>
            <%if (user.isAdmin()) {%>
            <a href="UserServlet"> Manage Users </a>
            <%}%>
        </div>

        <% if (!user.isAdmin() || user == null) { %>
        <h1> You do not have permissions to use this function. </h1>
        <%} else {%>

        <br>
        <% // TODO everything in caps need to implement,  %>
        <form align='center' class="searchForm" action='AdminViewUserLogs' method='post' style="margin:auto;max-width:300px">
            <label for="adminSearch" class="searchTextField" >Search:</label>
            <input type="text" class ="searchForm"id="adminSearch" name="adminSearch" placeholder="Search for logs by date"><br>
            <input type="submit" class="SearchButtonP" value="Search">
        </form>


        <p class="error" align="center"> <%= (errors != null ? errors : "")%></p>


        <table align="center" class="productTable">
            <thead>
                <tr>
                    <th>Log ID</th>
                    <th>User email</th>
                    <th>Login time</th>
                    <th>Logout time</th>
                </tr>
            </thead>
            <%

                for (Log l : logs) {
            %>

            <tr> 
                <td><%=l.getID()%></td>
                <td><%=l.getEmail()%></td>
                <td><%=l.getLogin()%></td>
                <td><%=l.getLogout()%></td>

            </tr>

            <br>

            <%} 
                }%>

        </table>


    </body>
</html>