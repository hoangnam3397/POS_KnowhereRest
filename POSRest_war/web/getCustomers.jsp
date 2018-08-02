<%-- 
    Document   : getCustomers
    Created on : Aug 1, 2018, 12:06:03 AM
    Author     : Tuan
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
        <form action="getCustomerServlet" method="post">
            <table border="1">
                <tr>
                  
                    <td>Customer Name</td>
                    <td>Phone</td>
                    <td>Email</td>
                    <td>Discount</td>
                    <td>Action</td>
                </tr>

                <c:forEach var="c" items="${list}">
                    <tr>
                       
                        <td>${c.cusName}</td>
                        <td>${c.phone}</td>
                        <td>${c.email}</td>
                        <td>${c.discount}</td>
                        <td><a href="">Delete Customer</td>
                        <td><a href="">edit Customer</td>
                    </tr>
                </c:forEach>
            </table>
            <a href="insertCustomer.jsp">Add New Customer</a>
        </form>
    </body>
</html>
