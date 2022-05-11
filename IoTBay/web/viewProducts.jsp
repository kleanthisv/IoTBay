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
        %>
        <table align="center" class="productTable">
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Stock Level</th>
                    <th colspan="2">Actions</th>
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