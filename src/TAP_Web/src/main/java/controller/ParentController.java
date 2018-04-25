/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DAOException;
import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import model.InfoParent;
import dao.ParentDAO;
import java.util.ArrayList;
import model.User;

/**
 *
 * @author cyrilcarlin
 */
@WebServlet(name = "ParentController", urlPatterns = {"/Parent"})
public class ParentController extends HttpServlet {
    
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ParentController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ParentController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        displayParentForm(request, response);
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
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        User parentLogin = (User) request.getSession().getAttribute("user");
        ParentDAO parentDAO = new ParentDAO(ds);
        ArrayList<InfoParent> parents = parentDAO.getParentsUser(parentLogin);
        request.setAttribute("parents", parents);
        try {
            if(action.equals("addParent")) {
                String parentName = request.getParameter("surname");
                String parentFirstname = request.getParameter("firstName");
                String parentAddress = request.getParameter("address");
                String parentPhone = request.getParameter("phone");
                String ID =Integer.toString(1+parents.size());
                InfoParent parent = new InfoParent(ID, parentLogin, parentName, parentFirstname, parentPhone, parentAddress );
                parentDAO.addParent(parent);
            }
            else if(action.equals("editParent")) {
                String parentName = request.getParameter("surname");
                String parentFirstname = request.getParameter("firstName");
                String parentAddress = request.getParameter("address");
                String parentPhone = request.getParameter("phone");
                String ID = request.getParameter("parentID");
                InfoParent parent = new InfoParent(ID, parentLogin, parentName, parentFirstname, parentPhone, parentAddress );
                parentDAO.editParent(parent);
            }
            displayParentForm(request, response);
        } catch(DAOException e) {
            erreurBD(request, response, e);
        }
    }
    
    private void displayParentForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        User parentLogin = (User) request.getSession().getAttribute("user");
        if(parentLogin != null) {
            ParentDAO parentDAO = new ParentDAO(ds);
            ArrayList<InfoParent> parents = parentDAO.getParentsUser(parentLogin);
            request.setAttribute("parents", parents);
            request.getRequestDispatcher("parent.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("connection.jsp").forward(request, response);
        }
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

}
