<%-- 
    Document   : viewProducts.jsp
    Created on : 10/05/2022, 4:33:50 PM
    Author     : alwin
--%>

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
        %>
        <table align="center" class="productTable">
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Brand</th>
                    <th>Price</th>  <%-- add missing products --%>
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
                <td><a href="EditProductServlet" ><button action="<% session.setAttribute("productSelected", p);  %>" class="actionBtn">Edit</button></a></td>
                <td><a href="deleteProductServlet" ><button class="actionBtn">Delete</button></a></td>

            </tr>


            <%
                }
            %>
        </table>

    </body>
</html>