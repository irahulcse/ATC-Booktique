<%@ page import="java.sql.*" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css">body { background:  white !important; }
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
<jsp:include page="navheader.jsp" />
<div style="width:300px">
<div style="float: right; width: 140px">
<button id="myBtn" class="btn" style="float:right">ADD BOOKS</button>
</div>
<div style="float: right; width: 160px">
<form name="TrainerMenu" action="exportBook.jsp" method="post" onsubmit="greeting()">
<button id="myBtn" class="btn"  style="float:right" onclick="openPage('exportBook.jsp')" >DOWNLOAD AS CSV</button>
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
<form action="AddBookCheck.jsp" method="post" style="width:300px" >
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
<input type="text" class="form-control" name="bookno" id="name1" placeholder="Employee Id" readonly value=<%="MYBOOK"%><%=count+1%> >
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
    <label for="name1">BOOK NAME</label>
    <input type="text" class="form-control" name="bookname" id="name1" placeholder="Book Name" required/>
</div>
<div class="form-group">
    <label for="name1">Author</label>
    <input type="text" class="form-control" name="author" id="name1" placeholder="Author Name" required/>
</div>
<div class="form-group">
    <label for="name1">Publishers</label>
    <input type="text" class="form-control" name="publisher" id="name1" placeholder="Publisher Name"  required/>
</div>
<div class="form-group">
    <label for="name1">Publication_Year</label>
    <input type="text" class="form-control" name="publication_year" id="name1" placeholder="Publication Year" onkeypress="return isNumber(event)" required/>
</div>
<div class="form-group">
    <label for="name1">Language</label>
    <select  name="language" required>
	  <option value="">Select Language Type</option>
	  <option value="Hindi">Hindi</option>
	  <option value="English">English</option>
	  <option value="German">German</option>
	</select>
</div>
<div class="form-group">
    <label for="name1">Genre</label>
    <!-- <input type="text" class="form-control" name="memtyp" id="name1" placeholder="Employee Type" required/> -->
	<select  name="bcategoryid" required>
	  <option value="">Genre Of Book</option>
	  <option value="Religion ">Religion, Spirituality And New Age </option>
	  <option value="Science">Science </option>
	  <option value="Truecrime ">True crime </option>
	  <option value="Health">Health</option>
	  <option value="Truecrime ">True crime </option>
	  <option value="Journal">Journal</option>
	  <option value="Selfhelp">Self help</option>
	  <option value="Math ">Math </option>
	</select>
</div>
<div class="form-group">
    <label for="name1">ISBN NUMBER</label>
    <input type="text" class="form-control" name="isbn_no" id="name1" placeholder="ISBN_NUMBER" required/>
</div>
<div class="form-group">
    <label for="name1">Quantity On Hand</label>
    <input type="text" class="form-control" name="qoh" id="name1" placeholder="Quantity On Hand" required/>
</div>
<div class="form-group">
    <label for="name1">Book Price</label>
    <input type="text" class="form-control" name="bookprice" id="name1" placeholder="Price Of Book In INR Only" required/>
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
<br>
<br>
<form method="post" name="form" style="width:300px">
<div class='container'>
<table class='table table-bordered table-striped' border="1">
<tr><th>BOOK NO</th><th>BOOK NAME</th><th >AUTHOR</th><th >PUBLISHER</th><th>PUBLICATION YEAR</th><th>LANGUAGE</th><th>GENRE</th><th>ISBN NO</th><th>QUANTITY ON HAND</th><th>ISSUED QUANTITY</th></tr>
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
<td><%=rs.getString(9)%></td>
<td><%=rs.getString(10)%></td>
<td><%=rs.getString(11)%></td>
<script>
function confirmComplete() {
	var answer=confirm("Are you sure you want to delete the member?");
	if (answer==true)
	  {
		deleteRecord(<%=rs.getString(1)%>);
	  }
	else
	  {
	    return false;
	  }
}
</script>
<td><input type="button" name="edit" value="Edit" style="background-color:green;font-weight:bold;color:white;" onclick="editRecord(<%=rs.getString(1)%>);"></td>
<td><input type="button" name="delete" value="Mark As Deleted" style="background-color:red;font-weight:bold;color:white;"onclick="{return confirmComplete();}" ></td>
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