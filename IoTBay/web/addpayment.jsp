<%-- 
    Document   : addPayment
    Created on : 11/05/2022, 2:51:28 PM
    Author     : edward
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Payment</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Tauri&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    
    <body>
        <div class="navBar">
            <a class="title" style>Login</a>
            <a href="register.jsp"> Register </a>
            <a href="index.jsp"> Home </a>
            <a href="PaymentManagement.jsp"> Payment </a>
            
        <form action="Payment_CreateServlet" method="post">
       
        <h1> Order No. </h1>
        <h2> Total Amount $AUD </h2>
        
        <div class="body-text"> 
            <h3><label for name="paymentMethod">Payment Method</label></h3>
                <select id="paymentMethod" name="paymentMethod">
                <option value="Credit Card">Credit Card</option></select></div>
 
            <b><label for name="datePaid">Date Paid</label></b>
                <input type="date" id="coloumn-left" name="datePaid" placeholder="Date Paid" required/> 
             
                <div class="form-container">
                <div class="personal-information">
                <h1>Payment Information</h1></div> 
            
             <input type="number" id="input-field" name="cardNumber" placeholder="Card Number" required/> 
             <input type="text" id="input-field" name="expiryDate" placeholder="MM/YY" required/> 
             <input type="number" id="input-field" name="cvv" placeholder="CVV" required/> 
             <input type="text" id="input-field" name="nameOnCard" placeholder="Name on Card" required/> 
             
             <input type="submit" value="Pay">
        </form>
       
             <p><a class= "button" style="center" href="welcome.jsp">Cancel</a></p>
                
        </div>
       
    </body>
</html>
