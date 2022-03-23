<%-- 
    Document   : register
    Created on : 16/03/2022, 2:09:34 PM
    Author     : klean
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <h1>Register</h1>
        
        <form action="welcome.jsp" method="post">
            <label for="name">Name:</label><br>
            <input type="text" id="name" name="name"><br>
            
            <label for="email">Email:</label><br>
            <input type="text" id="email" name="email"><br>
            
            <label for="password">Password:</label><br>
            <input type="password" id="password" name="password"><br>
            
            <label for="gender">Gender:</label><br>
            <select name="gender" id="gender">
                <option value="male">Male</option>
                <option value="female">Female</option>
            </select><br>
            
            <label for="colour">Favourite Colour:</label><br>
            <input type="text" id="colour" name="favcol"><br>
            
            <label for="tos">Read and Agree to the TOS?</label><br>
            <input type="checkbox" id="tos" name="tos"><br>
            
            <br>
            <input type="submit" value="Register">
            
        </form>
        
    </body>
</html>
