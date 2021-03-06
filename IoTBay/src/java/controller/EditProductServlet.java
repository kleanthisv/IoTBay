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
        try {
            HttpSession session = request.getSession();
            DBManager manager = (DBManager) session.getAttribute("manager");
            String productID = request.getParameter("ID");
            ArrayList<Product> productList = manager.getAllProducts();
            Validator validator = new Validator();
            validator.clear(session);
            Product productSelection = null;
            for(Product p : productList){
                if(productID.matches(p.getID())){
                    productSelection = p;
                }
            }
            session.setAttribute("productSelected",productSelection);
            
            request.getRequestDispatcher("editProduct.jsp").include(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //ONLY GETS EXECUTED WHEN EDIT BUTTON IS PRESSED ON FORM.
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        Product p = (Product) session.getAttribute("productSelected");
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
            System.out.println("stock ok");
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
                manager.updateProduct(p.getID(), newID, newName, newPrice, newStock, true, newCategory);
                p.setID(newID);
                p.setName(newName);
                p.setPrice(newPrice);
                p.setStock(newStock);
                p.setCategory(newCategory);
            } catch (SQLException ex) {
                Logger.getLogger(EditProductServlet.class.getName()).log(Level.SEVERE, null, ex);
                errors.add("Error: A product already exists under that ID.");
                session.setAttribute("errors", errors);
                request.getRequestDispatcher("editProduct.jsp").include(request, response);
            }
            session.setAttribute("isEdited","Product successfully edited.");
            System.out.println(session.getAttribute("isEdited"));
            request.getRequestDispatcher("editProduct.jsp").include(request, response);
        }
        else{
            session.setAttribute("errors", errors);
            request.getRequestDispatcher("editProduct.jsp").include(request, response);
        }


    }
}
