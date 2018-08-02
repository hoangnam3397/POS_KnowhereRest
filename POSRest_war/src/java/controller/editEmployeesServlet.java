/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import entity.Employees;
import entity.EmployeesFacadeLocal;
import entity.Roles;
import entity.RolesFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "editEmployeesServlet", urlPatterns = {"/editEmployeesServlet"})
public class editEmployeesServlet extends HttpServlet {
    @EJB 
    private EmployeesFacadeLocal employeesFacade;
    @EJB
    private RolesFacadeLocal rolesFacade;
    String emp_id = "";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       PrintWriter out = response.getWriter();
          String action=request.getParameter("action");
        if(action.equals("get")){
            //load page employees
            emp_id =request.getParameter("emp_id");
            request.setAttribute("empName", employeesFacade.find(emp_id).getEmpName());
            request.setAttribute("email", employeesFacade.find(emp_id).getEmail());
            request.setAttribute("phone", employeesFacade.find(emp_id).getPhone());
            request.setAttribute("role_id", employeesFacade.find(emp_id).getRoleId().getRoleId());
            request.setAttribute("list", rolesFacade.findAll());
            request.getRequestDispatcher("editEmployees.jsp").forward(request, response);
        }
        else if(action.equals("Submit")){
            //edit employees
            String emp_name = request.getParameter("empName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String role_id = request.getParameter("role");
            
            Roles rol =rolesFacade.find(role_id);
            Employees emp = employeesFacade.find(emp_id);
            emp.setEmpName(emp_name);
            emp.setEmail(email);
            emp.setPhone(phone);
       
            emp.setRoleId(rol);
         
            employeesFacade.edit(emp);
            request.getRequestDispatcher("getEmployeesServlet").forward(request, response);
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
