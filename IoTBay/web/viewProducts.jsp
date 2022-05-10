<%-- 
    Document   : viewProducts.jsp
    Created on : 10/05/2022, 4:33:50 PM
    Author     : alwin
--%>

<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
                <td><button class="actionBtn" onclick="location.href = 'editProduct.jsp?prodId=<%= p.getSKU()%>';">Edit</button></td>
                <td><button class="actionBtn" onclick="location.href = 'processDeleteProduct.jsp?prodId=<%= p.getSKU()%>';">Delete</button></td>


            </tr>


            <%
                }
            %>
        </table>

    </body>
</html>