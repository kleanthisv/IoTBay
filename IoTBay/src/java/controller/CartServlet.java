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
import model.Product;
import model.dao.*;

public class CartServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            DBManager manager = (DBManager) session.getAttribute("manager");
            String productID = request.getParameter("ID");
            ArrayList<Product> productList = manager.getAllProducts();
            ArrayList<Product> cart = (ArrayList<Product>) session.getAttribute("cart");
            Validator validator = new Validator();
            validator.clear(session);
            for(Product p : productList){
                if(productID.matches(p.getID())){
                    cart.add(p);
                }
            }
            
            request.getRequestDispatcher("viewProducts.jsp").include(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        System.out.println("POST METHOD POST METHOD");
        DBManager manager = (DBManager) session.getAttribute("manager");
        Validator validator = new Validator();
        validator.clear(session);
        ArrayList<Product> cart = (ArrayList<Product>) session.getAttribute("cart");
        
        request.getRequestDispatcher("cart.jsp").include(request, response);
    }

}
