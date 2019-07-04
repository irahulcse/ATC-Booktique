

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ATC Library</title>
<link rel="stylesheet" href="bootstrap.min.css"/>
<jsp:include page="navheader.jsp" />
<style type="text/css">
body { background:  white !important; }
.button {
  background-color: #008CBA; /* Green */
  border: none;
  color: white;
  padding: 23px 85px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 30px;
}
</style>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  function deleteRecord(id){
	    var f=document.form;
	    f.method="post";
	    f.action='AddLibrarian.jsp?id='+id;
	    f.submit();
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

<form class="form-inline" method="post" action="IssueBook.jsp" >
<div style="float:right;width:40%" style="width:300px">
<br>
<br>
<input type="text" name="bookno" class="form-control" placeholder="Search Employee By Details">
 <button type="submit" name="save" class="btn btn-primary">Search Employee</button>
<!-- </form> -->
</div>


<div style="float:right;width:40%" style="width:300px">
<div class="row-md-3">
  <div class="col-md-6">
<h3 align="left"><strong>Issuing Book</strong></h3>
<!-- <form action="IssueBook.jsp" method="post" name="form"> -->
<%
String id=request.getParameter("id");
int no=Integer.parseInt(id);
int sumcount=0;
try {
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lib", "rahul", "pass");
String query = "select * from books where id='"+no+"'";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>
 <div id="form-wrapper" style="max-width:350px;margin:auto;">
    <label for="name1" >BOOK ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="text" class="form-control" name="bookno" value="<%=rs.getString(2)%>" disabled/>
</div>
<br>
<div id="form-wrapper" style="max-width:400px;margin:auto;">
    <label for="name1">BOOK NAME:</label><input type="text" class="form-control" name="bookname" value="<%=rs.getString(3)%>" disabled/>
</div>
<br>
<div id="form-wrapper" style="max-width:350px;margin:auto;">
    <label for="name1">AUTHOR:&nbsp;&nbsp;</label>
    <input type="text" class="form-control" name="author" value="<%=rs.getString(4)%>" disabled/>
</div>
<br>
<div id="form-wrapper" style="max-width:450px;margin:auto;">
    <label for="name1">QOH:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
    <input type="text" class="form-control" name="qoh" value="<%=rs.getString(10)%>" disabled/>
</div>
<br>
<!--  <div id="form-wrapper" style="max-width:350px;margin:auto;">
	<label for="name1">Return Date Of Book</label>
	<input type="text" class="form-control" name="duedate" id="datepicker" required>
</div> --> 
<input type="hidden" name="id" value="<%=rs.getString(1)%>" />
<button type="hidden" id="qq" value="Login" style="display: none;"></button>
<br>
<%
}
}
catch(Exception e){
System.out.println(e);
}
%>
</div>
</div>
</div>
</form>
<!-- <script type="text/javascript">
     document.getElementById("qq").click();
  </script> -->
</div>
</body>
</html>