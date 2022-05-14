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
public class ActivateUser extends HttpServlet {

    DBConnector connector;
    DBManager manager;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        try {
            connector = new DBConnector();
            manager = new DBManager(connector.openConnection());
        } catch (ClassNotFoundException | SQLException ex) {
            java.util.logging.Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        String email = request.getParameter("email");
        try {
            manager.ActivateUser(email);
            //set users session after activating user
            ArrayList<User> Users = new ArrayList();
            Users = manager.getAllUsers();
            session.setAttribute("users", Users);
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(DeactivateUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("manageUsers.jsp");

    }

}
