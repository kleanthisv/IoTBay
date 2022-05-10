<!DOCTYPE html>

<html>
    <head>
        <title>IoT Bay</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
    </head>
    <body>
        <div class="navBar">
            <a class="title">Welcome to IoT Bay</a>
            <a href="login.jsp"> Login </a>
            <a href="register.jsp"> Register </a>
            <a href="welcome.jsp"> Guest </a>         
        </div>
    
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>
