<%-- 
    Document   : editProduct.jsp
    Created on : 10/05/2022, 6:41:50 PM
    Author     : alwin
--%>

<%@page import="model.User"%>
<%@page import="java.util.ArrayList"%>
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
    <body class="editform" >
        <%
            User user = (User) session.getAttribute("user");
            String isEdited = (String) session.getAttribute("isEdited");
            ArrayList<String> errors = (ArrayList<String>) session.getAttribute("errors");
        %>        

        <div class="navBar">
            <a class="title">Add Product</a>
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

        <% if (!user.isStaff()) { %>
        <h1> You do not have permissions to use this function. </h1>
        <% //make this pretty pls %>
        <%} else {%>

        <h1>Add Product</h1>

        <div class ="editform">
            <form action="AddProductServlet" method="post">
                <label for="newID">Product ID:</label><br>
                <input type="text" id="newID" name="newID" placeholder="Product ID"><br>

                <label for="newName">Product Name:</label><br>
                <input type="text" id="newName" name="newName" placeholder="Product Name"><br>

                <label for="newPrice">Product Price:</label><br>
                <input type="text" id="newPrice" name="newPrice" placeholder="Price"><br>

                <label for="newStock">Product Stock:</label><br>
                <input type="text" id="newStock" name="newStock" placeholder="Stock Available"><br>

                <label for="newCategory">Product Category:</label><br>
                <input type="text" id="newCategory" name="newCategory" placeholder="Category"><br>

                <button type="submit"class ="actionBtnEdit" >Save Changes</button>
                <%
                    }
                    //if there are any errors, print a <p> for each of them.
                    if (errors != null) {
                        for (String error : errors) {
                %>
                <label class="error"> <%= error%> </label>
                
                <%
                        }
                    }
                %>
                <label style="color: greenyellow"><%= (isEdited != null ? isEdited : "")%></label>
            </form>




        </div>

    </body>

</html>
