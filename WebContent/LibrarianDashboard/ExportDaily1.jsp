<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.PrintWriter"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="java.sql.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Admin Dashboard</title>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <!-- Bootstrap core CSS -->
  <link href="../css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="../css/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="../css/style.css" rel="stylesheet">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script>
function greeting(){
	alert("Your file will be downloaded in csv folder.");
}
</script> 
  <style type="text/css">
.button {
  background-color: DodgerBlue;
  border: 0.5;
  color: white;
  padding: 12px 30px;
  cursor: pointer;
  font-size: 20px;
   }
   
   .my-custom-scrollbar {
position: center;
height: 200px;
overflow: auto;
}
.table-wrapper-scroll-y {
display: block;
}
</style>
 
<style type="text/css">body { background:  white !important; }
.amt-head-stripe {
    background: #fff;
    height: 100px;
    left: 0;
    position: absolute;
    top: 0;
    width: 100%;
}
.amt-logo-container {
    text-align: center;
    -moz-box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
	-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
	background: #fff;
	width: 200px;
	height: 90px;
}
.amt-main-nav {
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    padding-left: 90px;
    top: 75px;
    width: 100%;
    }
   .perc-region {
    min-height: 0px !important;
}
</style>
  
</head>

<body>
	<div class="perc-region">
		<div class="rxbodyfield">
			<div class="amt-main-nav amt-nav">
				<div class="amt-logo-container">
					<a href="http://www.atctower.in/en/index.htm" title="Home"> <img
						alt="atc-india-logo" class="amt-logo" height="81"
						src="../atc_india_logo.png" width="185" />
					</a>
				</div>
			</div>
		</div>

 <!--Date select-->
		<form method="post" onsubmit="greeting()">
			<p class="lead my-4">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="badge info-color-dark p-2">Custom date</span>
			</p>
			<div class="md-form">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input placeholder="FROM (YYYY-MM-DD)" type="text" name="frum"
					id="datepicker1" autocomplete="off">
			</div>
			<div class="md-form">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input placeholder="TO (YYYY-MM-DD)" type="text" name="toi"
					id="datepicker2" autocomplete="off">
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Download Reports">
		</form>
		<h6><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;In order to download this report, kindly create a <b><i>csv</i></b> folder in your C directory</h6>
<table>		
<%
String filename = "c:\\csv\\Lib_daily_transaction.csv";
String id = request.getParameter("userId");
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/";
String dbName = "lib";
String userName = "root";
String password = "password";
String dpf=request.getParameter("frum");
String dpt=request.getParameter("toi"); 
Statement stmt;
Connection conn = null;
try
{
FileWriter fw = new FileWriter(filename);
fw.append("Transaction Id");
fw.append(',');
fw.append("Book Name");
fw.append(',');
fw.append("Member Name");
fw.append(',');
fw.append("Issue Date");
fw.append(',');
fw.append("Return Date");
fw.append('\n');
Class.forName(driver);
conn = DriverManager.getConnection(url+dbName+"?zeroDateTimeBehavior=convertToNull",userName,password);
String query = "select * from transactions where transactiondate>='"+dpf+"' and transactiondate<='"+dpt+"' order by transno asc";
System.out.println(query);
stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(query);
while(rs.next())
{
fw.append(rs.getString(1));
fw.append(',');
fw.append(rs.getString(10));
fw.append(',');
fw.append(rs.getString(8));
fw.append(',');
fw.append(rs.getString(2));
fw.append(',');
fw.append(rs.getString(5));
fw.append('\n');
}
fw.flush();
fw.close();
conn.close();
response.sendRedirect("../LibrarianDashboard/ExecDash.jsp");
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

        
<script type="text/javascript" src="../js/mdb.min.js"></script>
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
  $(document).ready(function () {
	  $('.mdb-select').material_select();
	  });
</script>
</body>

</html>