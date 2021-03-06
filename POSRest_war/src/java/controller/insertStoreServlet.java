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
@WebServlet(name = "insertStoreServlet", urlPatterns = {"/insertStoreServlet"})
public class insertStoreServlet extends HttpServlet {
    
    @EJB StoresFacadeLocal storesFacade;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        //auto create sto_id 
        int num=storesFacade.count()+1;
        String id=num+"";
        int lenNum=5;
        int lenZero= lenNum- id.length();
        for (int i = 0; i < lenZero; i++) {
            id= "0"+id;
        }
        String sto_id="ST"+id;
        //add store
        
        String sto_name=request.getParameter("sto_name");
        String address=request.getParameter("address");
        String phonesto=request.getParameter("phonesto");
        int delete = 0;
        Stores sto = new Stores(sto_id, sto_name, address, phonesto, delete);
        storesFacade.create(sto);
        //back viewStore
        request.getRequestDispatcher("viewStoreServlet").forward(request, response);
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
