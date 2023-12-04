<%@page import="java.sql.ResultSet"%>
<%@page import="connect.DbManager"%>
<%
    if (request.getParameter("page").equals("contactus")) {
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String contactno = request.getParameter("contactno");
        String emailaddress = request.getParameter("emailaddress");
        String enquirytext = request.getParameter("enquirytext");

        DbManager dm = new DbManager();
        String query = "insert into enquiry(name,gender,address,contactno,emailaddress,enquirytext,enquirydate) values('" + name + "','" + gender + "','" + address + "','" + contactno + "','" + emailaddress + "','" + enquirytext + "',curdate())";
        boolean res = dm.insertUpdateDelete(query);
        if (res == true) {
            out.print("<script>alert('Enquiry is Submitted');window.location.href='contactus.jsp';</script>");
        } else {
            out.print("<script>alert('Enquiry is not Submitted');window.location.href='contactus.jsp';</script>");

        }
    } else if (request.getParameter("page").equals("registration")) {
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String contactno = request.getParameter("contactno");
        String emailaddress = request.getParameter("emailaddress");
        String password = request.getParameter("password");

        DbManager dm = new DbManager();
        String query1 = "insert into customer values('" + name + "','" + gender + "','" + address + "','" + contactno + "','" + emailaddress + "',curdate())";
        String query2 = "insert into login values('" + contactno + "','" + password + "','customer')";

        if (dm.insertUpdateDelete(query1)) {

            if (dm.insertUpdateDelete(query2)) {
                //Registration is done
                out.print("<script>alert('Registration is done');window.location.href='registration.jsp';</script>");
            }
        } else {
            //Registration is not done
            out.print("<script>alert('Registration is not done');window.location.href='registration.jsp';</script>");
        }
    } else if (request.getParameter("page").equals("login")) {
        String userid = request.getParameter("userid");
        String password = request.getParameter("password");
        DbManager dm = new DbManager();
        String query = "select * from login where userid='" + userid + "' and password='" + password + "'";

        ResultSet rs = dm.select(query);

        if (rs.next()) {
            String usertype = rs.getString("usertype");
            if (usertype.equals("customer")) {
                session.setAttribute("custid", userid);
                response.sendRedirect("customerzone/customerhome.jsp");
//            out.print("<script>alert('welcome to customer zone');window.location.href='login.jsp'</script>");
            } else if (usertype.equals("admin")) {
//                out.print("<script>alert('welcome to admin zone');window.location.href='login.jsp'</script>");
                session.setAttribute("adminid", userid);
                response.sendRedirect("adminzone/adminhome.jsp");
            }
        } else {
            out.print("<script>alert('invalid user');window.location.href='login.jsp'</script>");

        }
    }
%>



