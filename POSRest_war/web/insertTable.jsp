<%-- 
    Document   : insertTable
    Created on : Jul 19, 2018, 8:17:02 PM
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
        <form action="insertTableServlet" method="post">
            <table>
                <tr>
                    <td>Table ID</td>
                    <td><input type="text" name="tab_id"/></td>
                </tr>
                <tr>
                    <td>Table name/Number</td>
                    <td><input type="text" name="tab_name"/></td>
                </tr>
                <tr>
                    <td>Choose a zone</td>
                    <td><select name="zone_id">
                            <c:forEach var="z" items="${listZone}">
                                <option value="${z.zoneId}" >${z.zoneName}</option>                                
                            </c:forEach>                               
                        </select></td>
                </tr>
            </table>
            <input type="submit" value="Submit"/>            
        </form>
    </body>
</html>
