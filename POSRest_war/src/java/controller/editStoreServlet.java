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
        String action=request.getParameter("action");
        if(action.equals("get")){
            //load page editStore
            sto_id= request.getParameter("sto_id");
            request.setAttribute("stoName", storeFacade.find(sto_id).getStoName());
            request.setAttribute("phoneSto", storeFacade.find(sto_id).getPhonesto());
            request.setAttribute("address", storeFacade.find(sto_id).getAddress());
            request.getRequestDispatcher("editStore.jsp").forward(request, response);
        }else if(action.equals("Submit")){
            //edit Store
            String sto_name = request.getParameter("sto_name");
            String address = request.getParameter("address");
            String phone = request.getParameter("phonesto");
            Stores sto = storeFacade.find(sto_id);
            sto.setStoName(sto_name);
            sto.setAddress(address);
            sto.setPhonesto(phone);
            storeFacade.edit(sto);
            //back viewStore
            request.getRequestDispatcher("viewStoreServlet").forward(request, response);
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
