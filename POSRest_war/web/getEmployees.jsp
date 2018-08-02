<%-- 
    Document   : getEmployees
    Created on : Jul 24, 2018, 9:57:13 AM
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
        <h1>show Employees</h1>
        <form action="getEmployeesServlet" method="post">
            <table border="1">
                <tr>
            
                    <td>Employees Name</td>
                    <td>User Name</td>
                    <td>Email</td>
                    <td>Roles</td>
                    <td>Phone</td>
                    <td>Action</td>
                </tr>
                <c:forEach var="e" items="${list}">
                    <tr>
                 
                        <td>${e.empName}</td>
                        <td>${e.username}</td>
                        <td>${e.email}</td>
                        <td>${e.roleId.roleName}</td>
                        <td>${e.phone}</td>
                        <td><a href="deleteEmployeesServlet?emp_id=${e.empId}">Delete</a>
                            <a href="editEmployeesServlet?emp_id=${e.empId}">Edit</a>
                            <a href="">View Image</a></td>
                    </tr>        
                </c:forEach>
            </table>
            <a href="insertEmployeesServlet">Add Employees</a>
        </form>
    </body>
</html>
