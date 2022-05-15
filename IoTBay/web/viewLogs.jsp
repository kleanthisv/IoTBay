<%-- 
    Document   : viewProducts.jsp
    Created on : 10/05/2022, 4:33:50 PM
    Author     : alwin
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="model.dao.DBManager"%>
<%@page import="model.Log"%>
<%@page import="model.User"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.CatalogueServlet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Tauri&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="styles.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Logs</title>
    </head>
    <body action="CatalogueServlet">

        <%
            User user = (User) session.getAttribute("user");
        %>

        <div class="navBar">
            <a class="title">View Logs</a>
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
        <%
            if (user != null && !user.isGuest()) {

                DBManager manager = (DBManager) session.getAttribute("manager");
                try{
                ArrayList<Log> logs = manager.getUserLogs(user.getEmail());
                }catch(SQLException e){
                    System.out.println("Error fetching logs.");
                }
        %>
        <br>

        <table align="center" class="productTable">
            <thead>
                <tr>
                    <th>Log ID</th>
                    <th>Email</th>
                    <th>Login Time</th>
                    <th>Logout Time</th>
                </tr>
            </thead>
            <%
                for (Log l : logs) {
            %>
            <td><%=l.getEmail()%></td>
            <td><%=l.getLogin()%></td>
            <td><%=l.getLogout()%></td>
        </tr>


        <%
            }
        %>
    </table>
    <%
    } else {
    %>
    <h1> Oops! You seem lost, <a href="index.jsp"> return to index.</a> </h1>
    <%
        }
    %>
</body>
</html>