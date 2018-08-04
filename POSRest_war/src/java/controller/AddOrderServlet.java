/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.OrderDetails;
import entity.OrderDetailsFacadeLocal;
import entity.OrderDetailsPK;
import entity.Orders;
import entity.OrdersFacadeLocal;
import entity.Products;
import entity.ProductsFacadeLocal;
import entity.Tables;
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
        String tableid = request.getParameter("tableid");
        String productid = request.getParameter("productid");
        Orders orders = null;

        Tables tables = tableFacade.find(tableid);
        //tim kim xem orderDetail đã có thông tin 

        if (tables.getStatus() == false) {
            int num = ordersFacade.count() + 1;
            String id = num + "";
            int lenNum = 7;
            int lenZero = lenNum - id.length();
            for (int i = 0; i < lenZero; i++) {
                id = "0" + id;
            }
            String orderid = "OD" + id;
            Date date = new Date();
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Calendar c = Calendar.getInstance();
           // c.setTime(date);
            //c.add(Calendar.DATE, 1);
            
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
            orders = new Orders(orderid, "unpaid", date, 0, BigDecimal.ZERO, 0, 0, BigDecimal.ZERO, null, null, tableFacade.find(tableid));
            ordersFacade.create(orders);
            tables.setStatus(true);
            tableFacade.edit(tables);
            Products products = productFacade.find(productid);
            OrderDetails od = new OrderDetails();
            od.setOrders(orders);
            od.setProducts(products);
            od.setOrderDetailsPK(new OrderDetailsPK(orders.getOrderId(), productid));
            od.setPrice(products.getPrice());
            od.setDiscount(products.getDiscount());
            od.setQuantity(1);
            od.setOptionvalue("");
            orderDetailsFacade.create(od);
            
        } else {
            Orders orderAdd = ordersFacade.getByTableid(tableid);
            List<OrderDetails> listOrderDetail = orderDetailsFacade.findByProduct(productid, orderAdd.getOrderId());
            if (listOrderDetail.size() > 0) {
                listOrderDetail.get(0).setQuantity(listOrderDetail.get(0).getQuantity() + 1);
                orderDetailsFacade.edit(listOrderDetail.get(0));
            } else {
                Products products = productFacade.find(productid);
                OrderDetails od = new OrderDetails();
                od.setOrders(orderAdd);
                od.setProducts(products);
                od.setOrderDetailsPK(new OrderDetailsPK(orderAdd.getOrderId(), productid));
                od.setPrice(products.getPrice());
                od.setDiscount(products.getDiscount());
                od.setQuantity(1);
                od.setOptionvalue("");
                orderDetailsFacade.create(od);

            }
            
            /*for (int i = 0; i < listOrderDetail.size(); i++) {
             if (productid.equals(listOrderDetail.get(i).getProducts().getProId())) {
             listOrderDetail.get(i).setQuantity(listOrderDetail.get(i).getQuantity() + 1);
             orderDetailsFacade.edit(listOrderDetail.get(i));
             count++;
                    
             }

             }/*/

            /*float subtotal = orderDetailsFacade.sumPrice(orderid).floatValue();
             float ordertax = Float.parseFloat(request.getParameter("ordertax"));
             float discountValue = Float.parseFloat(request.getParameter("discount"));
             float total = subtotal - (subtotal * ordertax) - (subtotal * discountValue);
             BigDecimal totalValue = new BigDecimal(total);
        
             //DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");*/
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
