<%-- 
    Document   : editTable
    Created on : Jul 19, 2018, 9:11:18 PM
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
        <form action="editTableServlet" method="post">
            <table>
                <tr>
                    <td>Table name/Number</td>
                    <td><input type="text" name="tab_name" value="${tabName}"/></td>
                </tr>
                <tr>
                    <td>Choose a zone</td>
                    <td><select name="zone">
                            <c:forEach var="z" items="${listZone}">
                                <c:if test="${z.zoneId==zoID}">
                                    <option selected value="${z.zoneId}">${z.zoneName}</option>
                                </c:if>
                                <c:if test="${z.zoneId!=zoID}">
                                    <option value="${z.zoneId}">${z.zoneName}</option>
                                </c:if>
                            </c:forEach>                         
                        </select></td>
                </tr>
            </table>
            <input type="submit" name="action" value="Submit"/>
        </form>
    </body>
</html>
