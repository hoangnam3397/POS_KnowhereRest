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

@WebServlet(name = "editCustomerServlet", urlPatterns = {"/editCustomerServlet"})
public class editCustomerServlet extends HttpServlet {

    @EJB
    private CustomersFacadeLocal customersFacade;
    String cus_id = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");
        cus_id = request.getParameter("cus_id");
        if (action.equals("get")) {
            //load page editProduct
            request.setAttribute("cusid", customersFacade.find(cus_id).getCusId());
            request.setAttribute("phone", customersFacade.find(cus_id).getPhone());
            request.setAttribute("email", customersFacade.find(cus_id).getEmail());
            request.setAttribute("dis", customersFacade.find(cus_id).getDiscount());

            request.getRequestDispatcher("editCustomer.jsp").forward(request, response);
        } else if (action.equals("Submit")) {
            //edit Product
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            double discount = Double.parseDouble(request.getParameter("discount"));

            Customers cus = customersFacade.find(cus_id);
            cus.setPhone(phone);
            cus.setEmail(email);
            cus.setDiscount(discount);
           
            customersFacade.edit(cus);
            request.getRequestDispatcher("getCustomerServlet").forward(request, response);
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
