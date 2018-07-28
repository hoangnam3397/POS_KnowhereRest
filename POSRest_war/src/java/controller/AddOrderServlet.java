/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.OrderDetails;
import entity.OrderDetailsFacadeLocal;
import entity.Orders;
import entity.OrdersFacadeLocal;
import entity.Products;
import entity.ProductsFacadeLocal;
import entity.TablesFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
 * @author Nam_Nguyen
 */
@WebServlet(name = "AddOrderServlet", urlPatterns = {"/AddOrderServlet"})
public class AddOrderServlet extends HttpServlet {

    @EJB
    ProductsFacadeLocal productFacade;
    @EJB
    OrdersFacadeLocal ordersFacade;
    @EJB
    OrderDetailsFacadeLocal orderDetailsFacade;
    @EJB
    TablesFacadeLocal tableFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String tableid=request.getParameter("tableid");
        Orders orders = null;
        int num = ordersFacade.count() + 1;
        String id = num + "";
        int lenNum = 7;
        int lenZero = lenNum - id.length();
        for (int i = 0; i < lenZero; i++) {
            id = "0" + id;
        }
        String orderid = "OD" + id;
        List<OrderDetails> listOrderDetail = orderDetailsFacade.findByOrderId(orderid);
        if (listOrderDetail.size() != 0) {
            Date date = new Date();
            Calendar c = Calendar.getInstance();
            c.setTime(date);
            c.add(Calendar.DATE, 1);
            date = c.getTime();
            /*orders.setOrderId(orderid);
            orders.setPaymethod("unpaid");
            orders.setDeleted(0);
            orders.setOrdertime(date);
            orders.setSubtotal(new BigDecimal(0));
            orders.setOrderTax(0);
            orders.setDiscount(0);
            orders.setTotal(new BigDecimal(0));
            orders.setTabId(tableFacade.find(request.getParameter("tableid")));
            orders.setEmpId(null);
            orders.setCusId(null);*/
            orders=new Orders(orderid, "unpaid",date, 0, BigDecimal.ZERO, 0, 0, BigDecimal.ZERO,null,null,tableFacade.find(tableid));
            ordersFacade.create(orders);

        }
        /*float subtotal = orderDetailsFacade.sumPrice(orderid).floatValue();
         float ordertax = Float.parseFloat(request.getParameter("ordertax"));
         float discountValue = Float.parseFloat(request.getParameter("discount"));
         float total = subtotal - (subtotal * ordertax) - (subtotal * discountValue);
         BigDecimal totalValue = new BigDecimal(total);
        
         //DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");*/

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
