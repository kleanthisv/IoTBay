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

public class UserServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        session.setAttribute("userSelected", null);
        try {
            ArrayList<User> users = manager.getAllUsers();
            session.setAttribute("users", users);
        } catch (SQLException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("manageUsers.jsp").include(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        Validator validator = new Validator();
        validator.clear(session);
        ArrayList<User> users = null;
        
        try {
            users = manager.getAllUsers();
            session.setAttribute("users", users);
        } catch (SQLException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        //filter user list based on phone number, first name, or last name
        String filterTerm = request.getParameter("userSearch");
        ArrayList<User> filteredUsers = new ArrayList();
        if (filterTerm != null) {
            
            for (User u : users) {
                if (u.getPhoneNum().contains(filterTerm)) {
                    filteredUsers.add(u);
                }
                else if (u.getFName().toLowerCase().contains(filterTerm.toLowerCase())) {
                    filteredUsers.add(u);
                }
                else if(u.getLName().toLowerCase().contains(filterTerm.toLowerCase())) {
                    filteredUsers.add(u);
                }
            }
            
            
        }
        if(filteredUsers.isEmpty() && filterTerm != null){
                session.setAttribute("searchError", "No users found when searching for: " + filterTerm);
        }
        else if(filteredUsers.size() > 0){
                session.setAttribute("users", filteredUsers);
        }
        
        request.getRequestDispatcher("manageUsers.jsp").include(request, response);
    }

}
