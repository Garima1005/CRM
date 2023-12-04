<%-- 
    Document   : index
    Created on : 4 Oct, 2023, 9:14:24 PM
    Author     : Garima
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="connect.DbManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CRM for MARC Lab.</title>
        <link href="css/bootstrap.css" rel="stylesheet"/>
        <script src="js/bootstrap.bundle.js"></script>
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp"/>
            <div class="row">
                <div class="col-sm-4" style="background-color: aqua;min-height: 600px">
                    <marquee direction="up" height="600px" behavior="alternate" onmouseover="stop()" onmouseout="start()">
                    <%
                        DbManager dm=new DbManager();
                        String query="select * from news order by id desc";
                        ResultSet rs=dm.select(query);
                        int i=1;
                        while(rs.next())
                        {
                        %>
                        <p style="text-align: center;"><%=i%>-<%=rs.getString("newstext")%></p>
                        <% } %>
                        </marquee>
                </div>
                <div class="col-sm-8" style="background-color: pink;min-height: 600px">
                    <h2 style="color:blue;text-align: center;">Login Form</h2>
                    <form metho="post" class="form-group" action="controller.jsp">
                        <input type="hidden" name="page" value="login"/>
                        <table class="table table-bordered">
                            <tr>
                                <td>Enter User Id</td>
                                <td>
                                    <input type="text" name="userid" class="form-control"/>
                                </td>
                            </tr>
                            <tr>
                                <td>Enter Password</td>
                                <td>
                                    <input type="password" name="password" class="form-control"/>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <button type="submit" class="btn btn-success">Login</button>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
