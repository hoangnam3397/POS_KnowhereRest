/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import entity.Stores;
import entity.StoresFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "editStoreServlet", urlPatterns = {"/editStoreServlet"})
public class editStoreServlet extends HttpServlet {

    @EJB StoresFacadeLocal storeFacade;
    String sto_id="";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        sto_id= request.getParameter("id");
        request.setAttribute("s", storeFacade.find(sto_id));
        request.getRequestDispatcher("editStore.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        String sto_name = request.getParameter("sto_name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        Stores sto = storeFacade.find(sto_id);
        sto.setStoName(sto_name);
        sto.setAddress(address);
        sto.setPhonesto(phone);
        storeFacade.edit(sto);
        request.getRequestDispatcher("viewStoreServlet").forward(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
