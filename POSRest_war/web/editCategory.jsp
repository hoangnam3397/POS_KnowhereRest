<%-- 
    Document   : editCategory
    Created on : Jul 20, 2018, 8:35:11 PM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="editCategoryServlet" method="post">
            Category Name<input type="text" name="cate_name" value="${cateName}"/>
            <input type="submit" value="Submit"/>
        </form>
    </body>
</html>
