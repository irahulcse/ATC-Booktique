<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<link rel='stylesheet' href='../bootstrap.min.css'/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ATC Library</title>
</head>
<style type="text/css">body { background:  white !important; }
.btn {
  background-color: DodgerBlue;
  border: none;
  color: white;
  padding: 12px 30px;
  cursor: pointer;
  font-size: 20px;
}
</style>
<script>
function greeting(){
    alert("Thanks For Downloading The File! It will be downloaded in csv folder of the C: directory");
}
</script>
<body>
<%
	response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Expires","0");
if(session.getAttribute("libusername")==null)
{
	response.sendRedirect("../index.jsp");
}
%>
<jsp:include page="Search.jsp" /> 
<div style=" float:left;width:280px">
<form name="TrainerMenu" action="../export/exportReturnTrans.jsp" method="post" onsubmit="greeting()"> 
<button id="myBtn" class="btn"  style="float:right" onclick="openPage('exportReturnTrans.jsp')">DOWNLOAD AS CSV</button>
</form>
</div>
<br>
<h3 align="center"><strong>Issued Details Panel</strong></h3>
<form method="post" name="form" onsubmit="greeting()">
<div class='container'>
<table class='table table-bordered table-striped' border="1">
<tr><th>TRANS NO</th><th>BOOKS NO</th><th>MEMBER ID</th><th>TRANSACTION DATE</th><th>EXPECTED RETURN DATE</th><th>RETURN BOOK</th></tr>
<%
Connection con = null;
String url = "jdbc:mysql://localhost:3306/";
String db = "lib";
String driver = "com.mysql.jdbc.Driver";
String userName ="rahul";
String password="pass";


Statement st;
Statement st2;
try{
Class.forName(driver);
con = DriverManager.getConnection(url+db,userName,password);
String query = "select * from trans where tdeleted='y'";
st = con.createStatement();
ResultSet rs = st.executeQuery(query);

%>
<%
while(rs.next()){
%>
<tr><td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><input type="button" name="delete" value="Successful Transaction" style="background-color:green;font-weight:bold;color:white;"></td>
</tr>
<%
}
%>
<%
}
catch(Exception e){
e.printStackTrace();
}
%>
</table>
</div>
</form>

</body>
</html>