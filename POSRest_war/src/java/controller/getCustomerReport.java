/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import entity.CustomersFacadeLocal;
import entity.SalesByCustomer;
import entity.VProductReport;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
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
@WebServlet(name = "getCustomerReport", urlPatterns = {"/getCustomerReport"})
public class getCustomerReport extends HttpServlet {

    @EJB CustomersFacadeLocal cusFacade;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        //get value
        String cus_id = request.getParameter("cusSelect");
        String date = request.getParameter("daterange");
        //
        String dateValue1 = date.substring(0, 10);
        String dateValue2 = date.substring(13, 23);
        SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
        Date Startdate = new Date();
        Date Enddate = new Date();
        try {
            Startdate = formatter.parse(dateValue1);
            Enddate = formatter.parse(dateValue2);        
            
        } catch (ParseException e) {
            e.printStackTrace();
        }
        List<SalesByCustomer> listVcus =cusFacade.vCusReport(cus_id,Startdate,Enddate);
        float Total=0;
        float Price;
        float Quantity;
        Double Discount;
        for (int i = 0; i < listVcus.size(); i++) {
            Price=listVcus.get(i).getPrice().floatValue();
            Quantity=listVcus.get(i).getQuantity();
            Discount=listVcus.get(i).getDiscount();
            Total+=Price*Quantity*(100-Discount)/100;
        }
        request.setAttribute("Total", Total);
        request.setAttribute("dateRange", date);
        request.setAttribute("cus_id", cus_id);
        request.setAttribute("cus_name", cusFacade.find(cus_id).getCusName());
        request.setAttribute("email", cusFacade.find(cus_id).getEmail());
        request.setAttribute("phone", cusFacade.find(cus_id).getPhone());
        request.setAttribute("listCusReport", cusFacade.vCusReport(cus_id,Startdate,Enddate));
        request.getRequestDispatcher("getCustomerReport.jsp").forward(request, response);
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
