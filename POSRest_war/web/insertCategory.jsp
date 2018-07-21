<%-- 
    Document   : insertCategory
    Created on : Jul 20, 2018, 8:09:14 PM
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
        <form action="insertCategoryServlet" method="post">
            Category ID<input type="text" name="cate_id"/>
            Category Name<input type="text" name="cate_name"/>
            <input type="submit" value="Submit"/>
        </form>
    </body>
</html>
