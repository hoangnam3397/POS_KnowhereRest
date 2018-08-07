/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import entity.CategoriesFacadeLocal;
import entity.CustomersFacadeLocal;
import entity.OrderDetails;
import entity.OrderDetailsFacadeLocal;
import entity.Orders;
import entity.OrdersFacadeLocal;
import entity.ProductsFacadeLocal;
import entity.TopProduct;
import entity.TopProductValue;
import entity.TotalToday;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.ZoneId;
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
@WebServlet(name = "GetTopProductServlet", urlPatterns = {"/GetTopProductServlet"})
public class GetTopProductServlet extends HttpServlet {

    @EJB
    OrderDetailsFacadeLocal orderDetailsFacade;
    @EJB
    ProductsFacadeLocal productsFacade;
    @EJB
    CustomersFacadeLocal customersFacade;
    @EJB
    CategoriesFacadeLocal categoriesFacade; 
    @EJB
    OrdersFacadeLocal ordersFacade; 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        List<TopProductValue> list=orderDetailsFacade.getTop5Product();
        List<TotalToday> listOrder=ordersFacade.getTodaySale();
        List<Orders> listAllOrder=ordersFacade.findAll();
        double value1=0;
        double value2=0;
        double value3=0;
        double value4=0;
        double value5=0;
        double value6=0;
        double value7=0;
        double value8=0;
        double value9=0;
        double value10=0;
        double value11=0;
        double value12=0;
        
        for (Orders orders : listAllOrder) {
            if(orders.getOrdertime().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().getMonthValue()==1){
                value1= value1+orders.getTotal().doubleValue();
            }else if(orders.getOrdertime().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().getMonthValue()==2){
                value2= value2+orders.getTotal().doubleValue();
            }else if(orders.getOrdertime().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().getMonthValue()==3){
                value3= value3+orders.getTotal().doubleValue();
            }else if(orders.getOrdertime().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().getMonthValue()==4){
                value4= value4+orders.getTotal().doubleValue();
            }else if(orders.getOrdertime().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().getMonthValue()==5){
                value5= value5+orders.getTotal().doubleValue();
            }else if(orders.getOrdertime().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().getMonthValue()==6){
                value6= value6+orders.getTotal().doubleValue();
            }else if(orders.getOrdertime().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().getMonthValue()==7){
                value7= value7+orders.getTotal().doubleValue();
            }else if(orders.getOrdertime().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().getMonthValue()==8){
                value8= value8+orders.getTotal().doubleValue();
            }else if(orders.getOrdertime().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().getMonthValue()==9){
                value9= value9+orders.getTotal().doubleValue();
            }else if(orders.getOrdertime().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().getMonthValue()==10){
                value10= value10+orders.getTotal().doubleValue();
            }else if(orders.getOrdertime().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().getMonthValue()==11){
                value11= value11+orders.getTotal().doubleValue();
            }else if(orders.getOrdertime().toInstant().atZone(ZoneId.systemDefault()).toLocalDate().getMonthValue()==12){
                value12= value12+orders.getTotal().doubleValue();
            }
        }
        System.out.println(value7);
        int TotalSale=0;
        for (TotalToday t : listOrder) {
            TotalSale+=t.getTotal().intValue();
        }
        
        request.setAttribute("value1", value1);
        request.setAttribute("value2", value2);
        request.setAttribute("value3", value3);
        request.setAttribute("value4", value4);
        request.setAttribute("value5", value5);
        request.setAttribute("value6", value6);
        request.setAttribute("value7", value7);
        request.setAttribute("value8", value8);
        request.setAttribute("value9", value9);
        request.setAttribute("value10", value10);
        request.setAttribute("value11", value11);
        request.setAttribute("value12", value12);
        request.setAttribute("totalSale", TotalSale);
        request.setAttribute("product1", list.get(0).getProName());
        request.setAttribute("product2", list.get(1).getProName());
        request.setAttribute("product3", list.get(2).getProName());
        request.setAttribute("product4", list.get(3).getProName());
        request.setAttribute("product5", list.get(4).getProName());
        request.setAttribute("Valproduct1", list.get(0).getQSum());
        request.setAttribute("Valproduct2", list.get(1).getQSum());
        request.setAttribute("Valproduct3", list.get(2).getQSum());
        request.setAttribute("Valproduct4", list.get(3).getQSum());
        request.setAttribute("Valproduct5", list.get(4).getQSum());
        request.setAttribute("numCus", customersFacade.findAll().size()+1);
        request.setAttribute("numPro", productsFacade.findAll().size()+1);
        request.setAttribute("numCat", categoriesFacade.findAll().size()+1);
        request.setAttribute("list", list);
        request.getRequestDispatcher("reportPage.jsp").forward(request, response);
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
