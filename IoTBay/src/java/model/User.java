/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;

/**
 *
 * @author kleanthis
 */
public class User implements Serializable{
    private String FName;
    private String LName;
    private String email;
    private String DOB;
    private String phoneNumber;
    private String password;
    private String userType;
    private String streetAddress;
    private String country;
    private String postcode;
    private String locality;
    private boolean isActive;
    
    //Default constructor used to create guests.
    public User(){
        this.userType = "Guest";
    }
    
    //Constructor for Users.
    public User(String email, String fName, String lName, String DOB , String phoneNumber, String password){
        this.email = email;
        this.FName = fName;
        this.LName = lName;
        this.password = password;
        this.DOB = DOB;
        this.phoneNumber = phoneNumber;
        this.userType = "Customer";
    }
  
    public void setFName(String FName){
        this.FName = FName;
    }
    
    public void setLName(String LName){
        this.LName = LName;
    }
    
    public void setEmail(String email){
        this.email = email;
    }
    
    public void setPhoneNumber(String phoneNum){
        this.phoneNumber = phoneNum;
    }
    
    public void setPassword(String password){
        this.password = password;
    }
    
    public String getFName(){
        return this.FName;
    }
    
    public String getLName(){
        return this.LName;
    }
    
    public String getEmail(){
        return this.email;
    }
    
    public String getPhoneNum(){
        return this.phoneNumber;
    }
    
    public String getPassword(){
        return this.password;
    }
    
}

