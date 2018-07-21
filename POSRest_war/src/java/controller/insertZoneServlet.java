/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import entity.StoresFacadeLocal;
import entity.TablesFacadeLocal;
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
    String sto_id="";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String action=request.getParameter("action");
        if(action.equals("get")){
            //load page insertZone
            sto_id= request.getParameter("sto_id");
            request.getRequestDispatcher("insertZone.jsp").forward(request, response);
        }
        else if(action.equals("Submit")){
            //add Zone in database
            String zone_id=request.getParameter("zone_id");
            String zone_name=request.getParameter("zone_name");
            int del = 0;
            Zones zo = new Zones(zone_id, zone_name, storeFacade.find(this.sto_id), del);
            zoneFacade.create(zo);
            //back page getTable
            request.getRequestDispatcher("getTableServlet?sto_id="+sto_id).forward(request, response);
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

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
