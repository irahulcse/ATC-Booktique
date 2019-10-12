<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "java.util.Date" %>

<%@ page import = "javax.servlet.*,java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%
         Date dNow = new Date( );
         SimpleDateFormat ft = 
         new SimpleDateFormat (" dd-MM-yyyy ");
         out.print( "<h2 align=\"center\">" + ft.format(dNow) + "</h2>");
      %>
      <form method="post">
      <select name="dt" class="mdb-select colorful-select dropdown-info">
  <option value="" disabled>Choose time period</option>
  <option value="0">Today</option>
  <option value="1">Yesterday</option>
  <option value="7">Last 7 days</option>
  <option value="30">Last 30 days</option>
</select>
<input type="submit" value="Transaction Records">
</form>
</div>
        <!--Grid column 1-->
          <!-- Grid column 2 -->          
          <div class="col-md-4 mb-4">
          <!--no of librarians-->

      
<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "lib";
String userId = "root";
String password = "password";
String selDate=request.getParameter("dt");

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<section class="mb-5">
<style> .equal-width td {   width: 21%; } </style>

<table class="equal-width" align="center" cellpadding="7" cellspacing="5" border="1">
<tr>

</tr>
<tr  bgcolor="white">
<td><b>TransactionId</b></td>
<td><b>BookNo</b></td>
<td><b>MemberId</b></td>
<td><b>Transaction Date</b></td>
<td><b>Expected Return Date</b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();

String sql ="select * from trans where  transactiondate  <= date_sub(current_date(),interval '"+selDate+"' day) and tdeleted='n'";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>


<tr bgcolor="#DEB887">
<td><%=resultSet.getInt("transno") %></td>
<td><%=resultSet.getString("bookno") %></td>
<td><%=resultSet.getString("memid") %></td>
<td><%=resultSet.getDate("transactiondate") %></td>
<td><%=resultSet.getString("expreturndate") %></td>
</tr>




<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>


</body>
</html>