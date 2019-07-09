
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
  $(function () {
      var $dp1 = $("#datepicker1"); 
      $dp1.datepicker({
        changeYear: true,
        changeMonth: true,
          minDate:0,
        dateFormat: "yy-m-dd",
        yearRange: "-100:+20",
      });           
            
      var $dp2 = $("#datepicker2");  
      $dp2.datepicker({
        changeYear: true,
        changeMonth: true,
        yearRange: "-100:+20",
        dateFormat: "yy-m-dd",
      });                   
    });
  </script>
  <script>
function myFunction() {
  window.print();
}

</script>


<!-- The below line of code are used to stop the user from going to the previous page back -->
<script type="text/javascript" >
   function preventBack(){window.history.forward();}
    setTimeout("preventBack()", 0);
    window.onunload=function(){null};
</script>  
</head>
<body>

<!-- <font color="WHITE"><marquee direction="left" scrollamount="10" style="background:RED">After issuing, pls don't redirect back and confirm the issue message. Otherwise it will again issue the same book to same author. </marquee></font> -->
<form class="form-inline" method="get" action="IssuedBook.jsp" onsubmit="return confirm('Do you really want to issue the book?');">
<div style="width:100%">
<div style="float:right;width:110%">
<h3 align="center"><strong>BOOK ISSUE PANEL</strong></h3>
</div>
<br>
<!-- <form method="post" name="form"> -->
<div class='container'>
<table class='table table-bordered table-striped' border="1">
<tr><th>MEM NO</th><th>MEM NAME<th>EMAIL ADDRESS</th><th>Book Already Issued By Member</th></tr>
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
String query = "select * from mem where mdeleted='n' and (mname  like '"+bookno+"%' OR memid  like '"+bookno+"%' OR mcontact like '"+bookno+"%' OR memail like '"+bookno+"%' ) LIMIT 1";
st = con.createStatement();
ResultSet rs = st.executeQuery(query);
%>
<%
while(rs.next()){
%>
<tr>
<td>
<div id="form-wrapper" style="max-width:350px;margin:auto;">
   <input type="text" class="form-control" name="memid" value="<%=rs.getString(2)%>" readonly/>
</div>
</td>
<td>
<div id="form-wrapper" style="max-width:350px;margin:auto;">
    <input type="text" class="form-control" name="mname" value="<%=rs.getString(3)%>" readonly/>
</div>
</td>
<td>
<div id="form-wrapper" style="max-width:350px;margin:auto;">
    <input type="text" class="form-control" name="mcount" value="<%=rs.getString(6)%>" readonly/>
</div>
</td>
<td>
<div id="form-wrapper" style="max-width:350px;margin:auto;">
    <input type="text" class="form-control" name="mcount" value="<%=rs.getString(15)%>" readonly/>
</div>
</td>
<td><button type="submit" class="btn btn-primary">ISSUE ME!</button></td>
<%-- <td name="memid"><%=rs.getString(2)%></td>
<td name="mname"><%=rs.getString(3)%></td>
<td name="mcount"><%=rs.getInt(13)%> --%>
<%-- <%if(rs.getInt(13)<=1){ %> --%>
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
<!-- </form> -->

<div style="float:right;width:100%" class="container">
<div style="float:right;width:110%">
<h3 align="center"><strong>BOOK DETAILS PANEL</strong></h3>
</div>
<!-- <form method="post" name="form"> -->
<%
String id=request.getParameter("id");
int no=Integer.parseInt(id);
int sumcount=0;
try {
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lib", "rahul", "pass");
String query = "select * from books where id='"+no+"'";
Statement st1 = conn.createStatement();
ResultSet rs = st1.executeQuery(query);
while(rs.next()){
%>
<div id="form-wrapper" style="max-width:587px;margin:auto;">
	<label for="name1">BOOK RETURN DATE:&nbsp;&nbsp;&nbsp;</label>
	<input type="text" class="form-control" name="expreturndate" id="datepicker1" required>
</div>
<button type="hidden" id="qq" value="Login" style="display: none;"></button>
 <script type="text/javascript">
     document.getElementById("qq").click();
  </script>
<br>
 <div id="form-wrapper" style="max-width:400px;margin:auto;">
    <label for="name1" >BOOK ID:</label>
    <input type="text" class="form-control" name="bookno1" id="name1" value="<%=rs.getString(2)%>" readonly/>
</div>
<br>
<div id="form-wrapper" style="max-width:460px;margin:auto;">
    <label for="name1">BOOK NAME:</label>
    <input type="text" class="form-control" name="bookname" id="name1" value="<%=rs.getString(3)%>" readonly/>
</div>
<br>

<div id="form-wrapper" style="max-width:400px;margin:auto;">
    <label for="name1">AUTHOR:</label>
    <input type="text" class="form-control" name="author" id="name1" value="<%=rs.getString(4)%>" readonly/>
</div>
<br>
<div id="form-wrapper" style="max-width:350px;margin:auto;">
    <label for="name1">QOH:</label>
    <input type="text" class="form-control" name="qoh" id="name1" value="<%=rs.getString(10)%>" readonly/>
</div>
<br>

<%
}
}
catch(Exception e){
System.out.println(e);
}
%>
<!-- </form> -->
</div>
</div>
</form>
</body>
</html>