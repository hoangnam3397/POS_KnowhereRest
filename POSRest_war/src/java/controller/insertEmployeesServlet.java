package controller;

import entity.Employees;
import entity.EmployeesFacadeLocal;
import entity.Roles;
import entity.RolesFacadeLocal;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet(name = "insertEmployeesServlet", urlPatterns = {"/insertEmployeesServlet"})
public class insertEmployeesServlet extends HttpServlet {

    @EJB
    private EmployeesFacadeLocal employeesFacade;
    @EJB
    private RolesFacadeLocal rolesFacade;

    private static final long serialVersionUID = 1L;

    // location to store file uploaded
    private static final String UPLOAD_DIRECTORY = "imgUser";
    private static final String UPLOAD_DIRECTORY2 = "../../web/imgUser";
    // upload settings
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("listRole", rolesFacade.findAll());
        request.getRequestDispatcher("insertEmployee.jsp").forward(request, response);
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

            Employees emp = new Employees();
            //auto create pro_id 
            int num = employeesFacade.count() + 1;
            String id = num + "";
            int lenNum = 5;
            int lenZero = lenNum - id.length();
            for (int i = 0; i < lenZero; i++) {
                id = "0" + id;
            }
            String emp_id = "EMP" + id;
            emp.setEmpId(emp_id);

            if (formItems != null && formItems.size() > 0) {
                // iterates over form's fields
                for (FileItem item : formItems) {
                    // processes only fields that are not form fields
                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();
                        if (fileName.isEmpty()) {
                            String prolink = ("images/default-food.png");
                            emp.setAvatarlink(prolink);
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
                            case "name":
                                System.out.println("Name: " + item.getString());
                                emp.setEmpName(item.getString());
                                continue;
                            case "username":
                                if (employeesFacade.chkUserUnique(emp_id, item.getString()) == false) {
                                    getServletContext().getRequestDispatcher("getEmployeesServlet").forward(request, response);
                                } else {
                                    System.out.println("UserName: " + item.getString());
                                    emp.setUsername(item.getString());
                                    continue;
                                }

                            case "password":
                                System.out.println("Password: " + item.getString());
                                emp.setPassword(item.getString());
                                continue;
                            case "phone":

                                System.out.println("Phone: " + item.getString());
                                emp.setPhone(item.getString());
                                continue;
                            case "email":
                                if (employeesFacade.chkEmailUnique(emp_id, item.getString()) == false) {
                                 
                                   getServletContext().getRequestDispatcher("getEmployeesServlet").forward(request, response);
                                } else {
                                    System.out.println("Email: " + item.getString());
                                    emp.setEmail(item.getString());
                                    continue;
                                }

                               
                            case "role":
                                System.out.println("Roles: " + item.getString());
                                emp.setRoleId(rolesFacade.find(item.getString()));
                                continue;
                        }
                    }
                }
            }
            employeesFacade.create(emp);
        } catch (Exception ex) {
            ex.getStackTrace();
        }
        // redirects client to message page
        getServletContext().getRequestDispatcher("/getEmployeesServlet").forward(request, response);
    }

}
