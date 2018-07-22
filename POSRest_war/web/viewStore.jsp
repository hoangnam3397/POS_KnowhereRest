<%-- 
    Document   : viewStore
    Created on : Jul 17, 2018, 11:09:18 AM
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
        <h1>Hello World!</h1>
        <form action="viewStoreServlet" method="post">
            <table>
                <tr>
                    <td>Store Name</td>
                    <td>Address</td>
                    <td>Phone</td>
                    <td>Action</td>
                </tr>
                <c:forEach var="s" items="${list}">
                    <tr>
                        <td>${s.stoName}</td>
                        <td>${s.address}</td>
                        <td>${s.phonesto}</td>
                        <td><a href="deleteStoreServlet?sto_id=${s.stoId}">Delete</a>
                            <a href="editStoreServlet?sto_id=${s.stoId}&action=get">Edit</a>
                            <a href="getTableServlet?sto_id=${s.stoId}">Edit Table Manager</a></td>
                    </tr>
                </c:forEach>
            </table>
            <a href="insertStore.jsp">Add Store</a>
        </form>
    </body>
</html>
