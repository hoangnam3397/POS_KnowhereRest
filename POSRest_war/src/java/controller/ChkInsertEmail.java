/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import entity.EmployeesFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tuan
 */
@WebServlet(name = "ChkInsertEmail", urlPatterns = {"/ChkInsertEmail"})
public class ChkInsertEmail extends HttpServlet {

    @EJB 
    private EmployeesFacadeLocal employeesFacade;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
    
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
         int num = employeesFacade.count() + 1;
            String id = num + "";
            int lenNum = 5;
            int lenZero = lenNum - id.length();
            for (int i = 0; i < lenZero; i++) {
                id = "0" + id;
            }
        String emp_id = "EMP" + id;        
        String email= request.getParameter("email");
        if (employeesFacade.chkEmailUnique(emp_id,email)==true) {
            response.getWriter().write("<img src=\"images/available.png\" /><span style=\"color: green\">You can use Email. </span>");
       } else {           
            response.getWriter().write("<img src=\"images/not-available.png\" /><span style=\"color: red\">Email already exists.</span>");
       }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
