/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Product;
import model.dao.*;
/**
 *
 * @author Richie
 */
public class DeleteProduct extends HttpServlet {
    DBConnector connector;
    DBManager manager; 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        HttpSession session = request.getSession();
        try
        {
            connector = new DBConnector();
        }catch (ClassNotFoundException | SQLException ex){
            java.util.logging.Logger.getLogger(DeleteProduct.class.getName()).log(Level.SEVERE,null,ex);
        }
        
        try
        {
            manager = new DBManager(connector.openConnection());
        }catch (SQLException ex){
            java.util.logging.Logger.getLogger(DeleteProduct.class.getName()).log(Level.SEVERE,null,ex);
        }
        
        String productID = request.getParameter("ID");
        Product temp = null;
        
        try{
            temp = manager.findProduct(productID);
            
            if(temp!=null) {
                manager.deleteProduct(productID);
                // set the users attribute again after deletion
                ArrayList<Product> Product = new ArrayList();
                Product = manager.getAllProducts(); 
                session.setAttribute("products", Product);

                session.setAttribute("error", "Product deleted successfully");

            }
            else{
                session.setAttribute("error", "Product was unable to be deleted");
            }
            request.getRequestDispatcher("viewProducts.jsp").include(request, response);
            response.sendRedirect("viewProducts.jsp"); // redirect to manage users
        }catch (SQLException ex) {
           System.out.println(ex.getErrorCode() + " and " + ex.getMessage());
        }
        
        
        
    }



}
