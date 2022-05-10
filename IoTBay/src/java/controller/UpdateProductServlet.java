/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.dao.DBConnector;
import model.dao.DBManager;

/**
 *
 * @author alwin
 */
public class UpdateProductServlet extends HttpServlet {
    
    private DBConnector db;
    private DBManager manager;
    
    @Override /* override method in subclass*/
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
     
     /* Get session */
     HttpSession session = request.getSession();

     
      /* get entered details from user */
     String previouspname = request.getParameter("previouspname");
     String productname = request.getParameter("productname");
     Double price = Double.parseDouble(request.getParameter("price"));
     
    session.setAttribute("product", null);
    session.setAttribute("updated", null);
    
    try {
       Boolean exists = manager.checkItem(previouspname);
    
    if(exists) {
    manager.updateItem(manager.fetchProductid(previouspname), productname, price);
    session.setAttribute("updated", "Product has been updated");
    
    request.getRequestDispatcher("editProduct.jsp").include(request, response);
    response.sendRedirect("editProduct.jsp");        
            
    }
    
    else {
        session.setAttribute("updated", "Product hasn't been updated");
        request.getRequestDispatcher("editProduct.jsp").include(request, response);
        response.sendRedirect("editProduct.jsp");
    }
    
     
    }  catch (SQLException ex) {
            Logger.getLogger(UpdateProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
}}
    
    
    

    
   