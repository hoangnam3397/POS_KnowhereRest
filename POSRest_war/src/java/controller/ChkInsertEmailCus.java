package controller;

import entity.CustomersFacadeLocal;
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
@WebServlet(name = "ChkInsertEmailCus", urlPatterns = {"/ChkInsertEmailCus"})
public class ChkInsertEmailCus extends HttpServlet {
    
    @EJB 
    private CustomersFacadeLocal customersFacade;
    
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
            int num = customersFacade.count() + 1;
            String id = num + "";
            int lenNum = 7;
            int lenZero = lenNum - id.length();
            for (int i = 0; i < lenZero; i++) {
                id = "0" + id;
            }
        String cus_id = "Cus" + id;        
        String email= request.getParameter("email");
        if (customersFacade.chkEmailCusUnique(cus_id,email)==true) {
            response.getWriter().write("<img src=\"images/available.png\" /><span id=\"Email-resultError\" value=\"true\" style=\"color: green\">You can use Email. </span>");
       } else {           
            response.getWriter().write("<img src=\"images/not-available.png\" /><span id=\"Email-resultError\" value=\"false\" style=\"color: red\">Email already exists.</span>");
       }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
