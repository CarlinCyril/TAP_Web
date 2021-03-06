/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.*;
import model.*;
import javax.sql.DataSource;
import javax.annotation.Resource;

/**
 *
 * @author ensimag
 */
@WebServlet(name = "AdminController", urlPatterns = {"/admin"})
public class AdminController extends HttpServlet {
	
    @Resource(name = "jdbc/tap")
    private DataSource ds;

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
            out.println("<title>Servlet AdminController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
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
                String action = request.getParameter("action");
                User adminLogin = (User) request.getSession().getAttribute("user");
                EditActivity editDAO = new EditActivity(ds);
                try {
                	if(action.equals("addAct")) {
                		String name = request.getParameter("name");
                		String cost = request.getParameter("cost");
                		editDAO.addAct(name, Integer.parseInt(cost));
                	}else if(action.equals("delAct")) {
                		String id = request.getParameter("id");
                		editDAO.delAct(id);
                	}else if(action.equals("setCost")) {
                		String id = request.getParameter("id");
                		String cost = request.getParameter("cost");
                		editDAO.setCost(id, Integer.parseInt(cost));
                	}else if(action.equals("addGroup")) {
                	    String ID_Group = "0";
                	    String ID_Activity = request.getParameter("activity");
                	    String dayOfTheWeek = request.getParameter("days");
                	    String startTime = request.getParameter("start");
                	    String endTime = request.getParameter("end");
                	    Integer enrollment = Integer.parseInt(request.getParameter("enrol"));
                	    ArrayList<ClassLevel> levels = new ArrayList<ClassLevel>();
                	    Group group = new Group(ID_Group, ID_Activity, dayOfTheWeek, startTime, endTime, enrollment, levels);
                		editDAO.addGroup(group);
                	}else if(action.equals("delGroup")) {
                		String id = request.getParameter("id");
                		editDAO.delGroup(id);
                	}
               // request.getRequestDispatcher("admin.jsp").forward(request, response);
                } catch(DAOException e) {
                    erreurBD(request, response, e);
                }
               // processRequest(request, response);
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

