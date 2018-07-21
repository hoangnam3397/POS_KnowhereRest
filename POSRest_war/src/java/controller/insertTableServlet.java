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
@WebServlet(name = "insertTableServlet", urlPatterns = {"/insertTableServlet"})
public class insertTableServlet extends HttpServlet {
    String sto_id="";
    @EJB ZonesFacadeLocal zoneFacade;
    @EJB TablesFacadeLocal tableFacade;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String action= request.getParameter("action");
        if(action.equals("get")){
            //load insertpage
            sto_id=request.getParameter("sto_id");
            request.setAttribute("listZone", zoneFacade.showAllZones(sto_id));
            request.getRequestDispatcher("insertTable.jsp").forward(request, response);
        }
        else if(action.equals("Submit")){
            //add table
            String tab_id= request.getParameter("tab_id");
            String tab_name=request.getParameter("tab_name");
            int delete = 0;
            String zone_id = request.getParameter("zone_id");
            Zones zo = zoneFacade.find(zone_id);
            Tables tab = new Tables(tab_id, tab_name, delete, zo);
            tableFacade.create(tab);
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
