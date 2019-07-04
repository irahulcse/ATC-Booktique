<%@ page import="java.sql.*" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css">
.button {
  background-color: #008CBA; /* Green */
  border: none;
  color: white;
  padding: 5px 8px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 20px;
  margin-left: 900px;
}
.btn {
  background-color: DodgerBlue;
  border: none;
  color: white;
  padding: 12px 30px;
  cursor: pointer;
  font-size: 20px;
}

.button3 {background-color: #f44336;} /* Red */ 
.button4 {background-color: #800080;} /* Gray */ 
.button5 {background-color: #8000ff;} /* Black */
.button6{padding: 30px 100px;background-color: #8000ff;}
</style>
<script>
function editRecord(id){
    var f=document.form;
    f.method="post";
    f.action='BookEdit.jsp?id='+id;
    f.submit();
}
function deleteRecord(id){
    var f=document.form;
    f.method="post";
    f.action='BookDelete.jsp?id='+id;
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
<br>
<div style="width:300px">
<div style="float: right; width:140px;">
&nbsp;&nbsp;<button id="myBtn" class="btn" style="float:right">ADD BOOKS</button>
</div>
<div style="float: right; width: 160px">
<form name="TrainerMenu" action="/HelloJSP/export/exportBook.jsp" method="post" onsubmit="greeting()">
<button id="myBtn" class="btn"  style="float:right" onclick="openPage('exportBook.jsp')">&nbsp;&nbsp;DOWNLOAD AS CSV</button>
</form>
</div>
</div>
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2 align="center"><strong>BOOK PANEL</strong></h2>
    </div>
<div class="modal-body">
 <div class="container">
<div class="row">
<div class="col-sm-8">
<form action="AddBookCheck.jsp" method="post" style="width:300px">
<div class="form-group">
<label for="name1">BOOK ID</label>
<%
int count=0;
try {
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lib", "rahul", "pass");
String query = "select * from books ORDER BY id DESC LIMIT 1";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
	count=rs.getInt(1);
%>
<input type="text" class="form-control" name="bookno" id="name1" placeholder="Employee Id" readonly value=<%="BK"%><%=count+1%> >
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
    <label for="name1">Book Name&nbsp;<font color="red">*</font></label>
    <input type="text" class="form-control" name="bookname" id="name1" style="text-transform: capitalize;" placeholder="Book Name" required/>
</div>
<div class="form-group">
    <label for="name1">Author&nbsp;<font color="red">*</font></label>
    <input type="text" class="form-control" name="author" id="name1" style="text-transform: capitalize;" placeholder="Author Name" required/>
</div>
<div class="form-group">
    <label for="name1">Publishers&nbsp;<font color="red">*</font></label>
    <input type="text" class="form-control" name="publisher" id="name1" style="text-transform: capitalize;" placeholder="Publisher Name"  required/>
</div>
<div class="form-group">
    <label for="name1">Publication Year&nbsp;<font color="red">*</font></label>
    <input type="number" class="form-control" name="publication_year" id="name1" placeholder="Publication Year" pattern="[1-3]{1}[0-9]{3}" 
       title="Publication Year's  First Digit should be  1-3 and Last Three should be from 1 to 9" required/>
</div>
<div class="form-group">
    <label for="name1">Language&nbsp;<font color="red">*</font></label>
    <select  name="language" required>
	  <option value="">Select Language Type</option>
	  <option value="Hindi">Hindi</option>
	  <option value="English">English</option>
	   <option value="German">German</option>
	  <option value="French">French</option>
	</select>
</div>
<div class="form-group">
    <label for="name1">Genre&nbsp;<font color="red">*</font></label>
    <!-- <input type="text" class="form-control" name="memtyp" id="name1" placeholder="Employee Type" required/> -->
	<select  name="bcategoryid" required>
	  <option value="">Genre Of Book</option>
	  <option value="Religious">Religious and Spiritual</option>
	  <option value="Science">Science </option>
	  <option value="Coding ">Coding </option>
	  <option value="Health">Health</option>
	  <option value="Science/Fiction ">Science/Fiction </option>
	  <option value="Journal">Journal</option>
	  <option value="Motivational">Motivational</option>
	  <option value="Math ">Math</option>
	</select>
</div>
<div class="form-group">
    <label for="name1">Quantity On Hand&nbsp;<font color="red">*</font></label>
    <input type="number" class="form-control" name="qoh" id="name1" placeholder="Quantity On Hand"  min="1" required/>
</div>
<div class="form-group">
    <label for="name1">Book Price&nbsp;<font color="red">*</font></label>
    <input type="number" class="form-control" name="bookprice" id="name1" placeholder="Price Of Book In INR Only"  min="1" required/>
</div>	
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
<form method="post" name="form"  class="form-inline">
<div class='container'>
<h2 align="center"><strong>BOOK SECTION</strong></h2>
<table class='table table-bordered table-striped' border="1" style="margin-left:auto;margin-right:auto;">
<tr><th>BOOK NO</th><th>BOOK NAME</th><th >AUTHOR</th><th >PUBLISHER</th><th>PUBLICATION YEAR</th><th>LANGUAGE</th><th>GENRE</th><th>QUANTITY ON HAND</th><th>ISSUED QUANTITY</th></tr>
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
String query = "select * from books where bdeleted='n'";
st = con.createStatement();
ResultSet rs = st.executeQuery(query);
%>
<%
while(rs.next()){
%>
<tr><td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
<td><%=rs.getString(7)%></td>
<td><%=rs.getString(8)%></td>
<td><%=rs.getString(10)%></td>
<td><%=rs.getString(11)%></td>
<script>
function confirmComplete(id) {
	var answer=confirm("Are you sure you want to delete the book permanently?");
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
<td><input type="button" name="edit" value="Edit" style="background-color:green;font-weight:bold;color:white;"onclick="editRecord(<%=rs.getString(1)%>);"></td>
<td><input type="button" name="delete" value="Mark As Deleted" style="background-color:red;font-weight:bold;color:white;"onclick="{return confirmComplete(<%=rs.getString(1)%>);}" ></td>
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
</div>
</table>
</form>
  
<script src="jquery.min.js"></script>
<script src="bootstrap.min.js"></script>
</body>
</html>