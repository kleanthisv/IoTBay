/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author kleanthis
 */
public class Product {
    
    private String ID;
    private String name;
    private double price;
    private int stock;
    private boolean status; //wether the product is active or not.
    private String category;
    
    //Constructor
    public Product(String ID, String name, double price, int stock, boolean status, String category){
        this.ID = ID;
        this.name = name;
        this.price = price;
        this.stock = stock;
        this.status = status;
        this.category = category;            
    }
    
    public Product(){}
    
    //GETTERS
    public String getID(){
        return this.ID;
    }
    
    public String getName(){
        return this.name;
    }
    
    public double getPrice(){
        return this.price;
    }
    
    public String getCategory(){
        return this.category;
    }
    
    public int getStock(){
        return this.stock;
    }
    
    public boolean isActive(){
        return this.status;
    }
    
    
    //SETTERS
    public void setName(String newName){
        this.name = newName;
    }
    
    public void setPrice(double newPrice){
        this.price = newPrice;
    }
    
    public void setStock(int newStock){
        this.stock = newStock;
    }
    
    
    
    //check if you have enough stock to sell qty amount of product.
    //return true if yes and false if no.
    public boolean sellProduct(int qty){
        if(this.stock - qty >= 0){
            return true;
        }
        else return false;
    }
    
}
