<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="java.sql.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
 
  

<title>Insert title here</title>
</head>
<body>
<jsp:include page="../LibrarianMemApplication/navheader.jsp" />

<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "lib";
String userId = "root";
String password = "password";
String mname=request.getParameter("mname");
System.out.println("defaulter"+mname);


try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<div class="table-responsive">
<table  width="100%" class="table table-striped table-bordered table-hover table-condensed" >
<tr>

</tr>
<tr  bgcolor="white">
<td><b>MemberId</b></td>
<td><b>MemberName</b></td>
<td><b>Contact</b></td>
<td><b>Email ID</b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="select * from defaulter where str_to_date(expreturndate,'%Y-%m-%d')<=current_date() and mname LIKE '%"+mname+"%' LIMIT 1";
System.out.println(sql);
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>


<td><%=resultSet.getString("memid") %></td>
<td><%=resultSet.getString("mname") %></td>
<td><%=resultSet.getString("mcontact") %></td>
<td><%=resultSet.getString("memail") %></td>
</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</div>


</body>
</html>