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


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String emp_id = request.getParameter("empid");
        String oldpass = request.getParameter("oldpassword");
        String newpass = request.getParameter("password");

        if (employeesFacade.find(emp_id).getPassword().equals(oldpass)) {
            Employees emp = employeesFacade.find(emp_id);
            emp.setPassword(newpass);
            employeesFacade.edit(emp);
            request.getRequestDispatcher("getStoreServlet").forward(request, response);
        } else {
            request.getRequestDispatcher("changPW.jsp").forward(request, response);
            
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
