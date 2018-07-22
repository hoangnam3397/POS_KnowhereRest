/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import entity.Categories;
import entity.CategoriesFacadeLocal;
import entity.Products;
import entity.ProductsFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
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
@WebServlet(name = "insertProductServlet", urlPatterns = {"/insertProductServlet"})
public class insertProductServlet extends HttpServlet {

    @EJB ProductsFacadeLocal productFacade;
    @EJB CategoriesFacadeLocal cateFacade;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String action=request.getParameter("action");
        if(action.equals("get")){
            request.setAttribute("listCate", cateFacade.showAllCategories());
            request.getRequestDispatcher("insertProduct.jsp").forward(request, response);
        }
        else if(action.equals("Submit")){
            //auto create pro_id 
            int num=productFacade.count()+1;
            String id=num+"";
            int lenNum=5;
            int lenZero= lenNum- id.length();
            for (int i = 0; i < lenZero; i++) {
                id= "0"+id;
            }
            String pro_id="P"+id;
            //create pro_id
            String pro_name=request.getParameter("pro_name");
            String cate_id = request.getParameter("cate");
            Categories cat =cateFacade.find(cate_id);
            String description = request.getParameter("des");
            int del =0;
            double discount = Double.parseDouble(request.getParameter("discount"));
            BigDecimal price = BigDecimal.valueOf(Double.parseDouble(request.getParameter("price")));
            String imagelink = null;
            Products product = new Products(pro_id, pro_name, price, imagelink, discount, del, description, cat);
            productFacade.create(product);
            request.getRequestDispatcher("getProductServlet").forward(request, response);
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
