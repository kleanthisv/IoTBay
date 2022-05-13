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
        <title>View Products</title>
    </head>
    <body action="CatalogueServlet">

        <%
            ArrayList<Product> productList = (ArrayList<Product>) session.getAttribute("products");
            User user = (User) session.getAttribute("user");
            String searchError = (String) session.getAttribute("searchError");
            System.out.println(searchError);
        %>
        
        <div class="navBar">
            <a class="title">Catalogue</a>
            <%if (user.isGuest()) {%>
            <a href="login.jsp"> Login </a>
            <a href="welcome.jsp"> Home </a>
            <a href="CatalogueServlet"> Catalogue </a>
            <%} else {%>
            <a href="logout.jsp"> Log Out</a>
            <a href="welcome.jsp"> Home </a>
            <a href="viewProfile.jsp"> Profile </a>
            <a href="CatalogueServlet"> Catalogue </a>
            <%}%>
        </div>
        
        <br>
        
        <form align='center' class='searchForm' action='CatalogueServlet' method='post'>
            <label for="productSearch">Search:</label>
            <input type="text" id="productSearch" name="productSearch" placeholder="Search Products by name"><br>
            <input type="submit" value="Search">
        </form>
        
        <br>
        
        <p class="error" align="center"> <%= (searchError != null ? searchError : "")%></p>
        
        <br>
        
        <table align="center" class="productTable">
            <thead>
                <tr>
                    <th>Product SKU</th>
                    <th>Product Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Stock Level</th>
                    <th colspan="3">Actions</th>
                </tr>
            </thead>
            <%
                
                for (Product p : productList) {
            %>

            <tr> 
                <td><%=p.getSKU()%></td>
                <td><%=p.getName()%></td>
                <td><%=p.getCategory()%></td>
                <td><%=p.getPrice()%></td>
                <td><%=p.getStock()%></td>
                <% if(user.isStaff()) {
                %>
                <td><a href="" ><button class="actionBtn">Add to Cart</button></a></td>
                <td><a href="EditProductServlet?sku=<%= p.getSKU()%>" ><button class="actionBtn">Edit</button></a></td>
                <td><a href="" ><button class="actionBtn">Delete</button></a></td>
                <%
                    }else{
                %>
                <td><a href="" ><button class="actionBtn">Add to Cart</button></a></td>
                <%
                    }
                %>
            </tr>
            

            <%
                }
            %>
        </table>

    </body>
</html>