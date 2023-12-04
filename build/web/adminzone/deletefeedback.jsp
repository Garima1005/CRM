<%@page import="connect.DbManager"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));

    DbManager dm = new DbManager();
    String query = "delete from response where id='" + id + "'";
    if (dm.insertUpdateDelete(query)) {
        out.print("<script>alert('Feedback is deleted');window.location.href='feedback.jsp';</script>");
    } else {
        out.print("<script>alert('Feedback is deleted');window.location.href='feedback.jsp';</script>");
    }

%>