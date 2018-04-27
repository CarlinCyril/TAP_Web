/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ConnexionDAO;
import dao.DAOException;
import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import model.User;

/**
 *
 * @author cyrilcarlin
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class LoginController extends HttpServlet {

    @Resource(name = "jdbc/tap")
    private DataSource ds;
    
    /* pages d’erreurs */
    private void invalidParameters(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/controleurErreur.jsp").forward(request, response);        
    }

    private void erreurBD(HttpServletRequest request,
                HttpServletResponse response, DAOException e)
            throws ServletException, IOException {
        e.printStackTrace(); // permet d’avoir le détail de l’erreur dans catalina.out
        request.setAttribute("erreurMessage", e.getMessage());
        request.getRequestDispatcher("/WEB-INF/bdErreur.jsp").forward(request, response);
    }
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String action = request.getParameter("action");
        try {
        if(action == null)
            request.getRequestDispatcher("/WEB-INF/connection.jsp").forward(request, response);
        else if(action.equals("logIn"))
            logIn(request, response);
        else if(action.equals("logOut"))
            logOut(request, response);
        } catch(DAOException e) {
            erreurBD(request, response, e);
        }
        
        
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void logIn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("user") != null)
            response.sendRedirect("Activity");
        else if(request.getParameter("login").equals("admin")
                && request.getParameter("password").equals("admin")) {
            ConnexionDAO userDAO = new ConnexionDAO(ds);
            User user = userDAO.login(request.getParameter("login"), request.getParameter("password"));
            request.getSession().setAttribute("admin", true);
            request.getSession().setAttribute("login", true);
            response.sendRedirect("Activity");
        }
        else {
            ConnexionDAO userDAO = new ConnexionDAO(ds);
            User user = userDAO.login(request.getParameter("login"), request.getParameter("password"));
            if(user == null) {
                request.setAttribute("login", false);
                request.getRequestDispatcher("/WEB-INF/connection.jsp").forward(request, response);
            }
            else {
                request.getSession().setAttribute("user", user);
                request.getSession().setAttribute("login", true);
                response.sendRedirect("Activity");
            }
        }
    }

    private void logOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session  = request.getSession();
        try
        {      
            session.removeAttribute("login");
            session.invalidate();
        }
        catch (Exception sqle)
        {
            System.out.println("error UserValidateServlet message : " + sqle.getMessage());
            System.out.println("error UserValidateServlet exception : " + sqle);
        }
        request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
    }

}
