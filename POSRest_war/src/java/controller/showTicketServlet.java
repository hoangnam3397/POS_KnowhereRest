/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.CustomersFacadeLocal;
import entity.OrderDetails;
import entity.OrderDetailsFacadeLocal;
import entity.Orders;
import entity.OrdersFacadeLocal;
import entity.Stores;
import entity.StoresFacadeLocal;
import entity.Tables;
import entity.TablesFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
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
 * @author Nam_Nguyen
 */
@WebServlet(name = "showTicketServlet", urlPatterns = {"/showTicketServlet"})
public class showTicketServlet extends HttpServlet {

    @EJB
    OrdersFacadeLocal ordersFacade;
    @EJB
    OrderDetailsFacadeLocal orderDetailsFacade;
    @EJB
    TablesFacadeLocal tableFacade;
    @EJB
    StoresFacadeLocal storesFacade;
    @EJB 
    CustomersFacadeLocal customersFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String tableid = request.getParameter("tableid");
        String storeid = request.getParameter("storeid");
        String customerid=request.getParameter("customerid");
        Double discount = Double.parseDouble(request.getParameter("discount"));
        Double Tax = Double.parseDouble(request.getParameter("Tax"));
            String paid=request.getParameter("paid");
        String change=request.getParameter("change");
        Stores stores = storesFacade.find(storeid);
        Tables tables = tableFacade.find(tableid);
        Orders orders = ordersFacade.getByTableid(tableid);
        List<OrderDetails> list = orderDetailsFacade.findByOrderId(orders.getOrderId());
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        String ticket = "";
        if (list.size() > 0) {
            ticket = "<div class=\"col-md-12\">"
                    + "<div class=\"text-center\">" + stores.getStoName() + "</div>"+
                    "<div class=\"text-center\">Tel: " + stores.getPhonesto() + "</div>"
                    + "<div style=\"clear:both;\">"
                    + "<h4 class=\"text-center\">Sale No.:" + orders.getOrderId().substring(2)
                    + "</h4> <div style=\"clear:both;\"></div><span class=\"float-left\">Date:" + dateFormat.format(orders.getOrdertime())
                    + "</span><br><div style=\"clear:both;\"><span class=\"float-left\">Customer:"+ customersFacade.find(customerid).getCusName()+"</span>"
                    + "<div style=\"clear:both;\">"
                    + "<table class=\"table\" cellspacing=\"0\" border=\"0\">"
                    + "<thead>"
                    + "<tr>"
                    + "<th><em>#</em></th>"
                    + "<th>Product</th>"
                    + "<th>Quantity</th>"
                    + "<th>SubTotal</th>"
                    + "</tr></thead>";
            int index = 0;
            int quantity = 0;
            
            int total = 0;
            for (OrderDetails o : list) {
                index+=1;
                ticket += "<tr>"
                        + "<td style=\"text-align:center; width:30px;\">" + index + "</td>"
                        + "<td style=\"text-align:left; width:180px;\">" + o.getProducts().getProName() + "</td>"
                        + "<td style=\"text-align:center; width:50px;\">" + o.getQuantity() + "</td>"
                        + "<td style=\"text-align:right; width:70px; \">" + o.getPrice().intValue() * o.getQuantity() + " VND</td>"
                        + "</tr>";
                quantity = quantity + o.getQuantity();
                total += o.getPrice().intValue() * o.getQuantity();
            }
            int grandtot=(int) (total-(total*discount/100)+(total*Tax/100));
            ticket += "</tbody>"
                    + "<table class=\"table\" cellspacing=\"0\" border=\"0\" style=\"margin-bottom:8px;\">"
                    + "<tbody>"
                    + "<tr>"
                    + "<td style=\"text-align:left;\">Total Items</td>"
                    + "<td style=\"text-align:right; padding-right:1.5%;\">" + quantity + "</td>"
                    + "<td style=\"text-align:left; padding-left:1.5%;\">Total Price</td>"
                    + "<td style=\"text-align:right;font-weight:bold;\">" + total + " VND</td></tr>"
                    + "<tr><td style=\"text-align:left; padding-left:1.5%;\"></td>"
                    + "<td style=\"text-align:right;font-weight:bold;\"></td>"
                    + "<td style=\"text-align:left;\">Discount</td>"
                    + "<td style=\"text-align:right; padding-right:1.5%;font-weight:bold;\">" + discount + "%</td>"
                    +"<td style=\"text-align:left;\">Tax</td>"
                    + "<td style=\"text-align:right; padding-right:1.5%;font-weight:bold;\">" + Tax + "%</td>"
                    + "</tr><tr><td colspan=\"2\" style=\"text-align:left; font-weight:bold; padding-top:5px;\">Grand Total</td>"
                    + "<td colspan=\"2\" style=\"border-top:1px dashed #000; padding-top:5px; text-align:right; font-weight:bold;\">"+grandtot+"VND</td>"
                    + "</tr>"
                    + "<tr><td colspan=\"2\" style=\"text-align:left; font-weight:bold; padding-top:5px;\">Paid</td>"
                    + "<td colspan=\"2\" style=\"padding-top:5px; text-align:right; font-weight:bold;\">"+paid+" VND</td>"
                    + "</tr><tr><td colspan=\"2\" style=\"text-align:left; font-weight:bold; padding-top:5px;\">Change</td>"
                    + "<td colspan=\"2\" style=\"padding-top:5px; text-align:right; font-weight:bold;\">"+change+" VND</td>"
                    + "</tr>"
                    + "</tbody>"
                    + "</table>"
                    + "</div> </div> </div> </div> </div> </div> </div>";
        } else {
            ticket = "<center><h1 style=\"color:#34495E\">Empty</h1></center>";
        }

        response.getWriter().print(ticket);
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
