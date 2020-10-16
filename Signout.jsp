<%-- 
    Document   : Signout
    Created on : Oct 10, 2019, 6:28:05 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%session.invalidate();%>
        
        
         <%
            HttpSession nsession = request.getSession(false);
                         response.sendRedirect("index.jsp");
        %>
    </body>
</html>
