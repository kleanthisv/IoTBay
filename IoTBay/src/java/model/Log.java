/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;

/**
 *
 * @author klean
 */
public class Log {

    private String login;
    private String logout;
    private String email;

    public Log() {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        this.login = dtf.format(now);
    }
    
    public Log(String email, String login, String logout){
        this.login = login;
        this.logout = logout;
        this.email = email;
    }
    
    public String getLogin(){
        return this.login;
    }
    
    public void setLogout(String logout){
        this.logout = logout;
    }
    
    public String getLogout(){
        return this.logout;
    }
}
