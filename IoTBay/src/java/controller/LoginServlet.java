//Author: Kleanthis

package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;
import model.dao.DBManager;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        Validator validator = new Validator();
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = null;
        validator.clear(session);
        
        if(validator.checkEmpty(email,password)){
            session.setAttribute("inputError", "Error: Email or password is empty.");
            request.getRequestDispatcher("login.jsp").include(request, response);
        }
        else if(!validator.validateEmail(email)){
            session.setAttribute("emailError", "Error: Email format is incorrect.");
            request.getRequestDispatcher("login.jsp").include(request, response);
        }
        else if(!validator.validatePassword(password)){
            session.setAttribute("passwordError", "Error: Password format is incorrect.");
            request.getRequestDispatcher("login.jsp").include(request, response);
        }
        else {
            try {
                user = manager.findUser(email, password);
            } catch (SQLException ex) {
                Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            if(user != null){
                session.setAttribute("user", user);
                request.getRequestDispatcher("welcome.jsp").include(request, response);
            }
            else{
                session.setAttribute("existError", "Error: User not found or password was incorrect.");
                request.getRequestDispatcher("login.jsp").include(request, response);
            }
        }
    }
    
    public boolean isAdmin(User user){
        if (user.getType() == "ADMIN") return true;
        else return false;
    }
}
