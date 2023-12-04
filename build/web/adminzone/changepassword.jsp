<%-- 
    Document   : adminhome
    Created on : 16 Oct, 2023, 8:52:18 PM
    Author     : Garima
--%>
<%
    if (session.getAttribute("adminid") == null) {
        response.sendRedirect("../login.jsp");
    } else {

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
                    <h2 style="color: blue;text-align: center">Change Password</h2>
                    <form class="form-group" method="post" action="admincontroller.jsp">
                        <input type="hidden" name="page" value="changepassword"/>
                        <table class="table table-bordered" style="width: 60%;margin: auto;">
                            <tr>
                                <td>Enter Old Password</td>
                                <td><input type="password" name="oldpassword" class="form-control" required="true"/></td>
                            </tr>
                            <tr>
                                <td>Enter New Password</td>
                                <td>
                                    <input type="password" name="newpassword" class="form-control" required="ture"/>
                                </td>
                            </tr>
                            <tr>
                                <td>Confirm Password</td>
                                <td>
                                    <input type="password" name="confirmpassword" class="form-control" required="ture"/>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <button type="submit" class="btn btn-success">Change Password</button>
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
<% }%>
