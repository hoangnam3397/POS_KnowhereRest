/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import entity.StoresFacadeLocal;
import entity.Zones;
import entity.ZonesFacadeLocal;
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
@WebServlet(name = "insertZoneServlet", urlPatterns = {"/insertZoneServlet"})
public class insertZoneServlet extends HttpServlet {
    @EJB ZonesFacadeLocal zoneFacade;
    @EJB StoresFacadeLocal storeFacade;
    
    String Sto_id="";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);       
        Sto_id= request.getParameter("id");
        request.getRequestDispatcher("insertZone.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        String zone_id=request.getParameter("zone_id");
        String zone_name=request.getParameter("zone_name");
        int del = 0;
        Zones zo = new Zones(zone_id, zone_name, storeFacade.find(this.Sto_id), del);
        zoneFacade.create(zo);
        request.getRequestDispatcher("getTableServlet").forward(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
