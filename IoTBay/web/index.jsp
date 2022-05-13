<!DOCTYPE html>
<%-- 
    Written by: Kleanthis
--%>
<html>
    <head>
        <title>IoT Bay</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Tauri&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <body>
        <div class="navBar">
            <a class="title">IoT Bay</a>   
        </div>
        
        <div class="index-container">
            <h1 align="center">Welcome to IoT Bay</h1>
            <form action="login.jsp" method="get">
                <input type="submit" value="Login">
            </form>
            <form action="RegisterServlet" method="get">
                <input type="submit" value="Register">
            </form>
            <form action="LoginServlet" method="get">
                <input type="submit" value="Guest">
            </form>
        </div>

        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>
