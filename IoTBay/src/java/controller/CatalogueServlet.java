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
        DBManager manager = (DBManager) session.getAttribute("manager");
        session.setAttribute("productSelected", null);
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
        Validator validator = new Validator();
        validator.clear(session);
        ArrayList<Product> products = null;
        
        try {
            products = manager.getAllProducts();
            session.setAttribute("products", products);
        } catch (SQLException ex) {
            Logger.getLogger(CatalogueServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        //FILTER PRODUCT LIST BASED ON TERM
        String filterTerm = request.getParameter("productSearch");
        ArrayList<Product> filteredProducts = new ArrayList();
        if (filterTerm != null) {
            
            for (Product p : products) {
                if (p.getName().toLowerCase().contains(filterTerm.toLowerCase())) {
                    filteredProducts.add(p);
                }
            }
            
            
        }
        if(filteredProducts.size() == 0 && filterTerm != null){
                session.setAttribute("searchError", "No products found when searching for: " + filterTerm);
        }
        else if(filteredProducts.size() > 0){
                session.setAttribute("products", filteredProducts);
        }
        
        request.getRequestDispatcher("viewProducts.jsp").include(request, response);
    }

}
