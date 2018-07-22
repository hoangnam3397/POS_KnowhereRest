<%-- 
    Document   : insertProduct
    Created on : Jul 20, 2018, 8:58:45 PM
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
        <form action="insertProductServlet" method="post">
            <table>
                <tr>
                    <td>Product Name</td>
                    <td><input type="text" name="pro_name"/></td>
                </tr>
                <tr>
                    <td>Category</td>
                    <td><select name="cate">
                            <c:forEach var="cat" items="${listCate}">
                                <option value="${cat.catId}">${cat.catName}</option>
                            </c:forEach>
                        </select></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td><input type="text" name="price"/></td>
                </tr>               
                <tr>
                    <td>Discount</td>
                    <td><input type="text" name="discount" value="0"/></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><textarea name="des" rows="4" cols="20">
                        </textarea></td>
                </tr>
                <tr>
                    <td>Choose a image</td>
                    <td><input type="file" name="image" value="Choose"/></td>
                </tr>
            </table>
            <input type="submit" name="action" value="Submit"/>
        </form>
    </body>
</html>
