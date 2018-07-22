/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

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
@WebServlet(name = "editZoneServlet", urlPatterns = {"/editZoneServlet"})
public class editZoneServlet extends HttpServlet {
    @EJB ZonesFacadeLocal zoneFacade;
    String zone_id="";
    String action="";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        action=request.getParameter("action");
        if(action.equals("Submit")){
            //edit Zone
            String zone_name=request.getParameter("zone_name");
            Zones zo =zoneFacade.find(zone_id);
            zo.setZoneName(zone_name);
            zoneFacade.edit(zo);
            //Back page getTable
            String sto_id= zo.getStoId().getStoId();
            request.getRequestDispatcher("getTableServlet?sto_id="+sto_id).forward(request, response);
        }
        else if(action.equals("get")){
            //load page editZone
            zone_id=request.getParameter("zone_id");
            request.setAttribute("zoneName", zoneFacade.find(zone_id).getZoneName());
            request.getRequestDispatcher("editZone.jsp").forward(request, response);    
             }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);       
    }

    
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
