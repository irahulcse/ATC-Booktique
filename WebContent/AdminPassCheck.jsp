
<%@page import="java.sql.*,java.util.*"%>
<%
String uid1=request.getParameter("uid1");
String  pass1=request.getParameter("password1");
String userName=new String("");
String password=new String("");
int count=0;
try
{
Class.forName("com.mysql.jdbc.Driver");
String sql = "SELECT * FROM admin where Uid='"+uid1+"' and password='"+pass1+"'";
Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/lib", "rahul", "pass");
Statement st=conn.createStatement();
ResultSet rs = st.executeQuery(sql);

if(rs.next()){
	session.setAttribute("uid1",uid1);
	response.sendRedirect("navadmin.jsp");
}
else{
	response.sendRedirect("index.jsp");
}
}
catch(Exception e){
	out.println(e);
}


%> 