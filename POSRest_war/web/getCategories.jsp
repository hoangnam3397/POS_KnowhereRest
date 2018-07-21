<%-- 
    Document   : getCategories
    Created on : Jul 20, 2018, 7:51:09 PM
    Author     : Duy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="getCategoriesServlet" method="post">
            <table>
                <tr>
                    <td>Category Name</td>
                    <td>Created At</td>
                    <td>Action</td>
                </tr>
                <c:forEach var="cat" items="${listCate}">
                    <tr>
                        <td>${cat.catName}</td>
                        <td>${cat.createday}</td>
                        <td><a href="editCategoryServlet?id=${cat.catId}">Edit</a>
                            <a href="deleteCategoryServlet?id=${cat.catId}">Delete</a></td>
                    </tr>
                </c:forEach>
            </table>
            <a href="insertCategory.jsp">Add Category</a>
        </form>
    </body>
</html>
