<%-- 
    Document   : customerhome
    Created on : 12 Oct, 2023, 8:17:50 PM
    Author     : Garima
--%>
<%
    if (session.getAttribute("custid") == null) {
        // user login krke nhi aaya h 
        response.sendRedirect("../login.jsp");
    } else {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Zone</title>
        <link href="../css/bootstrap.css" rel="stylesheet"/>
        <script src="../js/bootstrap.bundle.js"></script>
    </head>
    <body>
        <div class="container">
            
            <jsp:include page="header.jsp"/>
            <div class="row">
                <div class="col-sm-12" style="background-color: pink;min-height: 600px"></div>
            </div>
                <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
<% }%>
