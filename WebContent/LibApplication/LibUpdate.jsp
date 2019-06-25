<%@page import="java.sql.*"%>
<%
String ide=request.getParameter("id");
int num=Integer.parseInt(ide);
String lid=request.getParameter("lid");
 String lname=request.getParameter("lname");
 String laddress=request.getParameter("laddress");
 String lcontact=request.getParameter("lcontact");
 String lemail=request.getParameter("lemail");
 String lcity=request.getParameter("lcity");
try{
Connection conn = null;
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lib","rahul", "pass");
Statement st=null;
st=conn.createStatement();
st.executeUpdate("update librarian set lname='"+lname+"',laddress='"+laddress+"',lcontact='"+lcontact+"',lemail='"+lemail+"',lcity='"+lcity+"' where id="+num);
response.sendRedirect("LibApplication.jsp");
}
catch(Exception e){
System.out.println(e);
}
%>