<%-- 
    Document   : editZone
    Created on : Jul 19, 2018, 8:42:21 PM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="editZoneServlet" method="post">
            Zone Name<input type="text" name="zone_name" value="${zoneName}"/>
            <input type="submit" value="Submit"/>
        </form>
    </body>
</html>
