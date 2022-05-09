/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.*;

import java.util.*;

import java.util.logging.*;
import model.User;
import model.dao.*;
public class TestDB {

    private static Scanner in = new Scanner(System.in);

    public static void main(String[] args) {

        //testAdd();
        
        //testFind();       

        testDelete();
    }
    
    
    //takes input from console and attemps to add a user to the DB.
    //author: kleanthis
    private static void testAdd(){
        try {

            DBConnector connector = new DBConnector();

            Connection conn = connector.openConnection();

            DBManager db = new DBManager(conn);
            
            System.out.println("Testing add user.");
            
            System.out.print("User email: ");

            String email = in.nextLine();

            System.out.print("User first name: ");

            String fName = in.nextLine();

            System.out.print("User last name: ");

            String lName = in.nextLine();

            System.out.print("User DOB in YYYY-MM-DD: ");

            String DOB = in.nextLine();

            System.out.print("User phone: ");

            String phoneNum = in.nextLine();
            
            System.out.print("User password: ");

            String password = in.nextLine();

            db.addUser(email,fName,lName,DOB,phoneNum,password);

            System.out.println("User is added to the database.");

            connector.closeConnection();

        } catch (ClassNotFoundException | SQLException ex) {

            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error adding user.");
        }
    }
    
    //takes email and password input through console and attempts to find a user.
    //author: kleanthis
    private static void testFind(){
        try{
            
            System.out.println("Testing login / find user");
            
            DBConnector connector = new DBConnector();

            Connection conn = connector.openConnection();

            DBManager db = new DBManager(conn);

            System.out.print("User email: ");

            String email = in.nextLine();

            System.out.print("User password: ");

            String password = in.nextLine();
            
            User a = db.findUser(email, password);
            if(a == null){
                System.out.println("Returned null");
            }
            else{
                System.out.print("Name: ");
                System.out.println(a.getFName());
                System.out.println("Login / Find was successful.");
            }
            connector.closeConnection();
            
        } catch (ClassNotFoundException | SQLException ex){
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error with login / find user.");
        }
    }
    
    
    //takes email input from console and attempts to delete a user.
    //author: kleanthis
    private static void testDelete(){
        try{
            
            System.out.println("Testing Delete");
            
            DBConnector connector = new DBConnector();

            Connection conn = connector.openConnection();

            DBManager db = new DBManager(conn);

            System.out.print("User email: ");

            String email = in.nextLine();
            
            db.deleteUser(email);
            
            System.out.println("Deleted successfully.");
            
            connector.closeConnection();
            
        } catch (ClassNotFoundException | SQLException ex){
            System.out.println("Error with delete.");
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
