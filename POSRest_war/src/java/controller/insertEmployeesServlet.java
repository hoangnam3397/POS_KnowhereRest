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

@WebServlet(name = "insertEmployeesServlet", urlPatterns = {"/insertEmployeesServlet"})
public class insertEmployeesServlet extends HttpServlet {

    @EJB
    private EmployeesFacadeLocal employeesFacade;
    @EJB
    private RolesFacadeLocal rolesFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int num = employeesFacade.count() + 1;
        String id = num + "";
        int lenNum = 7;
        int lenZero = lenNum - id.length();
        for (int i = 0; i < lenZero; i++) {
            id = "0" + id;
        }
        String emp_id = "EMP" + id;
        String emp_name = request.getParameter("emp_name");
        String role_id = request.getParameter("role");
        Roles rol = rolesFacade.find(role_id);
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int del = 0;
        Employees emp = new Employees();

        emp.setEmpId(emp_id);
        emp.setEmpName(emp_name);
        emp.setUsername(username);
        emp.setPassword(password);
        emp.setEmail(email);
        emp.setPhone(phone);
        emp.setDeleted(del);
        emp.setRoleId(rol);
        employeesFacade.create(emp);
        request.getRequestDispatcher("getEmployeesServlet").forward(request, response);

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
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
