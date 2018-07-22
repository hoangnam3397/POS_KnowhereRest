<%-- 
    Document   : getTable
    Created on : Jul 18, 2018, 10:13:40 PM
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
        <form action="getTableServlet" method="post">
            <h1>Store Zones</h1>
            <a href="insertZoneServlet?sto_id=${sto_id}&action=get">Add Zone</a>
            <a href="insertTableServlet?sto_id=${sto_id}&action=get">Add Table</a>
            <c:forEach var="s" items="${listZone}">
                <h4>${s.zoneName}
                    <a href="editZoneServlet?zone_id=${s.zoneId}&action=get">Edit</a>
                    <a href="deleteZoneServlet?zone_id=${s.zoneId}">Delete</a></h4>               
                    <table border="1">
                        <tr>
                            <td>Table name/Number</td>
                            <td>Zone Name</td>
                            <td>Action</td>
                        </tr>
                        <c:forEach var="t" items="${listTable}">
                            <c:if test="${s.zoneId==t.zoneId.zoneId}">
                                    <tr>
                                        <td>${t.tabName}</td>
                                        <td>${t.zoneId.zoneName}</td>
                                        <td><a href="editTableServlet?tab_id=${t.tabId}&action=get">Edit</a>
                                            <a href="deleteTableServlet?tab_id=${t.tabId}">Delete</a></td>
                                    </tr>
                            </c:if>
                        </c:forEach>
                    </table>                    
            </c:forEach>
        </form>               
    </body>
</html>
