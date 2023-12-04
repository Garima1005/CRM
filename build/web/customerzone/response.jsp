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
                <div class="col-sm-12" style="background-color: pink;min-height: 600px">
                    <h2 style="color: blue;text-align: center;">Response Form</h2>
                    <form method="post" class="form-group" action="custcontroller.jsp">
                        <input type="hidden" name="page" value="response"/>
                        <table class="table table-bordered" style="width: 70%;margin: auto">
                            <tr>
                                <td>Select Response Type</td>
                                <td>
                                    <select name="responsetype" class="form-control">
                                        <option selected>-Select Response Type-</option>
                                        <option value="feedback">Feedback</option>
                                        <option value="complain">Complain</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Enter Subject</td>
                                <td>
                                    <input type="text" name="subject" class="form-control"/>
                                </td>
                            </tr>
                            <tr>
                                <td>Enter Response Text</td>
                                <td>
                                    <textarea name="responsetext" class="form-control"></textarea>
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
                </div>
            </div>
                <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
<% }%>
