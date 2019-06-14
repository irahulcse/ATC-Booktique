
<%@page import="java.sql.*,java.util.*"%>

<%
String bno=request.getParameter("bno1");
String  bname=request.getParameter("bname1");


try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lib", "rahul", "pass");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into book1(bno,name)values('"+bno+"','"+bname+"')");
out.println("Data is successfully inserted!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}

%> 