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

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        request.setAttribute("list", rolesFacade.findAll());
        request.getRequestDispatcher("insertEmployees.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        int num = employeesFacade.count() + 1;
        String id = num + "";
        int lenNum = 7;
        int lenZero = lenNum - id.length();
        for (int i = 0; i < lenZero; i++) {
            id = "0" + id;
        }
        String emp_id = "EMP" + id;
        String emp_name = request.getParameter("emp_name");
        String role_id = request.getParameter("rol");
        Roles rol = rolesFacade.find(role_id);
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int del = 0;
        Employees emp = new Employees(emp_id, emp_name, username, password, email, phone, null, del, rol);
        employeesFacade.create(emp);
        request.getRequestDispatcher("getEmployeesServlet").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
