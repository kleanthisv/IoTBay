package controller;

import java.io.IOException;
import java.sql.Connection;
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

public class EditUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            DBManager manager = (DBManager) session.getAttribute("manager");
            String email = request.getParameter("email");
            ArrayList<User> userList = manager.getAllUsers();
            Validator validator = new Validator();
            validator.clear(session);
            User userSelection = null;

            for (User u : userList) {
                if (email.matches(u.getEmail())) {
                    userSelection = u;
                }
            }
            session.setAttribute("userSelected", userSelection);

            //reset errors when editing another user
            ArrayList<String> errors = new ArrayList();
            session.setAttribute("editUserErrors", errors);            

            request.getRequestDispatcher("editUser.jsp").include(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditUserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        User u = (User) session.getAttribute("userSelected");
        Validator validator = new Validator();
        validator.clear(session);

        ArrayList<String> errors = new ArrayList();
        String newFName = (String) request.getParameter("firstName");
        String newLName = (String) request.getParameter("lastName");
        String newDOB = (String) request.getParameter("birthday");
        String newPhoneNum = (String) request.getParameter("phoneNum");
        String newEmail = (String) request.getParameter("email");
        String newPassword = (String) request.getParameter("password");
        String type = request.getParameter("type");

        if (validator.checkEmpty(newEmail) || validator.checkEmpty(newPassword) || validator.checkEmpty(newLName) || validator.checkEmpty(newFName)) {
            errors.add("Error: All fields required.");
        }
        if (!validator.validatePhone(newPhoneNum)) {
            errors.add("Error: Phone numbers must only contain numbers and be 10 digits long. Eg. 0412345678");
        }
        if (!validator.validateDate(newDOB)) {
            errors.add("Error: Invalid date entered.");
        }
        if (!validator.validateEmail(newEmail)) {
            errors.add("Error: Incorrect email format. eg. john@email.com");
        }
        if (!validator.validatePassword(newPassword)) {
            errors.add("Error: Passwords must be atleast 4 character long, and not contain special characters.");
        }
        if (!validator.validateName(newFName) || !validator.validateName(newLName)) {
            errors.add("Error: Names must be proper nouns and cannot contain numbers or special characters.");
        }
        if (type == null) {
            errors.add("Error: A user type must be selected");
        }

        if (errors.isEmpty()) {
            try {
                manager.updateUser(u.getEmail(), newEmail, newFName, newLName, newDOB, newPhoneNum, newPassword, type);
                u.setEmail(newEmail);
                u.setFName(newFName);
                u.setLName(newLName);
                u.setDOB(newDOB);
                u.setPhoneNum(newPhoneNum);
                u.setPassword(newPassword);
                u.setType(type);

            } catch (SQLException ex) {
                Logger.getLogger(EditUserServlet.class.getName()).log(Level.SEVERE, null, ex);
                errors.add("Error with updating user.");
                session.setAttribute("editUserErrors", errors);
                request.getRequestDispatcher("editUser.jsp").include(request, response);
            }
            session.setAttribute("userEdited", "User successfully edited."); //TODO add this message to manageusers.jsp
            //edit users attribute in session for manage users view
            try {
                ArrayList<User> users = manager.getAllUsers();
                session.setAttribute("users", users);
            } catch (SQLException ex) {
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.getRequestDispatcher("editUser.jsp").include(request, response);
            response.sendRedirect("manageUsers.jsp");
        } else {
            session.setAttribute("editUserErrors", errors);
            request.getRequestDispatcher("editUser.jsp").include(request, response);
        }

    }
}
