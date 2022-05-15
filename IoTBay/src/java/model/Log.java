/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;
import model.dao.DBManager;

/**
 *
 * @author klean
 */
public class Log {

    private String login;
    private String logout;
    private String email;
    private String ID;

    //Used in servlets.
    public Log(String email) {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        this.email = email;
        this.login = dtf.format(now);
    }
    
    //to be used by DBManager
    public Log(String ID, String email, String login, String logout){
        this.ID = ID;
        this.login = login;
        this.logout = logout;
        this.email = email;
    }
    
    public String getEmail(){
        return this.email;
    }
    
    public String getID(){
        return this.ID;
    }
    
    public String getLogin(){
        return this.login;
    }
    
    public void setLogout(){
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        this.logout = dtf.format(now);
    }
    
    public String getLogout(){
        return this.logout;
    }
}
