/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Employees;
import entity.EmployeesFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nam_Nguyen
 */
@WebServlet(name = "loginServlet", urlPatterns = {"/loginServlet"})
public class loginServlet extends HttpServlet {

    @EJB
    private EmployeesFacadeLocal employeesFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        String username = request.getParameter("username");
        String password = request.getParameter("pass");

        if (employeesFacade.findEmp(username, password).size() > 0) {

            List<Employees> emp = employeesFacade.findEmp(username, password);
            if (emp.get(0).getRoleId().getRoleId().equals("R001")) {              
                session.setAttribute("loginUser",username);
                session.setAttribute("loginImage",emp.get(0).getAvatarlink());
                session.setAttribute("loginPass", password);
                session.setAttribute("loginRole", emp.get(0).getRoleId().getRoleId());
                session.setAttribute("loginEmpId", emp.get(0).getEmpId());
                session.setAttribute("loginNavbar", "admin_navbar.jsp");
                request.getRequestDispatcher("getStoreServlet").forward(request, response);
            } else if (emp.get(0).getRoleId().getRoleId().equals("R002")) {
                session.setAttribute("loginUser",username);
                session.setAttribute("loginImage",emp.get(0).getAvatarlink());
                session.setAttribute("loginPass", password);
                session.setAttribute("loginRole", emp.get(0).getRoleId().getRoleId());
                session.setAttribute("loginEmpId", emp.get(0).getEmpId());
                session.setAttribute("loginNavbar", "waiter_navbar.jsp");
                request.getRequestDispatcher("getStoreServlet").forward(request, response);
            } else if (emp.get(0).getRoleId().getRoleId().equals("R003")) {
                session.setAttribute("loginUser",username);
                session.setAttribute("loginImage",emp.get(0).getAvatarlink());
                session.setAttribute("loginPass", password);
                session.setAttribute("loginRole", emp.get(0).getRoleId().getRoleId());
                session.setAttribute("loginEmpId", emp.get(0).getEmpId());
                session.setAttribute("loginNavbar", "sale_navbar.jsp");
                request.getRequestDispatcher("getStoreServlet").forward(request, response);
            }
        } else {
            out.println("<h2>Login Fail</h2>");
            request.getRequestDispatcher("index.html").forward(request, response);
        }

    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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

}
