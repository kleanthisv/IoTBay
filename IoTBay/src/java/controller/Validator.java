package controller;

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;

public class Validator implements Serializable {

    private String emailPattern = "([a-zA-Z0-9]+)(([._-])([a-zA-Z0-9]+))*(@)([a-z]+)(.)([a-z]{3})((([.])[a-z]{0,2})*)";
    private String namePattern = "[A-Z][a-z]*";
    private String idPattern = "[a-zA-Z0-9]+";
    private String passwordPattern = "[a-z0-9]{4,}";
    private String phonePattern = "\\d{10}";
    private String datePattern = "^\\d{4}-\\d{2}-\\d{2}$";
    private String intPattern = "^\\d+$";
    private String doublePattern = "^(\\d+[.])?\\d+$";

    public Validator() {
    }

    public boolean validate(String pattern, String input) {
        Pattern regEx = Pattern.compile(pattern);
        Matcher match = regEx.matcher(input);

        return match.matches();
    }
    
    public boolean validateID(String input){
        return validate(idPattern,input);
    }
    
    public boolean validateInt(String input){
        return validate(intPattern,input);
    }
    
    public boolean validateDouble(String input){
        return validate(doublePattern,input);
    }

    public boolean checkEmpty(String string) {
        return string.isEmpty();
    }

    public boolean validateEmail(String email) {
        return validate(emailPattern, email);
    }

    public boolean validateName(String name) {
        return validate(namePattern, name);
    }

    public boolean validatePassword(String password) {
        return validate(passwordPattern, password);
    }

    public boolean validatePhone(String phone){
        return validate(phonePattern, phone);
    }

    public boolean validateDate(String date){
        return validate(datePattern, date);
    }

    public void clear(HttpSession session){
        session.setAttribute("errors", null);
        session.setAttribute("isEdited",null);
        session.setAttribute("changed",null);
        session.setAttribute("editUserErrors", null);
    }



}
