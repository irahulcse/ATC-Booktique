<%@page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
<%
String memid=request.getParameter("memid");
String bookno=request.getParameter("bookno1");
String expreturndate=request.getParameter("expreturndate");
try{
Connection conn = null;
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lib","rahul", "pass");
Statement st=null;
Statement st1=null;
Statement st2=null;
Statement st3=null;
st=conn.createStatement();
st1=conn.createStatement();
st2=conn.createStatement();
st.executeUpdate("insert into trans(memid,bookno,expreturndate) values('"+memid+"','"+bookno+"','"+expreturndate+"')");
st1.executeUpdate("update books set books.issued=books.issued+1,books.qoh=books.qoh-1 where bookno='"+bookno+"'");
st2.executeUpdate("update mem set mem.mcount=mem.mcount+1 where memid='"+memid+"'");
st2.executeUpdate("update mem set mem.mPending=mem.mcount-mem.mReturn where memid='"+memid+"'");
response.sendRedirect("TransApplication.jsp");
}	
catch(Exception e){
System.out.println(e);
}
%>