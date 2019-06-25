
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
String lid=request.getParameter("libid");
String currentPassword=request.getParameter("current");
String Newpass=request.getParameter("new");
String conpass=request.getParameter("confirm");
String connurl = "jdbc:mysql://localhost:3306/lib";
Connection con=null;
String pass="";
try{
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(connurl, "rahul", "pass");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from librarian where lid='"+lid+"' and currentpassword ='"+currentPassword+"'");
while(rs.next()){
pass=rs.getString(4);
}
if(pass.equals(currentPassword)){
Statement st1=con.createStatement();
int i=st1.executeUpdate("update librarian set currentpassword='"+Newpass+"' where lid='"+lid+"'");
%>
<script>
function alertsomething(){
	  alert("Nice! Password had been changed!");
	}

	//function works when button clicks 
	$("#btd").click(function(){
	  alertsomething();
	})

	//function automatically when page loads
	$(document).ready(function(){
	  alertsomething();
	  window.location.href = "../index.jsp";
	})
</script>
<% 
st1.close();
con.close();
}
else{
%>
<script>
function alertsomething(){
	  alert("Sorry Wrong Current Password!");
	}

	//function works when button clicks 
	$("#btd").click(function(){
	  alertsomething();
	})

	//function automatically when page loads
	$(document).ready(function(){
	  alertsomething();
	  window.location.href = "../index.jsp";
	})
</script>
<%
}
}
catch(Exception e){
out.println(e);
}
%> 