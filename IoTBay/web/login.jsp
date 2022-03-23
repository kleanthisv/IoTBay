<%-- 
    Document   : login
    Created on : 23/03/2022, 2:28:53 PM
    Author     : klean
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <form action="welcome.jsp" method="post">
            <label for="name">Name:</label><br>
            <input type="text" id="name" name="name"><br>
            
            <label for="email">Email:</label><br>
            <input type="text" id="email" name="email"><br>
            
            <input type="submit" value="login" />
        </form>
    </body>
</html>
