<%-- 
    Document   : insertEmployees
    Created on : Jul 24, 2018, 11:12:26 AM
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
        <form action="insertEmployeesServlet" method="post">
            <table border="1">
                <tr>
                    <td>Employee name</td>
                    <td><input type="text" name="emp_name"/></td>
                </tr>
                <tr>
                    <td>user</td>
                    <td><input type="text" name="user"/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="pass"/></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="email"/></td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td><input type="number" name="phone"/></td>
                </tr>
                <tr>
                    <td>Roles</td>
                    <td><select name="rol">
                            <c:forEach var="r" items="${list}">
                                <option value="${r.roleId}">${r.roleName}</option>
                            </c:forEach>
                        </select></td>
                </tr>
                <tr>
                    <td>Choose a image</td>
                    <td><input type="file" name="image" value="Choose"/></td>
                </tr>
            </table>
            <input type="submit" value="Submit"/>
        </form>
    </body>
</html>
