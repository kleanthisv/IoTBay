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
         <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Tauri&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="styles.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Edit Product</title>
    </head>
    <body class="editform" action="EditProductServlet">
        <%
            Product p = (Product) session.getAttribute("productSelected");
            String isEdited = (String) session.getAttribute("isEdited");
        %>        
        
        <h1>Edit Product - <%= p.getName() %></h1>
        
        
        
        <div class ="editform">
        <form action="EditProductServlet" method="post">
            <label for="newName">Product Name:</label><br>
            <input type="text" id="newName" name="newName" value="<%=(p.getName())%>" placeholder="Name"><br>

            <label for="newPrice">Product Price:</label><br>
            <input type="text" id="newPrice" name="newPrice" value="<%=(p.getPrice())%>" placeholder="Price"><br>

            <label for="newStock">Product Stock:</label><br>
            <input type="text" id="newStock" name="newStock" value="<%=(p.getStock())%>" placeholder="Stock Available"><br>

            <label for="newCategory">Product Category:</label><br>
            <input type="text" id="newCategory" name="newCategory" value="<%=(p.getCategory())%>" placeholder="Category"><br>
            <br>
            <button type="submit"class ="actionBtnEdit" >Save Changes</button>
        </form>
            
        <p><%= (isEdited != null ? isEdited : "")%></p>
    </div>

        </body>

</html>
