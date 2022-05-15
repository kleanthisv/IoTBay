//Author: Kleanthis
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

public class viewProfileServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        Validator validator = new Validator();
        validator.clear(session);
        request.getRequestDispatcher("viewProfile.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        Validator validator = new Validator();
        DBManager manager = (DBManager) session.getAttribute("manager");
        validator.clear(session);
        User user = (User) session.getAttribute("user");

        ArrayList<String> errors = new ArrayList();
        ArrayList<String> changed = new ArrayList();

        boolean changePassword = false;
        String fName = request.getParameter("firstName");
        String lName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String date = request.getParameter("birthday");
        String phoneNum = request.getParameter("phoneNum");
        String newPassword = request.getParameter("newPasword");
        String newPasswordConfirm = request.getParameter("newPasswordConfirm");
        
        if (!phoneNum.equals(user.getPhoneNum())) {
            if (!validator.validatePhone(phoneNum)) {
                errors.add("Error: Phone numbers must only contain numbers and be 10 digits long. Eg. 0412345678");
            } else {
                changed.add("Phone number updated.");
            }
        }
        if (!date.equals(user.getDOB())) {
            if (!validator.validateDate(date)) {
                errors.add("Error: Invalid date entered.");
            } else {
                changed.add("DOB updated.");
            }
        }

        if (!email.matches(user.getEmail())) {
            if (!validator.validateEmail(email)) {
                errors.add("Error: Incorrect email format. eg. john@email.com");
            } else {
                try {
                    if (manager.userExists(email)) {
                        errors.add("Error: That email address is taken.");
                    } else {
                        changed.add("Email updated.");
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        if (password != null || !password.isEmpty()) {
            if (password.equals(user.getPassword())) {
                if (newPassword.equals(newPasswordConfirm)) {
                    if (!validator.validatePassword(newPassword)) {
                        errors.add("Error: Passwords must be atleast 4 character long, and not contain special characters.");
                    } else {
                        changed.add("Password updated");
                        changePassword = true;
                    }
                }

            } else {
                errors.add("Error: Current password is incorrect.");
            }
        }

        if (!fName.equals(user.getFName())) {
            if (!validator.validateName(fName)) {
                errors.add("Error: Names must be proper nouns and cannot contain numbers or special characters.");
            } else {
                changed.add("First name updated.");
            }
        }
        if (!lName.equals(user.getLName())) {
            if (!validator.validateName(lName)) {
                errors.add("Error: Names must be proper nouns and cannot contain numbers or special characters.");
            } else {
                changed.add("Last name updated.");
            }
        }

        //if errors are present, do not submit.
        if (!errors.isEmpty()) {
            session.setAttribute("errors", errors);
            request.getRequestDispatcher("viewProfile.jsp").include(request, response);
        } else {
            try {
                //edit user details

                if (changePassword) {
                    manager.updateUser(user.getEmail(), email, fName, lName, date, phoneNum, password, user.getType());
                    user.setEmail(email);
                    user.setFName(fName);
                    user.setLName(lName);
                    user.setDOB(date);
                    user.setPhoneNumber(phoneNum);
                    user.setPassword(password);
                    session.setAttribute("changed", changed);
                    request.getRequestDispatcher("viewProfile.jsp").include(request, response);
                } else {
                    manager.updateUser(user.getEmail(), email, fName, lName, date, phoneNum, user.getPassword(), user.getType());
                    user.setEmail(email);
                    user.setFName(fName);
                    user.setLName(lName);
                    user.setDOB(date);
                    user.setPhoneNumber(phoneNum);
                    session.setAttribute("changed", changed);
                    request.getRequestDispatcher("viewProfile.jsp").include(request, response);

                }
            } catch (SQLException ex) {
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
                session.setAttribute("errors", errors);
                request.getRequestDispatcher("viewProfile.jsp").include(request, response);
            }

        }

    }
}
