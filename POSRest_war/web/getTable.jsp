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
            <c:forEach var="s" items="${listZone}">
                ${s.zoneName}
                <a href="editZoneServlet?id=${s.zoneId}">Edit</a>
                <a href="deleteZoneServlet?id=${s.zoneId}">Delete</a>
            </c:forEach>
            <a href="insertZoneServlet?id=${id}">Add Zone</a>
            <h1>Store Tables</h1>
            <a href="insertTableServlet">Add Table</a>
            <table border="1">
                <tr>
                    <td>Table name/Number</td>
                    <td>Zone Name</td>
                    <td>Action</td>
                </tr>
                <c:forEach var="t" items="${listTable}">
                    <tr>
                        <td>${t.tabName}</td>
                        <td>${t.zoneId.zoneName}</td>
                        <td><a href="editTableServlet?id=${t.tabId}">Edit</a>
                            <a href="deleteTableServlet?id=${t.tabId}">Delete</a></td>
                    </tr>
                </c:forEach>
            </table>
            
        </form>               
    </body>
</html>
