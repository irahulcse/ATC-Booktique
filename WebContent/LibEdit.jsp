<html>
<head>
<link rel='stylesheet' href='bootstrap.min.css'/>
</head>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<jsp:include page="navheader.jsp" />
<br>
<form method="post" action="LibUpdate.jsp" name="form">
<%
String id=request.getParameter("id");
int no=Integer.parseInt(id);
int sumcount=0;
try {
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lib", "rahul", "pass");
String query = "select * from librarian where id='"+no+"'";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>
 <div id="form-wrapper" style="max-width:500px;margin:auto; text-align: center;">
    <label for="name1" text-align: center;>Employee Id</label>
    <input type="text" class="form-control" name="lid" value="<%=rs.getString(2)%>" disabled/>
</div>
<div id="form-wrapper" style="max-width:500px;margin:auto; text-align: center;">
    <label for="name1">Name</label>
    <input type="text" class="form-control" name="lname" value="<%=rs.getString(3)%>"/>
</div>
<div id="form-wrapper" style="max-width:500px;margin:auto; text-align: center;">
    <label for="name1">Address</label>
    <input type="text" class="form-control" name="laddress" value="<%=rs.getString(7)%>" />
</div>
<div id="form-wrapper" style="max-width:500px;margin:auto; text-align: center;">
    <label for="name1">Contact</label>
    <input type="text" class="form-control" name="lcontact" value="<%=rs.getString(9)%>" />
</div>
<div id="form-wrapper" style="max-width:500px;margin:auto; text-align: center;">
    <label for="name1">Email</label>
    <input type="text" class="form-control" name="lemail" value="<%=rs.getString(6)%>" />
</div>
<div id="form-wrapper" style="max-width:500px;margin:auto; text-align: center;">
    <label for="name1">City</label>
    <input type="text" class="form-control" name="lcity" value="<%=rs.getString(8)%>" />
</div>
<div id="form-wrapper" style="max-width:500px;margin:auto; text-align: center;">
    <input type="hidden" class="form-control" name="id" value="<%=rs.getString(1)%>" />
</div>
<%--  <tr>
<td><input type="text" name="lid" value="<%=rs.getString(2)%>" disabled></td>
<td><input type="text" name="lname" value="<%=rs.getString(3)%>"></td>
<td><input type="text" name="laddress" value="<%=rs.getString(7)%>"></td>
<td><input type="text" name="lcontact" value="<%=rs.getString(9)%>"></td>
<td><input type="text" name="lemail" value="<%=rs.getString(6)%>"></td>
<td><input type="text" name="lcity" value="<%=rs.getString(8)%>"></td>
<td><input type="hidden" name="id" value="<%=rs.getString(1)%>"></td>
</tr> --%>
<div id="form-wrapper" style="max-width:500px;margin:auto; text-align: center;">
<input type="submit" name="Submit" value="Update" style="background-color:#49743D;font-weight:bold;color:#ffffff;"></td>
</div>
<%
}
}
catch(Exception e){
	System.out.println(e);
}
%>
</form>
</html>