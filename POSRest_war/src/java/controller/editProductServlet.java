/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import entity.CategoriesFacadeLocal;
import entity.ProductsFacadeLocal;
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
@WebServlet(name = "editProductServlet", urlPatterns = {"/editProductServlet"})
public class editProductServlet extends HttpServlet {
    @EJB ProductsFacadeLocal productFacade;
    @EJB CategoriesFacadeLocal cateFacade;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        String pro_id=request.getParameter("id");
        request.setAttribute("code", productFacade.find(pro_id).getProId());
        request.setAttribute("proName", productFacade.find(pro_id).getProName());
        request.setAttribute("price", productFacade.find(pro_id).getPrice());
        request.setAttribute("dis", productFacade.find(pro_id).getDiscount());
        request.setAttribute("des", productFacade.find(pro_id).getDescription());
        request.setAttribute("cateid", productFacade.find(pro_id).getCatId().getCatId());
        request.setAttribute("listCate", cateFacade.showAllCategories());
        request.getRequestDispatcher("editProduct.jsp").forward(request, response);
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
