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
import model.dao.DBManager;

public class AddUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        Validator validator = new Validator();
        validator.clear(session);
        //reset errors when adding another user
        ArrayList<String> errors = new ArrayList();
        session.setAttribute("errors", errors);
        request.getRequestDispatcher("addUser.jsp").include(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        Validator validator = new Validator();
        DBManager manager = (DBManager) session.getAttribute("manager");
        validator.clear(session);
        User user = null;

        ArrayList<String> errors = new ArrayList();

        String fName = request.getParameter("firstName");
        String lName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String date = request.getParameter("birthday");
        String phoneNum = request.getParameter("phoneNum");
        String type = request.getParameter("type");

        if (validator.checkEmpty(email) || validator.checkEmpty(password) || validator.checkEmpty(lName) || validator.checkEmpty(fName)) {
            errors.add("Error: All fields required.");
        }
        if (!validator.validatePhone(phoneNum)) {
            errors.add("Error: Phone numbers must only contain numbers and be 10 digits long. Eg. 0412345678");
        }
        if (!validator.validateDate(date)) {
            errors.add("Error: Invalid date entered.");
        }
        if (!validator.validateEmail(email)) {
            errors.add("Error: Incorrect email format. eg. john@email.com");
        }
        if (!validator.validatePassword(password)) {
            errors.add("Error: Passwords must be atleast 4 character long, and not contain special characters.");
        }
        if (!validator.validateName(fName) || !validator.validateName(lName)) {
            errors.add("Error: Names must be proper nouns and cannot contain numbers or special characters.");
        }
        if (type == null) {
            errors.add("Error: A user type must be selected");
        }

        //Check if user exists in DB.
        try {
            if (manager.userExists(email)) {
                errors.add("Error: A user already exists under that email address.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AddUserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        //if errors are present, do not submit.
        if (!errors.isEmpty()) {
            session.setAttribute("errors", errors);
            request.getRequestDispatcher("addUser.jsp").include(request, response);
        } else {
            try {
                manager.addUser(email, fName, lName, date, phoneNum, password, type);
                user = manager.findUser(email, password);
            } catch (SQLException ex) {
                Logger.getLogger(AddUserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (user != null) {
            // update session of users
            try {
                session.setAttribute("users", manager.getAllUsers());
                request.getRequestDispatcher("manageUsers.jsp").include(request, response);
                response.sendRedirect("manageUsers.jsp"); // redirect to manage users if user successfully added
            } catch (SQLException ex) {
                Logger.getLogger(AddUserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }
}
