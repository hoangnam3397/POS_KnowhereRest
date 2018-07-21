<%-- 
    Document   : insertStore
    Created on : Jul 17, 2018, 9:18:08 AM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Store</title>
    </head>
    <body>
        <form action="insertStoreServlet" method="post">
            <table>
                <tr>
                    <td>Store ID</td>
                    <td><input type="text" name="sto_id"/></td>
                </tr>
                <tr>
                    <td>Store Name</td>
                    <td><input type="text" name="sto_name"/></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" name="address"/></td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td><input type="text" name="phonesto"</td>
                </tr>
            </table>
            <input type="submit" value="Add Store"/>
        </form>
    </body>
</html>
