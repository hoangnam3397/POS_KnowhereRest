<%-- 
    Document   : editProduct
    Created on : Jul 20, 2018, 10:16:24 PM
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
        <form action="editProductServlet" method="post">
            <table>
                <tr>
                    <td>Product Name</td>
                    <td><input type="text" name="pro_name" value="${proName}"/></td>
                </tr>
                <tr>
                    <td>Category</td>
                    <td><select name="cate">                    
                            <c:forEach var="z" items="${listCate}">
                                <c:if test="${z.catId==cateid}">
                                    <option selected value="${z.catId}">${z.catName}</option>
                                </c:if>
                                <c:if test="${z.catId!=cateid}">
                                    <option value="${z.catId}">${z.catName}</option>
                                </c:if>
                            </c:forEach> 
                        </select></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td><input type="text" name="price" value="${price}"/></td>
                </tr>               
                <tr>
                    <td>Discount</td>
                    <td><input type="text" name="discount" value="${dis}"/></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><textarea name="des" rows="4" cols="20">${des}
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
