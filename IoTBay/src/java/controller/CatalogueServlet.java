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

public class CatalogueServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session != null) System.out.println("manager loaded");
        else{ System.out.println("problem with manager loading");}
        DBManager manager = (DBManager) session.getAttribute("manager");
        try {
            ArrayList<Product> products = manager.getAllProducts();
            session.setAttribute("products", products);
        } catch (SQLException ex) {
            Logger.getLogger(CatalogueServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("viewProducts.jsp").include(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        System.out.println("POST METHOD POST METHOD");
        DBManager manager = (DBManager) session.getAttribute("manager");
        try {
            ArrayList<Product> products = manager.getAllProducts();
            session.setAttribute("products", products);
        } catch (SQLException ex) {
            Logger.getLogger(CatalogueServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("viewProducts.jsp").include(request, response);
    }

}
