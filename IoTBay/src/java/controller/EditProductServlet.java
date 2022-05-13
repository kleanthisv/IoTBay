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

public class EditProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        String productID = request.getParameter("ID");
        ArrayList<Product> productList = (ArrayList<Product>) session.getAttribute("products");
        Product productSelection = null;
        for(Product p : productList){
            if(productID.matches(p.getID())){
                productSelection = p;
            }
        }
        
        session.setAttribute("productSelected",productSelection);
        session.setAttribute("isEdited", "");
        
        request.getRequestDispatcher("editProduct.jsp").include(request, response);
    }
    
    //ONLY GETS EXECUTED WHEN EDIT BUTTON IS PRESSED ON FORM.
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        Product p = (Product) session.getAttribute("productSelected");

        String newName = request.getParameter("newName");
        String newCategory = request.getParameter("newCategory");
        System.out.println(newName);
        //double newPrice = (String) request.getAttribute("newPrice");
        //int newStock = (Integer) request.getAttribute("newStock");
        String newID = (String) request.getAttribute("newID");
        
        try {
            manager.updateProduct(p.getID(),newID,newName,50,5,true,newCategory);
        } catch (SQLException ex) {
            Logger.getLogger(EditProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        session.setAttribute("productSelected", null);
        request.getRequestDispatcher("CatalogueServlet").include(request, response);
    }
    
    //functions to edit product which use the manager
}
