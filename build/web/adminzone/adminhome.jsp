<%-- 
    Document   : adminhome
    Created on : 16 Oct, 2023, 8:52:18 PM
    Author     : Garima
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connect.DbManager"%>
<%
    if(session.getAttribute("adminid")==null)
    {
        response.sendRedirect("../login.jsp");
    }
    else{

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Relationship Management</title>
        <link href="../css/bootstrap.css" rel="stylesheet"/>
        <script src="../bootstrap.bundle.js"></script>
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp"/>
            <div class="row">
                <div class="col-sm-12" style="min-height: 600px;background-color: lightgrey;">
                    <h2 style="color: blue;text-align: center">Add News & Events</h2>
                    <form method="post" class="form-group" action="admincontroller.jsp">
                        <input type="hidden" name="page" value="adminhome"/>
                        <table class="table table-bordered" style="width:70%;margin: auto;">
                            <tr>
                                <td>Enter News</td>
                                <td>
                                    <textarea name="newstext" class="form-control" required></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <button type="submit" class="btn btn-success">Submit</button>
                                </td>
                            </tr>
                        </table>
                    </form>
                    <br/>
                    <table class="table table-bordered">
                        <tr>
                            <th>Id</th>
                            <th>News</th>
                            <th>Posted Date</th>
                            <th>Delete</th>
                        </tr>
                        <%
                            DbManager dm=new DbManager();
                            String query="select * from news";
                            ResultSet rs=dm.select(query);
                            int i=1;
                            while(rs.next())
                            {
                        %>
                        <tr>
                            <td><%=i%></td>
                            <td><%=rs.getString("newstext")%></td>
                            <td><%=rs.getString("posteddate")%></td>
                            <td>
                                <a href="delnews.jsp?id=<%=rs.getInt("id")%>">
                                    <button type="submit" class="btn btn-danger">Delete</button>
                                </a>
                            </td>
                        </tr>
                        <% i=i+1; } %>
                    </table>
                </div>
            </div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
<% }%>
