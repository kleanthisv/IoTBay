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
import model.User;
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
            java.util.logging.Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE,null,ex);
        }
        
        try
        {
            manager = new DBManager(connector.openConnection());
        }catch (SQLException ex){
            java.util.logging.Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE,null,ex);
        }
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User temp = null;
        
        try{
            temp = manager.findUser(email, password);
            
            if(temp!=null) {
                manager.deleteUser(email);
                // set the users attribute again after deletion
                ArrayList<User> Users = new ArrayList();
                Users = manager.getAllUsers(); 
                session.setAttribute("users", Users);

                session.setAttribute("searchError", "User successfully deleted");

            }
            else{
                session.setAttribute("searchError", "User was unable to be deleted");
            }
            request.getRequestDispatcher("manageUsers.jsp").include(request, response);
            response.sendRedirect("manageUsers.jsp"); // redirect to manage users
        }catch (SQLException ex) {
           System.out.println(ex.getErrorCode() + " and " + ex.getMessage());
        }
        
        
        
    }



}
