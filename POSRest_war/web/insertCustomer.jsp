
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Insert Customers </h1>
        <form action="insertCustomerServlet" method="post">
            <table border="1">
            
                
                <tr>
                    <td>Customer Name</td>
                    <td><input type="text" name="cus_name"/></td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td><input type="text" name="phone"/></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="email"/></td>
                </tr>
                <tr>
                    <td>Discount</td>
                    <td><input type="number" name="discount"/></td>
                </tr>
                
            </table>
            <input type="submit" value="insert"/>
        </form>
    </body>
</html>
