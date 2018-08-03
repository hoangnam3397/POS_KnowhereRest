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
import entity.Tables;
import entity.TablesFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
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
@WebServlet(name = "AddnewSaleServlet", urlPatterns = {"/AddnewSaleServlet"})
public class AddnewSaleServlet extends HttpServlet {

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
        String tableid = request.getParameter("tableid");
        String paymethod=request.getParameter("paymethod");
        Double discount=Double.parseDouble(request.getParameter("discount"));
        Double tax=Double.parseDouble(request.getParameter("tax"));
        Tables tables = tableFacade.find(tableid);
        Orders orders = ordersFacade.getByTableid(tableid);
        List<OrderDetails> list = orderDetailsFacade.findByOrderId(orders.getOrderId());
        float subt=0;
        for (OrderDetails o : list) {
            subt=subt+(o.getPrice().floatValue()*o.getQuantity());
        }
        BigDecimal subtValue=BigDecimal.valueOf(subt);
        orders.setPaymethod(paymethod);
        orders.setDeleted(1);
        orders.setSubtotal(subtValue);
        orders.setDiscount(discount/100);
        orders.setOrderTax(tax/100);
        float total=(float) (subt-(subt*(discount/100))+(subt*(tax/100)));
        BigDecimal totalValue=BigDecimal.valueOf(total);
        orders.setTotal(totalValue);
        ordersFacade.edit(orders);
        tables.setStatus(false);
        tableFacade.edit(tables);
        
        
        
        
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
