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
@WebServlet(name = "editProductServlet", urlPatterns = {"/editProductServlet"})
public class editProductServlet extends HttpServlet {
    @EJB ProductsFacadeLocal productFacade;
    @EJB CategoriesFacadeLocal cateFacade;
    String pro_id="";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String action=request.getParameter("action");
        if(action.equals("get")){
            //load page editProduct
            pro_id=request.getParameter("pro_id");
            request.setAttribute("proName", productFacade.find(pro_id).getProName());
            request.setAttribute("price", productFacade.find(pro_id).getPrice());
            request.setAttribute("dis", productFacade.find(pro_id).getDiscount());
            request.setAttribute("description", productFacade.find(pro_id).getDescription());
            request.setAttribute("cateid", productFacade.find(pro_id).getCatId().getCatId());
            request.setAttribute("listCate", cateFacade.showAllCategories());
            request.getRequestDispatcher("editProduct.jsp").forward(request, response);
        }
        else if(action.equals("Submit")){
            //edit Product
            String pro_name=request.getParameter("pro_name");
            double discount = Double.parseDouble(request.getParameter("discount"));
            BigDecimal price = BigDecimal.valueOf(Double.parseDouble(request.getParameter("price")));
            String description = request.getParameter("des");
            String cate_id = request.getParameter("cate");
            String color=request.getParameter("color");
            Categories cat =cateFacade.find(cate_id);
            Products pro = productFacade.find(pro_id);
            pro.setProName(pro_name);
            pro.setDescription(description);
            pro.setPrice(price);
            pro.setDiscount(discount);
            pro.setCatId(cat);
            pro.setColor(color);
            productFacade.edit(pro);
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
