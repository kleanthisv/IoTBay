/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

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
    private String userType; //type can be "GUEST" "CUSTOMER" "STAFF" "ADMIN"
    private String streetAddress;
    private String country;
    private String postcode;
    private String locality;
    private boolean isActive;
    
    //Default constructor used to create guests.
    public User(){
        this.userType = "GUEST";
    }
    
    //Constructor for Users.
    public User(String email, String fName, String lName, String DOB , String phoneNumber, String password, String type, boolean active){
        this.email = email;
        this.FName = fName;
        this.LName = lName;
        this.password = password;
        this.DOB = DOB;
        this.phoneNumber = phoneNumber;
        this.userType = type;
        this.isActive = active;
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
    
    public void setType(String type){
        this.userType = type;
    }
    
    public void setPhoneNumber(String phoneNum){
        this.phoneNumber = phoneNum;
    }
    
    public void setPassword(String password){
        this.password = password;
    }
    
    public void setActive(boolean active) {
        this.isActive = active;
    }
    
    public void setDOB(String DOB) {
        this.DOB = DOB;
    }
    
    public void setPhoneNum(String phoneNum) {
        this.phoneNumber = phoneNum;
    }
    
    public String getDOB(){
        return this.DOB;
    }

    public String getFName(){
        return this.FName;
    }
    
    public String getLName(){
        return this.LName;
    }
    
    public String getType(){
        return this.userType;
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
    
    public boolean isActive() {
        return this.isActive;
    }
    
    public boolean isStaff(){
        return userType.equals("STAFF");
    }
    
    public boolean isGuest(){
        return userType.equals("GUEST");
    }
    
    public boolean isCustomer(){
        return userType.equals("CUSTOMER");
    }
    
    public boolean isAdmin() {
        return userType.equals("ADMIN");
    }
}

