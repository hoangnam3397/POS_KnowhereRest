package controller;

import entity.Employees;
import entity.EmployeesFacadeLocal;
import entity.Products;
import entity.Roles;
import entity.RolesFacadeLocal;
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

@WebServlet(name = "editEmployeesServlet", urlPatterns = {"/editEmployeesServlet"})
public class editEmployeesServlet extends HttpServlet {

    @EJB
    private EmployeesFacadeLocal employeesFacade;
    @EJB
    private RolesFacadeLocal rolesFacade;
    String emp_id = "";
    private static final long serialVersionUID = 1L;

    // location to store file uploaded
    private static final String UPLOAD_DIRECTORY = "imgProduct";
    private static final String UPLOAD_DIRECTORY2 = "../../web/imgProduct";
    // upload settings
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        emp_id = request.getParameter("emp_id");
        request.setAttribute("emp_id", emp_id);
        request.setAttribute("empName", employeesFacade.find(emp_id).getEmpName());
        request.setAttribute("email", employeesFacade.find(emp_id).getEmail());
        request.setAttribute("phone", employeesFacade.find(emp_id).getPhone());
        
        request.setAttribute("role_id", employeesFacade.find(emp_id).getRoleId().getRoleId());
        request.setAttribute("listRole", rolesFacade.findAll());
        request.getRequestDispatcher("editEmployees.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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

            Employees emp = employeesFacade.find(emp_id);

            if (formItems != null && formItems.size() > 0) {
                // iterates over form's fields
                for (FileItem item : formItems) {
                    // processes only fields that are not form fields
                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();
                        if (fileName.isEmpty()) {

                        } else {
                            String filePath = uploadPath + File.separator + emp_id + "-" + fileName;
                            File storeFile = new File(filePath);
                            // saves the file on disk
                            item.write(storeFile);
                            String empLink = (UPLOAD_DIRECTORY + "/" + emp_id + "-" + fileName);
                            emp.setAvatarlink(empLink);
                            // add images vao POS goc
                            String filePath2 = getServletContext().getRealPath("")
                                    + File.separator + UPLOAD_DIRECTORY2 + File.separator + emp_id + "-" + fileName;
                            File storeFile2 = new File(filePath2);
                            item.write(storeFile2);
                        }
                    } else {
                        // Process regular form field (input type="text|radio|checkbox|etc", select, etc).
                        switch (item.getFieldName()) {
                            case "emp_name":
                                /*  if (employeesFacade.chkProUnique(pro_id, item.getString()) == false) {                                    
                                 getServletContext().getRequestDispatcher("getProductServlet").forward(request, response);
                                 } else {*/
                                System.out.println("Fullname: " + item.getString());
                                emp.setEmpName(item.getString());
                                continue;
                            //   }
                            case "email":
                                System.out.println("Email: " + item.getString());
                                emp.setEmail(item.getString());
                                continue;
                            case "Phone":
                                System.out.println("Phone: " + item.getString());
                                emp.setPhone(item.getString());
                                continue;
                            case "role":
                                System.out.println("Role: " + item.getString());
                                emp.setRoleId(rolesFacade.find(item.getString()));
                                continue;
                       
                        }

                    }
                }
            }
            employeesFacade.edit(emp);
        } catch (Exception ex) {
            ex.getStackTrace();
        }
        getServletContext().getRequestDispatcher("/getEmployeesServlet").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
