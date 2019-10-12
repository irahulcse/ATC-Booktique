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
  <meta charset="utf-8">
  

  <title>BooksDue</title>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <!-- Bootstrap core CSS -->
  <link href="../css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="../css/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="../css/style.css" rel="stylesheet">
  <style type="text/css">
   .my-custom-scrollbar {
position: center;
height: 200px;
overflow: auto;
}
.table-wrapper-scroll-y {
display: block;
}
</style>
<script>
function greeting(){
    alert("Kindly create a CSV folder in your C directory. Your file will be downloaded in csv folder.");
}
 /* $("#myHref").on('click', function(mname) {
  /*    document.getElementById("myHref");  */
  /*   var f=document.form;
    f.method="post";
    f.action='Defaulter.jsp?mname='+mname;
    System.out.prinln("hello",+mname);
    f.submit();

});  */ */
</script>
<title>Insert title here</title>
</head>
<body>
<%
         Date dNow = new Date( );
         SimpleDateFormat ft = 
         new SimpleDateFormat ("dd/MM/yyyy");
         out.print( "<h2 align=\"center\">" + ft.format(dNow) + "</h2>"); 
%>
<div style=" float:left;width:280px">
<form name="TrainerMenu" action="/HelloJSP/export/ExportOverdue.jsp" method="post" onsubmit="greeting()"> 
<button id="myBtn" class="btn"  style="float:left" onclick="openPage('../export/ExportOverdue.jsp')">DOWNLOAD REPORT</button>
</form>
</div>
<br>
<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver"; 
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "lib";
String userId = "root";
String password = "password";
/* String mname=request.getParameter("mname");
System.out.println("HHHHH"+mname);
 */
try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
Statement stmt = null;
ResultSet resultSet = null;
ResultSet rs = null;
%>

<div class="table-responsive text-nowrap table-wrapper-scroll-y my-custom-scrollbar">
<table id="dtDynamicVerticalScrollExample" width="100%" class="table table-striped table-bordered table-hover table-condensed" align="center">
<tr>

</tr>
<br>
<tr  bgcolor="white">
<td><b>BookNo</b></td>
<td><b>BookName</b></td>
<td><b>MemberName</b></td>
<td><b>Expected Return Date</b></td>
<td><b>Days passed</b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
//stmt=connection.createStatement();
/* String sql2="select transno, DATEDIFF(current_date(),STR_TO_DATE(expreturndate, '%Y-%m-%d')) as days from transactions"; */
String sql ="select *, DATEDIFF(current_date(),STR_TO_DATE(expreturndate, '%Y-%m-%d')) as days from transactions where str_to_date(expreturndate,'%Y-%m-%d')<=current_date() and tdeleted='n'";

resultSet = statement.executeQuery(sql);

/* rs=statement.executeQuery(sql2); */
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("bookno") %></td>
<td><%=resultSet.getString("bookname") %></td>
<td><a href="../AdminDashboard/Defaulters.jsp?mname=<%=resultSet.getString("mname")%>"" ><%=resultSet.getString("mname") %></a></td>
<td><%=resultSet.getString("expreturndate") %></td>
<td><%=resultSet.getString("days") %></td>

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