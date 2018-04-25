/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ActivityDAO;
import dao.BookingDAO;
import dao.ChildDAO;
import dao.DAOException;
import dao.DietDAO;
import dao.GroupDAO;
import dao.LevelDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import model.Activity;
import model.Booking;
import model.Child;
import model.Diet;
import model.ClassLevel;
import model.Group;
import model.GroupChoices;
import model.User;

/**
 *
 * @author cyrilcarlin
 */
@WebServlet(name = "ChildController", urlPatterns = {"/Child"})
public class ChildController extends HttpServlet {

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
        displayChildForm(request, response);
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
        ChildDAO childDAO = new ChildDAO(ds);
        ArrayList<Child> children = childDAO.getChildrenUser(parentLogin.getUsername());
        request.setAttribute("children", children);
        try {
            if(action.equals("addChild")) {
                String childName = request.getParameter("surname");
                String childFirstname = request.getParameter("firstName");
                Date childBirthdate = Date.valueOf(request.getParameter("birthdate"));
                String childGender = request.getParameter("gender");
                String childDiet = request.getParameter("diet");
                String childLevel = request.getParameter("level");
                String ID =Integer.toString(1+children.size());
                Child child = new Child(ID, parentLogin.getUsername(), childName, childFirstname, 
                        childBirthdate, childGender, childDiet, childLevel);
                childDAO.addChild(child);
            }
            else if(action.equals("editChild")) {
                String childName = request.getParameter("surname");
                String childFirstname = request.getParameter("firstName");
                Date childBirthdate = Date.valueOf(request.getParameter("birthdate"));
                String childGender = request.getParameter("gender");
                String childDiet = request.getParameter("diet");
                String childLevel = request.getParameter("level");
                String ID = request.getParameter("childID");
                Child child = new Child(ID, parentLogin.getUsername(), childName, childFirstname, 
                        childBirthdate, childGender, childDiet, childLevel);
                childDAO.editChild(child);
            }
            else if(action.equals("bookChild")) {
                GroupDAO groupDAO = new GroupDAO(ds);
                BookingDAO bookingDAO = new BookingDAO(ds);
                String childDiet = request.getParameter("diet");
                String ID = request.getParameter("childID");
                
                ArrayList<String> nurseryChoices = new ArrayList<String>();
                if(request.getParameter("nursery0")!=null)
                    nurseryChoices.add("nursery0");
                if(request.getParameter("nursery1")!=null)
                    nurseryChoices.add("nursery1");
                if(request.getParameter("nursery2")!=null)
                    nurseryChoices.add("nursery2");
                if(request.getParameter("nursery3")!=null)
                    nurseryChoices.add("nursery3");
                
                ArrayList<GroupChoices> groupChoices = new ArrayList<GroupChoices>();
                ArrayList<Group> groups = groupDAO.getAllGroups();
                for(Group group : groups) {
                    String wish = request.getParameter(group.toStringWish());
                    if(!wish.equals("0")) {
                        GroupChoices groupChoice = new GroupChoices("",group.getActivity(),group.getID_Group());
                        groupChoices.add(groupChoice);
                    }
                }
                
                Integer cafeteriaChoice = 0;
                if(request.getParameter("cafeteria-mon")!=null)
                    cafeteriaChoice+=1;
                if(request.getParameter("cafeteria-tue")!=null)
                    cafeteriaChoice+=2;
                if(request.getParameter("cafeteria-wed")!=null)
                    cafeteriaChoice+=4;
                if(request.getParameter("cafeteria-thu")!=null)
                    cafeteriaChoice+=8;
                if(request.getParameter("cafeteria-fri")!=null)
                    cafeteriaChoice+=16;
                
                Booking booking = new Booking("", cafeteriaChoice, ID, parentLogin.getUsername(), childDiet);
                bookingDAO.editBooking(booking, groupChoices, nurseryChoices);
            }
            displayChildForm(request, response);
        } catch(DAOException e) {
            erreurBD(request, response, e);
        }
    }
    
    private void displayChildForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        User parentLogin = (User) request.getSession().getAttribute("user");
        if(parentLogin != null) {
            ActivityDAO activityDAO = new ActivityDAO(ds);
            ChildDAO childDAO = new ChildDAO(ds);
            DietDAO dietDAO = new DietDAO(ds);
            LevelDAO levelDAO = new LevelDAO(ds);
            BookingDAO bookingDAO = new BookingDAO(ds);
            GroupDAO groupDAO = new GroupDAO(ds);
            /** Requesting the database through DAO file **/
            List<Activity> listActivities = activityDAO.getAllActivities();
            List<Group> groups = groupDAO.getAllGroups();
            request.setAttribute("groups", groups);
            /** Send the result to the view through the request attribute "activities" **/
            request.setAttribute("activities", listActivities);
            ArrayList<Child> children = childDAO.getChildrenUser(parentLogin.getUsername());
            ArrayList<Diet> diets = dietDAO.getAll();
            ArrayList<ClassLevel> levels = levelDAO.getAll();
            request.setAttribute("diets", diets);
            request.setAttribute("children", children);
            request.setAttribute("levels", levels);
            request.getRequestDispatcher("child.jsp").forward(request, response);
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
