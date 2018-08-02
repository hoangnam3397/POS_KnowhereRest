package controller;

import entity.Customers;
import entity.CustomersFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "insertCustomerServlet", urlPatterns = {"/insertCustomerServlet"})
public class insertCustomerServlet extends HttpServlet {

    @EJB
    private CustomersFacadeLocal customersFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        int num = customersFacade.count() + 1;
        String id = num + "";
        int lenNum = 8;
        int lenZero = lenNum - id.length();
        for (int i = 0; i < lenZero; i++) {
            id = "0" + id;
        }
        String cus_id = "Cus" + id;
        String cus_name = request.getParameter("cus_name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        double discount = Double.parseDouble(request.getParameter("discount"));
        
        Customers  cus = new Customers(cus_id, cus_name, phone, email, discount);

        customersFacade.create(cus);
        
        request.getRequestDispatcher("getCustomerServlet").forward(request, response);

    }

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
