package model.dao;

import model.User;
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
    
    public ArrayList<User> fetchUsers() throws SQLException {
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

}
