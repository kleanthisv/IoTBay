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
import model.Product;
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
        
        ArrayList<String> errors = new ArrayList();
        
        
        //Check to see if there are any errors in the input.
        if(validator.checkEmpty(password) || validator.checkEmpty(email)){
            errors.add("Error: Email or password is empty.");
        }
        if(!validator.validateEmail(email)){
            errors.add("Error: Email format is incorrect. Eg. john@email.com");
        }
        
        //if no errors are present, proceed with fetching the user from DB.
        if (errors.isEmpty()) {
            try {
                //manager.findUser will return null if no user is found to match those login details.
                user = manager.findUser(email, password);
            } catch (SQLException ex) {
                Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (NullPointerException ex){
                System.out.println();
            }
            
            //if user is not null, that means we successfully fetched a user from the DB.
            //set the user attribute in the session and redirect to the welcome page.
            if (user != null) {
                if(!user.isActive()){
                    errors.add("Error: Your account has been deactivated.");
                    session.setAttribute("errors", errors);
                    request.getRequestDispatcher("login.jsp").include(request, response);
                }
                else{
                    session.setAttribute("user", user);
                    request.getRequestDispatcher("welcome.jsp").include(request, response);
                }
                
            }
            else{
                errors.add("Error: User not found or password was incorrect. ");
                session.setAttribute("errors", errors);
                request.getRequestDispatcher("login.jsp").include(request, response);
            }
        }
        else{
            session.setAttribute("errors",errors);
            request.getRequestDispatcher("login.jsp").include(request, response);
        }
        //if login is successful
        
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        ArrayList<Product> cart = new ArrayList<Product>();
        session.setAttribute("cart",cart);
        session.setAttribute("user", new User());
        request.getRequestDispatcher("welcome.jsp").include(request, response);
    }

}
