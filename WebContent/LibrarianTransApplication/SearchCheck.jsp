<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">body { background:  white !important; }

.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  position: relative;
  background-color: #fefefe;
  margin: auto;
  padding: 0;
  border: 1px solid #888;
  width: 100%;
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
  -webkit-animation-name: animatetop;
  -webkit-animation-duration: 0.4s;
  animation-name: animatetop;
  animation-duration: 0.4s
}

/* Add Animation */
@-webkit-keyframes animatetop {
  from {top:-300px; opacity:0} 
  to {top:0; opacity:1}
}

@keyframes animatetop {
  from {top:-300px; opacity:0}
  to {top:0; opacity:1}
}

/* The Close Button */
.close {
  color: white;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

.modal-header {
  padding: 2px 16px;
  background-color: #5cb85c;
  color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
  padding: 2px 16px;
  background-color: #5cb85c;
  color: white;
}
.dropbtn {
  background-color: #3498DB;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

/* Dropdown button on hover & focus */
.dropbtn:hover, .dropbtn:focus {
  background-color: #2980B9;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative;
  display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #ddd}

/* Show the dropdown menu (use JS to add this class to the .dropdown-content container when the user clicks on the dropdown button) */
.show {display:block;}
</style>
<script>
function deleteRecord2(id){
    var f=document.form;
    f.method="post";
    f.action='AddLibrarian.jsp?id1='+id;
    f.submit();
}
function deleteRecord(id){
    var f=document.form;
    f.method="post";
    f.action='AddLibrarian.jsp?id='+id;
    f.submit();
}
function myFunction() {
  window.print();
}
</script>

</head>
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
<jsp:include page="navheader.jsp" />
<br>
<div class="container" align="center">
<form class="form-inline" method="post" action="SearchCheck.jsp">
<input type="text" name="bookno" class="form-control" placeholder="Search By Book Details">
 <button type="submit" name="save" class="btn btn-primary">Search Book To Issue</button>
<!-- <button type="submit" name="save" id="myBtn" class="btn btn-primary">ADD BOOKS</button> -->
</form>
</div>
<br>
<form method="post" name="form">
<div class='container'>
<table class='table table-bordered table-striped' border="1">
<tr><th>BOOK NO</th><th>BOOK NAME</th><th >AUTHOR</th><th >PUBLISHER</th><th>PUBLICATION YEAR</th><th>LANGUAGE</th><th>GENRE</th><!-- <th>ISBN NO</th> --><th>QUANTITY ON HAND</th><th>ISSUED QUANTITY</th></tr>
<%
Connection con = null;
String url = "jdbc:mysql://localhost:3306/";
String db = "lib";
String driver = "com.mysql.jdbc.Driver";
String userName ="rahul";
String password="pass";
String bookno=request.getParameter("bookno");
Statement st;
try{
Class.forName(driver);
con = DriverManager.getConnection(url+db,userName,password);
String query = "select * from books where bdeleted='n' and (bookno like '%"+bookno+"%' OR bookname like '%"+bookno+"%' OR author like '%"+bookno+"%' OR publisher like '%"+bookno+"%' OR language like '%"+bookno+"%' OR bcategoryid like '%"+bookno+"%' OR isbn_no like '%"+bookno+"%' OR publication_year like '%"+bookno+"%') and qoh>0";
st = con.createStatement();
ResultSet rs = st.executeQuery(query);
%>
<%
while(rs.next()){
%>
<tr><td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></a></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
<td><%=rs.getString(7)%></td>
<td><%=rs.getString(8)%></td>
<%-- <td><%=rs.getString(9)%></td> --%>  <!-- //not showing the isbno because null is yes in it -->
<td><%=rs.getString(10)%></td>
<td><%=rs.getString(11)%></td>
<td><input type="button" name="delete" value="Issue Book" style="background-color:red;font-weight:bold;color:white;" onclick="deleteRecord(<%=rs.getString(1)%>);"></td>

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