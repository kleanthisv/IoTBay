<%-- 
    Document   : viewProducts.jsp
    Created on : 10/05/2022, 4:33:50 PM
    Author     : alwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Products</title>
    </head>
    <body>
        
        
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
          	List<Product> productList = ProductManagementDAO //replace with database .getAllProducts();
                for (Product p : productList) {
        %>
        
        <tr> 
            <td><%=p.getProductId()%></td>
            <td><%=p.getProductName()%></td>
            <td><%=p.getProductCategory()%></td>
            <td><%=p.getProductPrice()%></td>
            <td><button class="actionBtn" onclick="location.href = 'editProduct.jsp?prodId=<%= p.getProductId()%>';">Edit</button></td>
            <td><button class="actionBtn" onclick="location.href = 'processDeleteProduct.jsp?prodId=<%= p.getProductId()%>';">Delete</button></td>
		
        
        </tr>

		
        <%
}
%>
	</table>

</body>
</html>