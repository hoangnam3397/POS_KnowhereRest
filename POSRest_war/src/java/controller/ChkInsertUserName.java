package controller;



/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import entity.Employees;
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
 * @author Duy
 */
@WebServlet(urlPatterns = {"/ChkInsertUserName"})
public class ChkInsertUserName extends HttpServlet {
    @EJB
    EmployeesFacadeLocal empFacade;
  
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
        int num = empFacade.count() + 1;
            String id = num + "";
            int lenNum = 5;
            int lenZero = lenNum - id.length();
            for (int i = 0; i < lenZero; i++) {
                id = "0" + id;
            }
        String emp_id = "EMP" + id;        
        String name= request.getParameter("username");
        if (empFacade.chkUserUnique(emp_id,name)==true) {
             response.getWriter().write("<img src=\"images/available.png\" /><span id=\"userName-resultError\" value=\"true\" style=\"color: green\">You can use username. </span>");
       } else {           
            response.getWriter().write("<img src=\"images/not-available.png\" /><span id=\"userName-resultError\" value=\"false\" style=\"color: red\">Username already exists.</span>");
       }
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
