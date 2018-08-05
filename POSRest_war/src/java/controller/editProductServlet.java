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
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
/**
 *
 * @author Duy
 */
@WebServlet(name = "editProductServlet", urlPatterns = {"/editProductServlet"})
public class editProductServlet extends HttpServlet {
    String pro_id="";
    @EJB ProductsFacadeLocal productFacade;
    @EJB CategoriesFacadeLocal cateFacade;
    
    private static final long serialVersionUID = 1L;
 
    // location to store file uploaded
    private static final String UPLOAD_DIRECTORY = "imgProduct";
    private static final String UPLOAD_DIRECTORY2 = "../../web/imgProduct";
    // upload settings
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            pro_id=request.getParameter("pro_id");
            request.setAttribute("pro_id", pro_id);
            request.setAttribute("proName", productFacade.find(pro_id).getProName());
            request.setAttribute("price", String.format("%.0f", productFacade.find(pro_id).getPrice()));
            request.setAttribute("dis", String.format("%.0f", productFacade.find(pro_id).getDiscount()));
            request.setAttribute("description", productFacade.find(pro_id).getDescription());
            request.setAttribute("cateid", productFacade.find(pro_id).getCatId().getCatId());
            request.setAttribute("listCate", cateFacade.showAllCategories());
            request.getRequestDispatcher("editProduct.jsp").forward(request, response);
    }
 
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        // checks if the request actually contains upload file
        if (!ServletFileUpload.isMultipartContent(request)) {
            // if not, we stop here
            PrintWriter writer = response.getWriter();
            writer.println("Error: Form must has enctype=multipart/form-data.");
            writer.flush();
            return;
        }
 
        // configures upload settings
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // sets memory threshold - beyond which files are stored in disk 
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // sets temporary location to store files
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
 
        ServletFileUpload upload = new ServletFileUpload(factory);
 
        // sets maximum size of upload file
        upload.setFileSizeMax(MAX_FILE_SIZE);
 
        // sets maximum size of request (include file + form data)
        upload.setSizeMax(MAX_REQUEST_SIZE);
 
        // constructs the directory path to store upload file
        // this path is relative to application's directory
        String uploadPath = getServletContext().getRealPath("")
                + File.separator + UPLOAD_DIRECTORY;
 
        // creates the directory if it does not exist
        File uploadDir = new File(uploadPath);      
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
 
        try {
            // parses the request's content to extract file data
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);
            
            Products pro = productFacade.find(pro_id);
            
            if (formItems != null && formItems.size() > 0) {
                // iterates over form's fields
                for (FileItem item : formItems) {
                    // processes only fields that are not form fields
                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();
                        if(fileName.isEmpty()){
                                                 
                        }else{
                            String filePath = uploadPath + File.separator + pro_id + "-" +fileName;
                            File storeFile = new File(filePath);                                                         
                            // saves the file on disk
                            item.write(storeFile);                              
                            String proLink=(UPLOAD_DIRECTORY + "/" + pro_id + "-" +fileName);
                            pro.setImagelink(proLink);
                            // add images vao POS goc
                            String filePath2 = getServletContext().getRealPath("")
                + File.separator + UPLOAD_DIRECTORY2 + File.separator + pro_id + "-" + fileName;
                            File storeFile2 = new File(filePath2);
                            item.write(storeFile2);
                        }                       
                    }else{
                        // Process regular form field (input type="text|radio|checkbox|etc", select, etc).
                        switch (item.getFieldName()){                            
                            case "pro_name":
                                if (productFacade.chkProUnique(pro_id, item.getString()) == false) {                                    
                                    getServletContext().getRequestDispatcher("getProductServlet").forward(request, response);
                                } else {
                                    System.out.println("ProName: " + item.getString());
                                    pro.setProName(item.getString());
                                    continue;
                                }
                            case "cate":
                                System.out.println("Cate: " + item.getString());
                                pro.setCatId(cateFacade.find(item.getString()));
                                continue;
                            case "price":
                                System.out.println("Price: " + item.getString());
                                pro.setPrice(BigDecimal.valueOf(Double.parseDouble(item.getString())));
                                continue;     
                            case "discount":
                                System.out.println("Discount: " + item.getString());
                                pro.setDiscount(Double.parseDouble(item.getString()));
                                continue;
                            case "descrip":
                                System.out.println("Description: " + item.getString());
                                pro.setDescription(item.getString());
                                continue;
                            case "color":
                                if(item.getString().isEmpty()){
                                    
                                }else{
                                System.out.println("Color: " + item.getString());
                                pro.setColor(item.getString());
                                continue;
                                }
                        }                        
                    }
                }
            }
            productFacade.edit(pro);
        } catch (Exception ex) {
            ex.getStackTrace();
        }
        // redirects client to message page
        getServletContext().getRequestDispatcher("/getProductServlet").forward(request, response);
    }
}
