/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.CategoriesFacadeLocal;
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
@WebServlet(name = "getCategoryToOrder", urlPatterns = {"/getCategoryToOrder"})
public class getCategoryToOrder extends HttpServlet {

    @EJB
    CategoriesFacadeLocal cateFacade;
    @EJB
    ProductsFacadeLocal productFacade;
    @EJB
    TablesFacadeLocal tableFacade;
    @EJB
    OrdersFacadeLocal ordersFacade;
    @EJB
    OrderDetailsFacadeLocal orderDetailsFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String table = request.getParameter("table");
        String tableid = request.getParameter("tableid");
        request.setAttribute("tableId", tableid);
        request.setAttribute("table", table);
        request.setAttribute("listCate", cateFacade.showAllCategories());
        request.setAttribute("listPro", productFacade.showAllProduct());
        Tables tables = tableFacade.find(tableid);
        if (tables.getStatus() == false) {
            request.getRequestDispatcher("OrderPage.jsp").forward(request, response);
        } else {
            Orders orders = ordersFacade.getByTableid(tableid);
            List<OrderDetails> list = orderDetailsFacade.findByOrderId(orders.getOrderId());
            request.setAttribute("list", list);
            request.getRequestDispatcher("OrderPage.jsp").forward(request, response);
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
