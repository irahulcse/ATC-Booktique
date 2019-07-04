<html>
<head>
<link rel='stylesheet' href='bootstrap.min.css'/>
</head>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%
	response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Expires","0");
if(session.getAttribute("libusername")==null)
{
	response.sendRedirect("../index.jsp");
}
%>

<jsp:include page="navheader.jsp" />
<form method="post" action="MemUpdate.jsp" name="form">
<%
String id=request.getParameter("id");
int no=Integer.parseInt(id);
int sumcount=0;
try {
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lib", "rahul", "pass");
String query = "select * from mem where id='"+no+"'";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>
<br>
<div id="form-wrapper" style="max-width:500px;margin:auto; text-align: center;">
    <label for="name1">ID</label>
    <input type="text" class="form-control" name="memid" value="<%=rs.getString(2)%>" disabled/>
</div>
<div id="form-wrapper" style="max-width:500px;margin:auto; text-align: center;">
    <label for="name1">NAME</label>
    <input type="text" class="form-control" name="mname" value="<%=rs.getString(3)%>" required/>
</div>
<div id="form-wrapper" style="max-width:500px;margin:auto; text-align: center;">
    <label for="name1">CONTACT</label>
    <input type="text" class="form-control" name="mcontact" value="<%=rs.getString(5)%>" pattern="[7-9]{1}[0-9]{9}" 
       title="Phone number with 7-9 and remaing 9 digit with 0-9" required/>
</div>
<div id="form-wrapper" style="max-width:500px;margin:auto; text-align: center;">
    <label for="name1">EMAIL</label>
    <input type="email" class="form-control" name="memail" value="<%=rs.getString(6)%>" pattern="[a-zA-Z]{3,}.+@americantower.com" title="Format of email id is name@americantower.com" required/>
</div>
<div id="form-wrapper" style="max-width:500px;margin:auto; text-align: center;">
    <label for="name1">EMP TYPE</label>
    <input type="text" class="form-control" name="memptyp" value="<%=rs.getString(8)%>" disabled/>
</div>
<div id="form-wrapper" style="max-width:500px;margin:auto; text-align: center;">
    <label for="name1">SUPERVISOR NAME</label>
    <input type="text" class="form-control" name="superviser_name" style="text-transform: capitalize;" value="<%=rs.getString(9)%>" required/>
</div>
<div id="form-wrapper" style="max-width:500px;margin:auto; text-align: center;">
    <label for="name1">SUPERVISOR EMAIL ID</label>
    <input type="text" class="form-control" name="superviser_emailid" value="<%=rs.getString(10)%>" pattern="[a-zA-Z]{3,}.+@americantower.com" title="Format of email id is name@americantower.com" required/>
</div>
<div id="form-wrapper" style="max-width:500px;margin:auto; text-align: center;">
    <label for="name1">BOOK ISSUED TILL NOW</label>
    <input type="text" class="form-control" name="mcount" value="<%=rs.getString(13)%>" disabled/>
</div>
<%-- <div id="form-wrapper" style="max-width:500px;margin:auto; text-align: center;">
    <label for="name1">ADDRESS</label>
    <input type="text" class="form-control" name="maddress" style="text-transform: capitalize;" value="<%=rs.getString(4)%>" readonly />
</div>
<div id="form-wrapper" style="max-width:500px;margin:auto; text-align: center;">
    <label for="name1">CITY</label>
    <input type="text" class="form-control" name="mcity" style="text-transform: capitalize;" value="<%=rs.getString(7)%>" readonly/>
</div> --%>
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