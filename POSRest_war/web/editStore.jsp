<%-- 
    Document   : editStore
    Created on : Jul 18, 2018, 8:52:21 PM
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
        <h1>Hello World!</h1>
        <form action="editStoreServlet" method="post">
            <table>
                <tr>
                    <td>Store Name</td>
                    <td><input type="text" name="sto_name" value="${s.stoName}"</td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" name="address" value="${s.address}"</td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td><input type="text" name="phone" value="${s.phonesto}"</td>
                </tr>
                
            </table>
                <input type="submit" name="action" value="Submit"/>
        </form>
    </body>
</html>
