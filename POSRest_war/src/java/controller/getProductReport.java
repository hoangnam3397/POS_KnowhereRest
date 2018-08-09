/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.ProductsFacadeLocal;
import entity.VProductReport;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.ParseException;
import java.util.Date;
import java.text.SimpleDateFormat;
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
@WebServlet(name = "getProductReport", urlPatterns = {"/getProductReport"})
public class getProductReport extends HttpServlet {

    @EJB
    ProductsFacadeLocal proFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        //get value
        String pro_id = request.getParameter("productSelect");
        String date = request.getParameter("daterangeP");
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
        List<VProductReport> listVpro =proFacade.vProReport(pro_id,Startdate,Enddate);
        float TotalProfit=0;
        float Price;
        float Quantity;
        Double Discount;
        for (int i = 0; i < listVpro.size(); i++) {
            Price=listVpro.get(i).getPrice().floatValue();
            Quantity=listVpro.get(i).getQuantity();
            Discount=listVpro.get(i).getDiscount();
            TotalProfit+=Price*Quantity*(100-Discount)/100;
        }
        request.setAttribute("TotalProfit", TotalProfit);
        request.setAttribute("dateRange", date);
        request.setAttribute("pro_id", pro_id);
        request.setAttribute("pro_name", proFacade.find(pro_id).getProName());
        request.setAttribute("pro_cate", proFacade.find(pro_id).getCatId().getCatName());
        request.setAttribute("listProReport", proFacade.vProReport(pro_id,Startdate,Enddate));
        request.getRequestDispatcher("getProductReport.jsp").forward(request, response);
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
