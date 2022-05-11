<!DOCTYPE html>

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
            <a class="title">Welcome to IoT Bay</a>
            <a href="login.jsp"> Login </a>
            <a href="RegisterServlet"> Register </a>
            <a href="LoginServlet?guest=true"> Guest </a>         
        </div>

        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>
