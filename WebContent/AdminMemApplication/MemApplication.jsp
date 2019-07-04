<%@ page import="java.sql.*" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
function editRecord(id){
    var f=document.form;
    f.method="post";
    f.action='MemEdit.jsp?id='+id;
    f.submit();
}
function deleteRecord(id){
    var f=document.form;
    f.method="post";
    f.action='MemDelete.jsp?id='+id;
    f.submit();
}
function myFunction() {
  window.print();
}
function greeting(){
    alert("Thanks For Download The File! It will be downloaded in csv folder of the C: directory");
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
<jsp:include page="navheader.jsp" />
<div style="width:300px">
<div style="float: right; width: 100px">
<button id="myBtn" class="btn" style="float:right">ADD </button>
</div>
<div style="float: right; width:200px">
<form name="TrainerMenu" action="../export/exportMem.jsp" method="post" onsubmit="greeting()">
<button id="myBtn" class="btn"  style="float:right" onclick="openPage('exportMem.jsp')" >DOWNLOAD AS CSV</button>
</form>
</div>
</div>





<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2 align="center"><strong>ADD MEMBER</strong></h2>
    </div>
<div class="modal-body">
 <div class="container">
<div class="row">
<div class="col-sm-8">
<form action="AddMemberCheck.jsp" method="post" style="width:300px" >
<div class="form-group">
<label for="name1">EID</label>
<%
int sumcount=0;
int count=0;
try {
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lib", "rahul", "pass");
String query = "select * from mem ORDER BY id DESC LIMIT 1";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
	count=rs.getInt(1);
%>
<input type="text" class="form-control" name="memid" id="name1" placeholder="Employee Id" readonly value=<%="ATCMEM"%><%=count+1%> >
<%
}
%>

<%
}
catch(Exception e){
	System.out.println(e);
}
%>
</div>
<div class="form-group">
    <label for="name1">Member Name&nbsp;<font color="red">*</font></label>
    <input type="text" class="form-control" name="mname" id="name1" style="text-transform: capitalize;" placeholder="Name" required/>
</div>
<div class="form-group">
    <label for="name1">Member Contact&nbsp;<font color="red">*</font></label>
    <input type="text" class="form-control" name="mcontact" id="name1" placeholder="Phone Contact No" pattern="[7-9]{1}[0-9]{9}" 
       title="Phone number with 7-9 and remaing 9 digit with 0-9" required/>
</div>
<div class="form-group">
    <label for="email1">Member Email&nbsp;<font color="red">*</font></label>
    <input type="email" class="form-control" name="memail" id="email1" placeholder="Enter American Tower Email Id" pattern="[a-zA-Z]{3,}.+@americantower.com" title="Format of email id is name@americantower.com" required/>
</div>
<div class="form-group">
    <label for="name1">Member Employee Type&nbsp;<font color="red">*</font></label>
    <!-- <input type="text" class="form-control" name="memtyp" id="name1" placeholder="Employee Type" required/> -->
	<select  name="memtyp" required>
	  <option value="">Select Employee Type</option>
	  <option value="Contract">Contract</option>
	  <option value="Permanent ATC">ATC Employee</option>
	  <option value="Other">Other Than</option>
	</select>
</div>
<div class="form-group">
    <label for="name1">Superviser Name&nbsp;<font color="red">*</font></label>
    <input type="text" class="form-control" name="superviser_name" id="name1" style="text-transform: capitalize;" placeholder="Superviser Name" required/>
</div>
<div class="form-group">
    <label for="name1">Superviser Email Id&nbsp;<font color="red">*</font></label>
    <input type="email" class="form-control" name="superviser_emailid" id="name1" placeholder="Superviser Email Id" pattern="[a-zA-Z]{3,}.+@americantower.com" title="Format of email id is name@americantower.com" required/>
</div>
<!-- <div class="form-group">
    <label for="name1">Member City</label>
    <input type="text" class="form-control" name="mcity" id="name1" style="text-transform: capitalize;" placeholder="City" />
</div>
<div class="form-group">
    <label for="name1">Member Address</label>
    <input type="text" class="form-control" name="maddress" id="name1" style="text-transform: capitalize;" placeholder="Address" />
</div> -->
<button type="submit" class="button">Submit</button>
</form>
 </div>
</div>
</div>
    </div>
    <div class="modal-footer">
    	 <!-- <form action="AddMemberCheck.jsp" method="post" style="width:300px" autocomplete="on">
      <button type="submit" class="buttonnew">Submit</button>
      </form>  -->
    </div>
  </div>

</div>
<jsp:include page="navfooter.jsp" />

<!-- </form> -->
<!-- <form style="position: absolute; right: 280;">
<button class="button" onclick="myFunction()"><i class="fa fa-download"> Download</i></button>
</form> -->
<br>
<br>
<form method="post" name="form">
<div>
<table class='table table-bordered table-striped' width="100%"  border="1" >
<tr align="left"><th>ID</th><th>NAME</th><!-- <th>ADDRESS</th> --><th >CONTACT</th><th>EMAIL</th><th>EMP TYPE</th><th>SUPERVISOR NAME</th><th>SUPERVISOR EMAIL ID</th><th>ISSUED BOOKS</th><th>RETURNED BOOKS</th><th>PENDING BOOKS</th></tr>
<%
Connection con = null;
String url = "jdbc:mysql://localhost:3306/";
String db = "lib";
String driver = "com.mysql.jdbc.Driver";
String userName ="rahul";
String password="pass";

Statement st;
try{
Class.forName(driver);
con = DriverManager.getConnection(url+db,userName,password);
String query = "select * from mem where mdeleted='n'";
st = con.createStatement();
ResultSet rs = st.executeQuery(query);
%>
<%
while(rs.next()){	
%>
<tr><td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<%-- <td><%=rs.getString(4)%></td> --%>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
<td><%=rs.getString(8)%></td>
<td><%=rs.getString(9)%></td>
<td><%=rs.getString(10)%></td>
<td><%=rs.getString(13)%></td>
<td><%=rs.getString(14)%></td>
<td><%=rs.getString(15)%></td>
<script>
function confirmComplete(id) {
	var answer=confirm("Are you sure you want to delete the member?");
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
<td><input type="button" name="edit" value="Edit" style="background-color:green;font-weight:bold;color:white;" onclick="editRecord(<%=rs.getString(1)%>);"></td>
<td><input type="button" name="delete" value="Mark As Deleted" style="background-color:red;font-weight:bold;color:white;" onclick="{return confirmComplete(<%=rs.getString(1)%>);}"></td>
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