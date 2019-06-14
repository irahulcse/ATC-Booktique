<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*,java.util.*"%>
    <%
    String memid=request.getParameter("memid");
    //System.out.println(eid1);
    String  mname=request.getParameter("mname");
    String maddress=request.getParameter("maddress");
    String mcontact=request.getParameter("mcontact");
    String memail=request.getParameter("memail");
    String mcity=request.getParameter("mcity");
    String memtyp=request.getParameter("memtyp");
    String superviser_name=request.getParameter("superviser_name");
    String superviser_emailid=request.getParameter("superviser_emailid");
    try
    {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lib", "rahul", "pass");
    Statement st=conn.createStatement();
    int i=st.executeUpdate("insert into mem(memid,mname,maddress,mcontact,memail,mcity,memtyp,superviser_name,superviser_emailid) values('"+memid+"','"+mname+"','"+maddress+"','"+mcontact+"','"+memail+"','"+mcity+"','"+memtyp+"','"+superviser_name+"','"+superviser_emailid+"')");
    response.setContentType("text/html");
 	PrintWriter pw=response.getWriter();
    pw.print("<h4>Member added successfully</h4>");
    response.sendRedirect("MemApplication.jsp");
    out.println("</div>");
	pw.close();

    }
    catch(Exception e)
    {
    System.out.print(e);
    e.printStackTrace();
    }  
    
    
    %>

