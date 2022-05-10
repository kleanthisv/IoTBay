<%-- 
    Document   : editProduct.jsp
    Created on : 10/05/2022, 6:41:50 PM
    Author     : alwin
--%>

<%@page import="model.Product"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Product</title>
    </head>
    <body>
        <%
            Product p = (Product) session.getAttribute("productSelected");
        %>

        <h1>Edit Product <%= p.getName() %></h1>
    </body>

</html>
