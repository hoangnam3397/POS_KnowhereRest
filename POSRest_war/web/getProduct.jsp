<%-- 
    Document   : getProduct
    Created on : Jul 20, 2018, 9:38:35 PM
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
        <form action="getProductServlet" method="post">
            <table border="1">
                <tr>
                    <td>Product Name</td>
                    <td>Category</td>
                    <td>Product Description</td>
                    <td>Price</td>
                    <td>Discount</td>
                    <td>Action</td>
                </tr>
                <c:forEach var="p" items="${listPro}">
                    <tr>
                        <td>${p.proName}</td>
                        <td>${p.catId.catName}</td>
                        <td>${p.description}</td>
                        <td>${p.price}</td>
                        <td>${p.discount}</td>
                        <td><a href="editProductServlet?pro_id=${p.proId}&action=get">Edit</a>
                            <a href="deleteProductServlet?pro_id=${p.proId}">Delete</a>
                            <a href="">View Image</a></td>
                    </tr>        
                </c:forEach>
            </table>
            <a href="insertProductServlet?action=get">Add product</a>
        </form>
    </body>
</html>
