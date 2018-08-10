<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <c:choose>
                <c:when test="${locale=='en'}">
                    <fmt:setLocale value="en" scope="session"/>
                </c:when>
                <c:when test="${locale=='vi'}">
                    <fmt:setLocale value="vi" scope="session"/>
                </c:when>               
            </c:choose>
        </div>
    </body>
</html>
