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

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        validator.clear(session);
        request.getRequestDispatcher("register.jsp").include(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        Validator validator = new Validator();
        DBManager manager = (DBManager) session.getAttribute("manager");
        validator.clear(session);
        User user = null;
        
        String fName = request.getParameter("firstName");
        String lName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String date = request.getParameter("birthday");
        String phoneNum = request.getParameter("phoneNum");
        
        if( validator.checkEmpty(email, password) || validator.checkEmpty(fName, lName)){
            session.setAttribute("emptyError", "Error: All fields required.");
            request.getRequestDispatcher("register.jsp").include(request, response);
            System.out.println("error empty");
        }
        else if(!validator.validatePhone(phoneNum)){
            session.setAttribute("phoneError", "Error: Phone numbers must only contain numbers and be 10 digits long. Eg. 0412345678");
            request.getRequestDispatcher("register.jsp").include(request, response);
            System.out.println("error phone invalid");
        }
        else if(!validator.validateDate(date)){
            session.setAttribute("dateError", "Error: Invalid date entered.");
            request.getRequestDispatcher("register.jsp").include(request, response);
            System.out.println("error date invalid");
        }
        else if(!validator.validateEmail(email)){
            session.setAttribute("emailError", "Error: Incorrect email format. eg. john@email.com");
            request.getRequestDispatcher("register.jsp").include(request, response);
            System.out.println("error email invalid");
        }
        else if(!validator.validatePassword(password)){
            session.setAttribute("passwordError", "Error: Passwords must be atleast 4 character long, and not contain special characters.");
            request.getRequestDispatcher("register.jsp").include(request, response);
            System.out.println("error password invalid");
        }
        else if(!validator.validateName(fName) || !validator.validateName(lName)){
            session.setAttribute("nameError", "Error: Names must be proper nouns and cannot contain numbers or special characters.");
            request.getRequestDispatcher("register.jsp").include(request, response);
            System.out.println("error name invalid");
        }
        else{
            try{
                if(manager.userExists(email)){
                    session.setAttribute("existsError", "Error: A user already exists under that email address.");
                    request.getRequestDispatcher("register.jsp").include(request, response);
                    System.out.println("error user exists");
                }    
            }catch (SQLException ex) {
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex); 
            }
            
            try {
                manager.addUser(email, fName, lName, date, phoneNum , password, "CUSTOMER");
                System.out.println("creating user in DB");
                
                user = manager.findUser(email, password);
                System.out.println("User created and selected.");
            } catch (SQLException ex) {
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            if(user != null){
                session.setAttribute("user",user);
                request.getRequestDispatcher("welcome.jsp").include(request, response);
            }
        }
        
        
    }
}
