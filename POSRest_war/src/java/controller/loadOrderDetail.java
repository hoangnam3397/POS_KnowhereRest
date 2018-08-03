/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.common.reflect.TypeToken;
import entity.OrderDetails;
import entity.OrderDetailsFacadeLocal;
import entity.Orders;
import entity.OrdersFacadeLocal;
import entity.ProductsFacadeLocal;
import entity.Tables;
import entity.TablesFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "loadOrderDetail", urlPatterns = {"/loadOrderDetail"})
public class loadOrderDetail extends HttpServlet {

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
        String tableid = request.getParameter("tableid");
        Tables tables = tableFacade.find(tableid);
        Orders orders = ordersFacade.getByTableid(tableid);
        List<OrderDetails> list = orderDetailsFacade.findByOrderId(orders.getOrderId());
        String data="";
        if(list.size()!=0){
            for (OrderDetails o : list) {
           String quant="<div class=\"col-xs-12\"><div class=\"panel panel-default product-details\">\n" +
"                                    <div class=\"panel-body\" style=\"\">\n" +
"                                        <div class=\"col-xs-5 nopadding\">\n" +
"                                            <div class=\"col-xs-2 nopadding\">\n" +
"                                                <a href=\"javascript:void(0)\" onclick=\"delete_posale("+"'"+o.getOrders().getOrderId()+"'"+"," +"'"+o.getProducts().getProId()+"')\">\n" +
"                                                    <span class=\"fa-stack fa-sm productD\">\n" +
"                                                        <i class=\"fa fa-circle fa-stack-2x delete-product\"></i>\n" +
"                                                        <i class=\"fa fa-times fa-stack-1x fa-fw fa-inverse\"></i>\n" +
"                                                    </span></a></div><div class=\"col-xs-10 nopadding\"><span class=\"textPD\">"+o.getProducts().getProName()+"</span></div>\n" +
"                                        </div><div class=\"col-xs-2\"><span class=\"textPD\">"+o.getPrice()+"</span></div>\n" +
"                                        <div class=\"col-xs-3 nopadding productNum\">\n" +
"                                            <a href=\"javascript:void(0)\">\n" +
"                                                <span class=\"fa-stack fa-sm decbutton\">\n" +
"                                                    <i class=\"fa fa-square fa-stack-2x light-grey\"></i>\n" +
"                                                    <i class=\"fa fa-minus fa-stack-1x fa-inverse white\"></i></span>\n" +
"                                            </a>\n" +
"                                    <input type=\"text\" id=\"qt${o.orders.getOrderId()}${o.products.getProId()}\" onchange=\"edit_posale('${o.orders.getOrderId()}', '${o.products.getProId()}')\" class=\"form-control\" value=\""+""+o.getQuantity()+""+"\" placeholder=\"0\" maxlength=\"3\">\n" +
"                                            <a href=\"javascript:void(0)\">\n" +
"                                                <span class=\"fa-stack fa-sm incbutton\">\n" +
"                                                    <i class=\"fa fa-square fa-stack-2x light-grey\"></i>\n" +
"                                                    <i class=\"fa fa-plus fa-stack-1x fa-inverse white\"></i>\n" +
"                                                </span></a>\n" +
"                                        </div>\n" +
"                                        <div class=\"col-xs-2 nopadding \">\n" +
"                                            <span class=\"subtotal textPD\">"+o.getPrice().floatValue()*o.getQuantity()+"</span>\n" +
"                                        </div>\n" +
"                                    </div>\n" +
"                                    <button type=\"button\" onclick=\"addoptions(148, 2891)\" class=\"btn btn-success btn-xs\">Options</button>\n" +
"                                    <span id=\"pooptions-2891\"> </span>\n" +
"\n" +
"                                </div></div>";
           data=data+quant;
            
        }
        data+="<script type=\"text/javascript\">$(\".incbutton\").on(\"click\", function() {var $button = $(this);var oldValue = $button.parent().parent().find(\"input\").val();var newVal = parseFloat(oldValue) + 1;$button.parent().parent().find(\"input\").val(newVal);edit_posale($button.parent().parent().find(\"input\").attr(\"id\").slice(3));});$(\".decbutton\").on(\"click\", function() {var $button = $(this);var oldValue = $button.parent().parent().find(\"input\").val();if (oldValue > 1) {var newVal = parseFloat(oldValue) - 1;} else {newVal = 1;}$button.parent().parent().find(\"input\").val(newVal);edit_posale($button.parent().parent().find(\"input\").attr(\"id\").slice(3));});</script>";
        
        }else{
            data="<div class=\"messageVide\">' . label(\"EmptyList\") . ' <span>(' . label(\"SelectProduct\") . ')</span></div>";
        }
        response.getWriter().print(data);
        

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
