/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import entity.Tables;
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
@WebServlet(name = "editTableServlet", urlPatterns = {"/editTableServlet"})
public class editTableServlet extends HttpServlet {
    String action="";
    String tab_id="";
    String sto_id="";
    @EJB TablesFacadeLocal tableFacade;
    @EJB ZonesFacadeLocal zoneFacade;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        action=request.getParameter("action");
        if(action.equals("get")){
            tab_id = request.getParameter("tab_id");
            //load page editTable
            request.setAttribute("tabName", tableFacade.find(tab_id).getTabName());
            request.setAttribute("zoID", tableFacade.find(tab_id).getZoneId().getZoneId());
            sto_id=tableFacade.find(tab_id).getZoneId().getStoId().getStoId();
            request.setAttribute("listZone", zoneFacade.showAllZones(sto_id));
            request.getRequestDispatcher("editTable.jsp").forward(request, response);
        }
        if(action.equals("Submit")){
            //edit table
            String tab_name = request.getParameter("tab_name");
            String zone_id = request.getParameter("zone");
            Zones zo = zoneFacade.find(zone_id);
            Tables tab = tableFacade.find(tab_id);
            tab.setTabName(tab_name);
            tab.setZoneId(zo);
            tableFacade.edit(tab);
            //back getTable
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
