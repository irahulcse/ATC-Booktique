<%@page import="java.sql.*"%>
<%
String ide=request.getParameter("id");
int num=Integer.parseInt(ide);
String bookno=request.getParameter("bookno");
String bookname=request.getParameter("bookname");
String author=request.getParameter("author");
String publisher=request.getParameter("publisher");
String publication_year=request.getParameter("publication_year");
String language=request.getParameter("language");
String bcategoryid=request.getParameter("genre");
String isbn_no=request.getParameter("isbn_no");
String qoh=request.getParameter("qoh");
try{
Connection conn = null;
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lib","rahul", "pass");
Statement st=null;
st=conn.createStatement();
st.executeUpdate("update books set bookno='"+bookno+"',bookname='"+bookname+"',author='"+author+"',author='"+author+"',publisher='"+publisher+"',publication_year='"+publication_year+"',language='"+language+"',bcategoryid='"+bcategoryid+"',isbn_no='"+isbn_no+"',qoh='"+qoh+"' where id="+num);
response.sendRedirect("BookApplication.jsp");
}
catch(Exception e){
System.out.println(e);
}
%>