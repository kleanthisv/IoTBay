package model.dao;

import model.User;
import model.Product;
import java.sql.*;
import java.util.ArrayList;

/* 
* DBManager is the primary DAO class to interact with the database. 
* Complete the existing methods of this classes to perform CRUD operations with the db.
 */
public class DBManager {

    private Statement st;

    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    
    //USERS DATABASE MANAGEMENT
    
    //Find user by email and password in the database   
    public User findUser(String email, String password) throws SQLException {
        String fetch = "SELECT * FROM ISD.USERS WHERE USEREMAIL = '" + email + "' AND USERPASSWORD = '" + password + "'";
        ResultSet rs = st.executeQuery(fetch);
        
        while(rs.next()) {
            String userEmail = rs.getString(1);
            String fName = rs.getString(2);
            String lName = rs.getString(3);
            String DOB = rs.getString(4);
            String phoneNum = rs.getString(5);
            String userPassword = rs.getString(6);
            String userType = rs.getString(7);
            
            if(email.matches(userEmail) && userPassword.matches(password)){
                return new User(userEmail, fName, lName, DOB, phoneNum, userPassword);
            }
        }
        return null;
    }

    //Add a user-data into the database   
    public void addUser(String email, String fName, String lName , String DOB, String phoneNum, String password) throws SQLException {
        st.executeUpdate("INSERT INTO ISD.USERS" + " VALUES ('" + email + "', '" + fName + "', '" + lName + "', '" + DOB + "', '" + phoneNum  + "', '" + password + "')");
    }

    //update a user details in the database   
    public void updateUser(String email, String fName, String lName , String DOB, String phoneNum, String password) throws SQLException {
        st.executeUpdate("UPDATE ISD.USERS" + " SET USERFNAME ='" + fName + "', USERLNAME ='" + lName + "', USERDOB='" + 
                        DOB + "', USERPHONENUMBER='" + phoneNum  + "', USERPASSWORD='" + password + "' WHERE USEREMAIL ='" + email + "'");
    }

    //delete a user from the database   
    public void deleteUser(String email) throws SQLException {
        st.executeUpdate("DELETE FROM ISD.USERS WHERE USEREMAIL ='" + email + "'");
    }
    
    public ArrayList<User> getAllUsers() throws SQLException {
        String fetch = "SELECT * FROM ISD.USERS";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<User> temp = new ArrayList();
        
        while(rs.next()){
            String email = rs.getString(1);
            String fName = rs.getString(2);
            String lName = rs.getString(3);
            String DOB = rs.getString(4);
            String phoneNum = rs.getString(5);
            String password = rs.getString(6);
            temp.add(new User(email,fName,lName,DOB,phoneNum,password));
        }
        
        return temp;
    }
    
    
    //PRODUCTS DATABASE MANAGEMENT
    
    //craate a new Product in the DB.
    public void addProduct(String SKU, String productName, double productPrice, int productStock, boolean productStatus, String productCategory) throws SQLException{
        st.executeUpdate("INSERT INTO ISD.PRODUCTS" + " VALUES ('" + SKU.toUpperCase() + "', '" + productName + "', '" + productPrice + "', '" + productStock + "', " + productStatus  + ", '" + productCategory.toUpperCase() + "')");
    }
    
    //takes param SKU of type string and returns Product which has unique SKU in DB
    public Product findProduct(String SKU) throws SQLException {
        String fetch = "SELECT * FROM ISD.PRODUCTS WHERE PRODUCTSKU = '" + SKU + "'";
        ResultSet rs = st.executeQuery(fetch);
        
        while(rs.next()) {
            String productSKU = rs.getString(1);
            String name = rs.getString(2);
            double price = rs.getDouble(3);
            int stock = rs.getInt(4);
            boolean status = rs.getBoolean(5);
            String category = rs.getString(6);
            
            if(SKU.toUpperCase().matches(productSKU.toUpperCase())){
                return new Product(productSKU, name, price, stock, status, category);
            }
        }
        return null;
    }
    
    //returns an ArrayList<Product> of all products currently stored in the DB.
    public ArrayList<Product> getAllProducts() throws SQLException{
        String fetch = "SELECT * FROM ISD.PRODUCTS";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<Product> temp = new ArrayList();
        
        while(rs.next()){
            String SKU = rs.getString(1);
            String name = rs.getString(2);
            double price = rs.getDouble(3);
            int stock = rs.getInt(4);
            boolean status = rs.getBoolean(5);
            String category = rs.getString(6);
            temp.add(new Product(SKU,name,price,stock,status,category));
        }
        
        return temp;
    }
    
    // Checks whether item is in the products
    public boolean checkItem(String productname) throws SQLException {
    String query = "SELECT * FROM IoTBay.Product WHERE (PRODUCTNAME) = '"+productname+"'";
    ResultSet rs = st.executeQuery(query);

    while (rs.next()) {
        String item_productname = rs.getString(2);

        if (item_productname.equals(productname)) {
            return true;
        }
    }
    return false;
    }
    
    public int fetchProductid(String productname) throws SQLException {
        String query = "SELECT PRODUCTID FROM IotBay.Product WHERE PRODUCTNAME = '"+productname+"'";
        ResultSet rs = st.executeQuery(query);
        int productid = 0;
        
        while (rs.next()) {
            productid = rs.getInt(1);
        }
        //return null;
        return productid;
    }

    public void updateItem(int fetchProductid, String productname, Double price) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
  
    
    
    
}



