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

public class AddProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            DBManager manager = (DBManager) session.getAttribute("manager");
            ArrayList<Product> productList = manager.getAllProducts();
            Validator validator = new Validator();
            validator.clear(session);
            
            request.getRequestDispatcher("addProduct.jsp").include(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //ONLY GETS EXECUTED WHEN EDIT BUTTON IS PRESSED ON FORM.
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        Validator validator = new Validator();
        validator.clear(session);
        
        ArrayList<String> errors = new ArrayList();
        String newName = (String) request.getParameter("newName");
        String newCategory = (String) request.getParameter("newCategory");
        String newID = (String) request.getParameter("newID");
        String price = (String) request.getParameter("newPrice");
        String stock = (String) request.getParameter("newStock");
        int newStock = 0;
        double newPrice = 0;
        
        if(validator.validateInt(stock)){
            newStock = Integer.parseInt(stock);
        }else{
            errors.add("Error: Stock level must be an integer.");
        }
        if(validator.validateDouble(price)){
            newPrice = Double.parseDouble(price);
        }else{
            errors.add("Error: Price must be a double.");
        }
        if(!validator.validateID(newID)){
            errors.add("Error: Product ID cannot contain spaces or special characters.");
        }

        if (errors.isEmpty()) {
            try {
                manager.addProduct(newID, newName, newPrice, newStock, true, newCategory);
                Product p = new Product(newID,newName,newPrice,newStock,true,newCategory);
                session.setAttribute("isEdited","Product successfully added.");
                System.out.println(session.getAttribute("isEdited"));
                request.getRequestDispatcher("addProduct.jsp").include(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(EditProductServlet.class.getName()).log(Level.SEVERE, null, ex);
                errors.add("Error: A product already exists under that ID.");
                session.setAttribute("errors", errors);
                request.getRequestDispatcher("addProduct.jsp").include(request, response);
            }
        }
        else{
            session.setAttribute("errors", errors);
            request.getRequestDispatcher("addProduct.jsp").include(request, response);
        }


    }
}
