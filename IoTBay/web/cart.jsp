<%-- 
    Document   : viewProducts.jsp
    Created on : 10/05/2022, 4:33:50 PM
    Author     : alwin
--%>

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
        <title>Cart</title>
    </head>
    <body>

        <%
            ArrayList<Product> cart = (ArrayList<Product>) session.getAttribute("cart");
            User user = (User) session.getAttribute("user");
        %>

        <div class="navBar">
            <a class="title">Cart</a>
            <%if (user.isGuest()) {%>
            <a href="login.jsp"> Login </a>
            <a href="welcome.jsp"> Home </a>
            <a href="CatalogueServlet"> Catalogue </a>
            <a href="PaymentServlet"> Payment </a>
            <a href="cart.jsp"> Cart </a>
            <%} else {%>
            <a href="logout.jsp"> Log Out</a>
            <a href="welcome.jsp"> Home </a>
            <a href="viewProfileServlet"> Profile </a>
            <a href="CatalogueServlet"> Catalogue </a>
            <a href="PaymentServlet"> Payment </a>
            <a href="cart.jsp"> Cart </a>
            <%}%>
            <%if (user.isStaff()) {%>
            <a href="UserServlet"> Manage Users </a>
            <%}%>
        </div>

        <br>

        <div class="centerH" align="center">
            <a href="viewProducts.jsp"><button class="SearchButtonP">Order More </button></a>
            <button class="SearchButtonP">Complete Order</button>
        </div>

        <table align="center" class="productTable">
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Stock Level</th>
                    <th colspan="3">Actions</th>
                </tr>
            </thead>
            <%
                if (!cart.isEmpty()) {
                    for (Product p : cart) {%>
            <tr> 
                <td><%=p.getID()%></td>
                <td><%=p.getName()%></td>
                <td><%=p.getCategory()%></td>
                <td><%=p.getPrice()%></td>
                <td><%=p.getStock()%></td>
                <td><a><button class="actionBtn">Remove from Cart</button></a></td>
            </tr>
            <% }
            } else {

            %>
            <h3>Cart is empty. </h3>

            <%  }

            %>
        </table>

    </body>
</html>