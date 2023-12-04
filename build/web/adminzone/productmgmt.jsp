<%-- 
    Document   : adminhome
    Created on : 16 Oct, 2023, 8:52:18 PM
    Author     : Garima
--%>
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
                    <h2 style="text-align: center;color: blue ;">Add Products</h2>
                    <form class="form-group" method="post" action="../ProductUpload" enctype="multipart/form-data">
                        <table class="table table-bordered" style="margin: auto;width: 70%">
                            <tr>
                                <td>Enter Product Name</td>
                                <td>
                                    <input type="text" name="pname" required class="form-control"/>
                                </td>
                            </tr>
                            <tr>
                                <td>Enter Mfg Date</td>
                                <td>
                                    <input type="date" name="mfgdate" required class="form-control"/>
                                </td>
                            </tr>
                            <tr>
                                <td>Enter Exp Date</td>
                                <td>
                                    <input type="date" name="expdate" required class="form-control"/>
                                </td>
                            </tr>
                            <tr>
                                <td>Enter Qty</td>
                                <td>
                                    <input type="number" name="qty" required class="form-control"/>
                                </td>
                            </tr>
                            <tr>
                                <td>Enter Price Per Unit</td>
                                <td>
                                    <input type="number" name="priceperunit" required class="from-control"/>
                                </td>
                            </tr>
                            <tr>
                                <td>Select Product Image</td>
                                <td>
                                    <input type="file" name="productimage" required class="form-control"/>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <button type="submit" class="btn btn-success">Add Product</button>
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
