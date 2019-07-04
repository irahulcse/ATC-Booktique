<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*,java.util.*"%>
    <%
    String bookno=request.getParameter("bookno");
    //System.out.println(eid1);
    String  bookname=request.getParameter("bookname");
    String author=request.getParameter("author");
    String publisher=request.getParameter("publisher");
    String publication_year=request.getParameter("publication_year");
    String language=request.getParameter("language");
    String bcategoryid=request.getParameter("bcategoryid");
    /* String isbn_no=request.getParameter("isbn_no"); */
    String qoh=request.getParameter("qoh");
    String bookprice=request.getParameter("bookprice");
    try
    {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lib", "rahul", "pass");
    Statement st=conn.createStatement();
    int i=st.executeUpdate("insert into books(bookno,bookname,author,publisher,publication_year,language,bcategoryid,qoh,bookprice) values('"+bookno+"','"+bookname+"','"+author+"','"+publisher+"','"+publication_year+"','"+language+"','"+bcategoryid+"','"+qoh+"','"+bookprice+"')");
    response.setContentType("text/html");
 	PrintWriter pw=response.getWriter();
    pw.print("<h4>Book added successfully</h4>");
    response.sendRedirect("BookApplication.jsp");
    out.println("</div>");
	pw.close();

    }
    catch(Exception e)
    {
    System.out.print(e);
    e.printStackTrace();
    }  
    
    
    %>

