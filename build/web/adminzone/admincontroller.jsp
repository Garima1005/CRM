<%@page import="connect.DbManager"%>
<%
    if (request.getParameter("page").equals("changepassword")) {
        String oldpassword = request.getParameter("oldpassword");
        String newpassword = request.getParameter("newpassword");
        String confirmpassword = request.getParameter("confirmpassword");
        String userid = session.getAttribute("adminid").toString();
        
        if (newpassword.equals(confirmpassword)) {
            DbManager dm = new DbManager();
            String query = "update login set password='" + newpassword +"' where userid ='"+userid+"'  and password='"+oldpassword+"'  ";

            if (dm.insertUpdateDelete(query) == true) {
                response.sendRedirect("logout.jsp");
            } else {
                out.print("<script>alert('Oldpassword is not matched');window.location.href='changepassword.jsp';</script>");

            }
        } else {
            out.print("<script>alert('Newpassword and Confirmpassword are not matched');window.location.href='changepassword.jsp';</script>");

        }
    }
    
    else if(request.getParameter("page").equals("adminhome")){
        String newstext=request.getParameter("newstext");
        DbManager dm=new DbManager();
        String query="insert into news(newstext, posteddate) values('"+newstext+"',curdate())";
        if(dm.insertUpdateDelete(query)){
            out.print("<script>alert('News is added');window.location.href='adminhome.jsp'</script>");
        }
        else{
            out.print("<script>alert('News is not added');window.location.href='adminhome.jsp'</script>");
        
        }
    }
%>