<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='../bootstrap.min.css'/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
<script type="text/javascript" >
    function greeting(){
        alert("Thanks For Downloading The File! It will be downloaded in csv folder of the C: directory");
    }
    function greeting2()
    {
    	alert("Welcome To The Panel Where All Books Are Returned Successfully");
    }
    function deleteRecord(id){
        var f=document.form;
        f.method="post";
        f.action='ReturnBookCheck.jsp?id='+id;
        f.submit();
    }
</script>
</head>
<body>
 <%
	response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Expires","0");
if(session.getAttribute("username")==null)
{
	response.sendRedirect("../index.jsp");
}
%>
<jsp:include page="Search.jsp" /> 	
<div style=" float:left;width:280px">
<form name="TrainerMenu" action="/HelloJSP/export/exportTrans.jsp" method="post" onsubmit="greeting()"> 
<button id="myBtn" class="btn"  style="float:right" onclick="openPage('exportTrans.jsp')">DOWNLOAD AS CSV</button>
</form>
</div>
<div style=" float:left;width:280px">
<form name="TrainerMenu" action="ReturnedBookApplication.jsp" method="post" onsubmit="greeting2()">
<button id="myBtn" class="btn"  style="float:right" onclick="openPage('ReturnedBookApplication.jsp')">RETURNED BOOK PANEL</button>
</form>
</div>
<br>
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
String query = "select * from trans where tdeleted='n'";
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
<script>
function confirmComplete(id) {
	var answer=confirm("Before Returning, Pls check the Book Properly?");
	if (answer==true)
	  {
		deleteRecord(id);
	  }
	else
	  {
	    return false;
	  }
}
</script>
<td><input type="button" name="delete" value="Return Book" style="background-color:red;font-weight:bold;color:white;" onclick="{return confirmComplete(<%=rs.getString(1)%>);}"></td>
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
<jsp:include page="navfooter.jsp" />
</body>
</html>