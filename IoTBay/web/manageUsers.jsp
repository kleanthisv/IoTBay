<%-- 
    Document   : manageUsers
    Created on : 14/05/2022, 7:10:15 PM
    Author     : Richie
--%>

<%@page import="model.User"%>
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
    <body action="UserServlet">

        <%
            User user = (User) session.getAttribute("user");
            ArrayList<User> userList = (ArrayList<User>) session.getAttribute("users");
            String userSearchError = (String) session.getAttribute("userSearchError");
            System.out.println(userSearchError);
        %>

        <div class="navBar">
            <a class="title">Manage Users</a>
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

        <br>

        <form align='center' class="searchForm" action='UserServlet' method='post' style="margin:auto;max-width:300px">
            <label for="userSearch" class="searchTextField" >Search:</label>
            <input type="text" class ="searchForm"id="userSearch" name="userSearch" placeholder="Search Users by name or Phone number"><br>
            <input type="submit" class="SearchButtonP" value="Search">
        </form>


        <br>

        <p class="error" align="center"> <%= (userSearchError != null ? userSearchError : "")%></p>

        <br>


        <table align="center" class="productTable">
            <thead>
                <tr>
                    <th>Type</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Phone Number</th>
                    <th>Date of birth</th>
                    <th>Email</th>
                    <th colspan="3">Actions</th>
                </tr>
            </thead>
            <%

                for (User u : userList) {
            %>

            <tr> 
                <td><%=u.getType()%></td>
                <td><%=u.getFName()%></td>
                <td><%=u.getLName()%></td>
                <td><%=u.getPhoneNum()%></td>
                <td><%=u.getDOB()%></td>
                <td><%=u.getEmail()%></td>
                <% if (u.isActive()) {%>
                <td><a href="DeactivateUser?email=<%= u.getEmail()%>" ><button class="actionBtn">Deactivate</button></a></td>
                <%} else {%>
                <td><a href="ActivateUser?email=<%= u.getEmail()%>" ><button class="actionBtn">Activate</button></a></td>
                <%}%>
                <td><a href="EditUserServlet?email=<%= u.getEmail()%>" ><button class="actionBtn">Edit</button></a></td>
                <td><a href="DeleteUser?email=<%= u.getEmail()%>&&password=<%= u.getPassword()%>" ><button class="actionBtn">Delete</button></a></td>
            </tr>


            <%
                }
            %>
        </table>

        <br>
        <div class="centerH" align="center">
            <a href="AddUserServlet"><button class="SearchButtonP">Add user </button></a>
        </div>
    </body>
</html>