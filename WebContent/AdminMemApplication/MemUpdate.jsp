<%@page import="java.sql.*"%>
<%
String ide=request.getParameter("id");
int num=Integer.parseInt(ide);
String memid=request.getParameter("memid");
String mname=request.getParameter("mname");
String maddress=request.getParameter("maddress");
String mcontact=request.getParameter("mcontact");
String memail=request.getParameter("memail");
String mcity=request.getParameter("mcity");
String memptyp=request.getParameter("memptyp");
String superviser_name=request.getParameter("superviser_name");
String superviser_emailid=request.getParameter("superviser_emailid");

try{
Connection conn = null;
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lib","rahul", "pass");
Statement st=null;
st=conn.createStatement();
st.executeUpdate("update mem set mname='"+mname+"',maddress='"+maddress+"',mcontact='"+mcontact+"',memail='"+memail+"',mcity='"+mcity+"',memtyp='"+memptyp+"',superviser_name='"+superviser_name+"',superviser_emailid='"+superviser_emailid+"' where id="+num);
response.sendRedirect("MemApplication.jsp");
}
catch(Exception e){
System.out.println(e);
}
%>