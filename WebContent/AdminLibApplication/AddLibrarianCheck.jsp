<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*,java.util.*"%>
    <%
    String id=request.getParameter("id");
   // System.out.println(eid1);
    String  lname=request.getParameter("lname");
    String lcurrentpassword=request.getParameter("lcurrentpassword");
    String laddress=request.getParameter("laddress");
    String lcontact=request.getParameter("lcontact");
    String lemail=request.getParameter("lemail");
    String lcity=request.getParameter("lcity");
    
    try
    {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lib", "rahul", "pass");
    Statement st=conn.createStatement();
    int i=st.executeUpdate("insert into librarian(lid,lname,currentpassword,laddress,lcontact,lemail,lcity) values('"+id+"','"+lname+"','"+lcurrentpassword+"','"+laddress+"','"+lcontact+"','"+lemail+"','"+lcity+"')");
    response.setContentType("text/html");
 	PrintWriter pw=response.getWriter();
    pw.print("<h4>Librarian added successfully</h4>");
    pw.print("<h4>Member added successfully</h4>");
    response.sendRedirect("LibApplication.jsp");
    out.println("</div>");
	pw.close();

    }
    catch(Exception e)
    {
    System.out.print(e);
    e.printStackTrace();
    }  
    
    
    %>

