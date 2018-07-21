<%-- 
    Document   : addZone
    Created on : Jul 18, 2018, 10:50:42 PM
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
        
        <form action="insertZoneServlet" method="post">
            <table>
                <tr>
                    <td>Zone ID</td>
                    <td><input type="text" name="zone_id"</td>
                </tr>
                <tr>
                    <td>Zone Name</td>
                    <td><input type="text" name="zone_name"</td>
                </tr>
            </table>
            <input type="submit" name="action" value="Submit"/>
        </form>
    </body>
</html>
