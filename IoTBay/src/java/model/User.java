/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;

/**
 *
 * @author klean
 */
public class User implements Serializable{
    private String name; //to be removed in later releases.
    private String FName;
    private String LName;
    private String email;
    private String DOB;
    private String phoneNumber;
    private String password;
    private String streetAddress;
    private String country;
    private String postcode;
    private String locality;
    private boolean isActive;
    
    public User(){}

    public void setName(String name){
        this.name = name;
    }
    
    public String getName(){
        return this.name;
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

