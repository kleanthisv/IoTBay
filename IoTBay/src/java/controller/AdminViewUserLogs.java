package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Log;
import model.dao.*;

public class AdminViewUserLogs extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        session.setAttribute("logSelected", null);
        session.setAttribute("errors", null);
        try {
            ArrayList<Log> logs = manager.getAllLogs();
            session.setAttribute("logs", logs);
        } catch (SQLException ex) {
            Logger.getLogger(AdminViewUserLogs.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("adminViewUserLog.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        Validator validator = new Validator();
        validator.clear(session);
        ArrayList<Log> logs = null;

        try {
            logs = manager.getAllLogs();
            session.setAttribute("logs", logs);
        } catch (SQLException ex) {
            Logger.getLogger(AdminViewUserLogs.class.getName()).log(Level.SEVERE, null, ex);
        }

        //filter user list based on date
        String filterTerm = request.getParameter("adminSearch");
        ArrayList<Log> filteredLogs = new ArrayList();
        //reset search error upon reopening view logs
        session.setAttribute("error", null);
        if (filterTerm != null) {

            for (Log l : logs) {
                if (l.getLogin().contains(filterTerm)) {
                    filteredLogs.add(l);
                } else if (l.getLogout() != null) {
                    if (l.getLogout().contains(filterTerm)) {
                        filteredLogs.add(l);
                    }
                }

            }

        }
        if (filteredLogs.isEmpty() && filterTerm != null) {
            session.setAttribute("errors", "No logs found when searching for: " + filterTerm);
        } else if (filteredLogs.size() > 0) {
            session.setAttribute("logs", filteredLogs);
        }

        request.getRequestDispatcher("adminViewUserLog.jsp").include(request, response);
    }

}
