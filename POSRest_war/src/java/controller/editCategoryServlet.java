/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import entity.Categories;
import entity.CategoriesFacadeLocal;
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
@WebServlet(name = "editCategoryServlet", urlPatterns = {"/editCategoryServlet"})
public class editCategoryServlet extends HttpServlet {
    String cate_id="";
    @EJB CategoriesFacadeLocal cateFacade;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String action=request.getParameter("action");
        if(action.equals("get")){
            cate_id = request.getParameter("cate_id");
            request.setAttribute("cateName", cateFacade.find(cate_id).getCatName());
            request.getRequestDispatcher("editCategory.jsp").forward(request, response);
        }
        else if(action.equals("Submit")){        
            String cate_name=request.getParameter("cate_name");
            Categories cate = cateFacade.find(cate_id);
            cate.setCatName(cate_name);
            cateFacade.edit(cate);
            request.getRequestDispatcher("getCategoriesServlet").forward(request, response);
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
