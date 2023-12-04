<%-- 
    Document   : customerhome
    Created on : 12 Oct, 2023, 8:17:50 PM
    Author     : Garima
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connect.DbManager"%>
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
                <div class="col-sm-12" style="background-color: pink;min-height: 600px">
                    <h2 style="text-align: center;color: blue;">List of Products</h2>
                    <table class="table table-bordered">
                        <tr>
                            <th>Id</th>
                            <th>Product Name</th>
                            <th>Mfg Date</th>
                            <th>Exp Date</th>
                            <th>Qty</th>
                            <th>Price per unit</th>
                            <th>Product</th>
                        </tr>
                        <%
                            DbManager dm=new DbManager();
                            String query="select * from product";
                            ResultSet rs=dm.select(query);
                            while(rs.next()){
                        %>
                        <tr>
                            <td><%=rs.getInt("id")%></td>
                            <td><%=rs.getString("pname")%></td>
                            <td><%=rs.getString("mfgdate")%></td>
                            <td><%=rs.getString("expdate")%></td>
                            <td><%=rs.getInt("qty")%></td>
                            <td><%=rs.getInt("priceperunit")%></td>
                            <td>
                                <img src="<%=request.getContextPath()%>/upload/<%=rs.getString("productimage")%>" height="100" width="100" />
                            </td>
                        </tr>
                        <%}%>
                    </table>
                </div>
            </div>
                <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
<% }%>
