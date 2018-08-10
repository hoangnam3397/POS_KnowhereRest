package controller;

import entity.Employees;
import entity.EmployeesFacadeLocal;
import entity.RolesFacade;
import java.io.IOException;
import java.io.PrintWriter;
import static java.security.AccessController.getContext;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "changPWServlet", urlPatterns = {"/changPWServlet"})
public class changPWServlet extends HttpServlet {

    @EJB
    private EmployeesFacadeLocal employeesFacade;

    String emp_id = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String changepw = request.getParameter("changepw");
       
        if (changepw.equals("get")) 
        {
            emp_id = request.getParameter("emp_id");
            request.setAttribute("user", employeesFacade.find(emp_id).getUsername());
            request.setAttribute("password", employeesFacade.find(emp_id).getPassword());
            request.getRequestDispatcher("changPW.jsp").forward(request, response);
        } 
        else if (changepw.equals("submit")) 
        {
            String pwnew = request.getParameter("newpw");   
         
            Employees emp = employeesFacade.find(emp_id);
            emp.setPassword(pwnew);   
 
            employeesFacade.edit(emp);
            request.getRequestDispatcher("getEmployeesServlet").forward(request, response);
        }

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
    }

}
