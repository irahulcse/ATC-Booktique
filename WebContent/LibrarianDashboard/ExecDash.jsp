<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="java.sql.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Executive Dashboard</title>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <!-- Bootstrap core CSS -->
  <link href="../css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="../css/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="../css/style.css" rel="stylesheet">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   
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
		<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "lib";
String userId = "root";
String password = "password";
String report=request.getParameter("dt");
System.out.println("HHHHH"+report);
String dpf=request.getParameter("frum");
String dpt=request.getParameter("toi"); 
try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<jsp:include page="../LibrarianDashboard/HeaderPage2.jsp"/> 


  <!--Main layout-->
<main>
  <div class="container-fluid">


     <!--Section: Main panel-->
<section class="card card-cascade narrower mb-5">

  <!--Grid row-->
  <div class="row">

<!--Grid column-->
	<div class="col-md-6">
						<div class="row-md-5">
							<!--Panel Header row 1 management-->
<div
								class="view view-cascade py-3 gradient-card-header info-color-dark">
								<h5 class="mb-0 mr-5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MANAGEMENT OVERVIEW</h5>
							</div>
							<!--/Panel Header-->
							<!--Panel content-->
							<div class="card-body">
	<!--Grid row-->
								<div class="row">

									<%-- <!--Grid column 1-->
									<div class="col-md-4 mb-1">
										<!--no of admins-->
										<form action="../AdminDashboard/AdminPage.jsp">
											<div style="float: left; width: 140px;">
												&nbsp;&nbsp;
												<button id="myBtn" class="button" style="float: left">
													ADMIN
													<!-- SQL -->

													<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName+"?zeroDateTimeBehavior=convertToNull", userId, password);
statement=connection.createStatement();
String sql ="SELECT COUNT(*) FROM admin";
resultSet = statement.executeQuery(sql);
String countrow="";
while(resultSet.next()){
	%>
													<% countrow=resultSet.getString(1);
	out.println(countrow);}
%>
													<% 
}
catch (Exception e) {
e.printStackTrace();
}
%>

												</button>
											</div>
										</form>

										<!-- SQL -->



									</div>
									<!--Grid column 1--> --%>
									<!-- Grid column 2 -->
									<div class="col-md-4 mb-4">
										<!--no of librarians-->

									<form action="../LibrarianDashboard/LibPage.jsp">
											<div style="float: center; width: 140px;">
												&nbsp;&nbsp;
												<button id="myBtn" class="button" data-toggle="tooltip" data-placement="top" title="click to know more" style="float: center">
													LIBRARIAN
													<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql1 ="SELECT COUNT(*) FROM librarian where bdeleted='n'";
resultSet = statement.executeQuery(sql1);
String countrow1="";
while(resultSet.next()){
	%>
													<% countrow1=resultSet.getString(1);
	out.println(countrow1);}
%>
													<% 
}
catch (Exception e) {
e.printStackTrace();
}
%>
												</button>
											</div>
										</form>

									</div>

									<!--Grid column 2 -->
									<!-- Grid column 3 -->
									<div class="col-md-4 mb-4">
										<!--no of members-->
										<form action="../LibrarianMemApplication/MemApplication.jsp">
											<div style="float: right; width: 140px;">
												&nbsp;&nbsp;
												<button id="myBtn" class="button" data-toggle="tooltip" data-placement="top" title="click to know more" style="float: right">
													MEMBERS
													<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql2 ="SELECT COUNT(*) FROM mem where mdeleted='n'";
resultSet = statement.executeQuery(sql2);
String countrow2="";
while(resultSet.next()){
	%>
													<% countrow2=resultSet.getString(1);
	out.println(countrow2);}
%>
													<% 
}
catch (Exception e) {
e.printStackTrace();
}
%>
												</button>
											</div>
										</form>
									</div>
									<!--Grid column 3 -->
								</div>
								<!--Grid row-->
							</div>
						</div>
						<!--Panel content row 2 book management-->

						<div class="row-md-5">
							<!--Panel Header-->
							&nbsp;&nbsp;&nbsp;
							<div
								class="view view-cascade py-3 gradient-card-header info-color-dark">
								<h5 class="mb-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;BOOK MANAGEMENT</h5>
							</div>
							<!--/Panel Header-->
							<!--Panel content-->
							<div class="card-body">

								<!--Grid row-->
								<div class="row">

									<!--Grid column 1-->
									<div class="col-md-4 mb-4">
										<!--no of admins-->
										<form action="../LibrarianBookApplication/BookApplication.jsp">
											<div style="float: left; width: 140px;">
												&nbsp;&nbsp;
												<button id="myBtn" class="button" data-toggle="tooltip" data-placement="top" title="click to know more about Quantity in Hand" style="float: left">
													TOTAL BOOKS
													<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql3 ="SELECT sum(qoh) FROM books where bdeleted='n'";
resultSet = statement.executeQuery(sql3);
String countrow4="";
while(resultSet.next()){
	%>
													<% countrow4=resultSet.getString(1);
	out.println(countrow4);}
%>
													<% 
}
catch (Exception e) {
e.printStackTrace();
}
%>
												</button>
											</div>
										</form>

									</div>
									<!--Grid column 1-->
									<!-- Grid column 2 -->
									<div class="col-md-4 mb-4">
										<!--no of librarians-->
										<form action="../LibrarianTransApplication/TransApplication.jsp">
											<div style="float: center; width: 140px;">
												&nbsp;&nbsp;
												<button id="myBtn" class="button" data-toggle="tooltip" data-placement="top" title="click to know more" style="float: center">
													ISSUED BOOKS<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT COUNT(*) FROM trans where tdeleted='n'";
resultSet = statement.executeQuery(sql);
String countrow="";
while(resultSet.next()){
	%>
													<% countrow=resultSet.getString(1);
	out.println(countrow);}
%>
													<% 
}
catch (Exception e) {
e.printStackTrace();
}
%>
												</button>
											</div>
										</form>

									</div>

									<!--Grid column 2 -->
									<!-- Grid column 3 -->
									<div class="col-md-4 mb-4">
										<!--no of members-->
										<form action="../LibrarianMemApplication/MemApplication.jsp">
											<%-- <div style="float: right; width:140px;">
&nbsp;&nbsp;<button id="myBtn" class="button" style="float:right">BOOKS OVERDUE<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT sum(mPending) FROM mem where mdeleted='n'";
resultSet = statement.executeQuery(sql);
String countrow="";
while(resultSet.next()){
	%>
	<% countrow=resultSet.getString(1);
	out.println(countrow);}
%>
<% 
}
catch (Exception e) {
e.printStackTrace();
}
%>
</button>
</div> --%>
										</form>

									</div>
								</div>
								<!--Grid column 3 -->
							</div>
							<!--Grid row-->

						</div>
						<!--Panel content row 3 daily tracking-->

						<div class="row-md-5">
							<!--Panel Header-->
							&nbsp;&nbsp;&nbsp;
							<div
								class="view view-cascade py-3 gradient-card-header info-color-dark">
								<h5 class=" mb-0 ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DAILY TRACKING TRANSACTION
									RECORDS</h5>
							</div>
							<!--/Panel Header-->
							<!--Panel content-->
							<div class="card-body">

								<!--Grid row1-->
								<div class="row">

									<!--Grid column 1-->
									<div class="col-md-4 mb-4">
										<!--Date select-->
										<form method="post">
											<p class="lead my-4">
												<span class="badge info-color-dark p-2">Custom date</span>
											</p>
											<div class="md-form">
												<input placeholder="FROM (YYYY-MM-DD)" type="text"
													name="frum" id="datepicker1" autocomplete="off">
											</div>
											<div class="md-form">
												<input placeholder="TO (YYYY-MM-DD)" type="text" name="toi"
													id="datepicker2" autocomplete="off">
											</div>
											<input type="submit" value="Transaction Records">
										</form>


										<!--  <p> <form method="post">
                   
      <select name="dt" class="mdb-select colorful-select dropdown-info">
  <option value="" disabled>Choose time period</option>
  <option value="0">Today</option>
  <option value="1">Yesterday</option>
  <option value="7">Last 7 days</option>
  <option value="30">Last 30 days</option>
</select>
<input type="submit" value="Transaction Records">
</form></p> -->
									</div>
									<div class="col-md-4">
										<div style="float: left; width: 280px">
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
						<!-- CHANGE THIS -->			<form name="TrainerMenu" action="/HelloJSP/LibrarianDashboard/ExportDaily1.jsp"
									method="post" >
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<button id="myBtn" class="btn" style="float: left"
													onclick="openPage('ExportDaily1.jsp')">DOWNLOAD
													REPORT</button>
											</form>
										</div>
									</div>
									<!--Grid column 1-->
									<!-- Grid column 2 -->
									<div class="col-md-4 mb-4">
										<!--no of librarians-->

									</div>
									<!--Grid column 2 -->
									<!-- Grid column 3 -->
								</div>
								<!--Grid column 3 -->
							</div>
							<!--Grid row1-->
							<!--Grid row2-->
							<div class="row-md-4">

								<section class="mb-5">
									<div
										class="table-responsive text-nowrap table-wrapper-scroll-y my-custom-scrollbar">
										<table id="dtDynamicVerticalScrollExample" width="100%"
											class="table table-striped table-bordered table-hover table-condensed">
											<tr>

											</tr>

											<tr bgcolor="">
												<td><b>TransId</b></td>
												<td><b>BookName</b></td>
												<td><b>MemberName</b></td>
												<td><b>Issue Date</b></td>
												<td><b>Return Date</b></td>
											</tr>

											<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName+"?zeroDateTimeBehavior=convertToNull", userId, password);
statement=connection.createStatement();
/* String sql="select * from transactions where date_sub(current_date(),interval '"+selDate+"' day)<=date_format(transactiondate, '%Y-%m-%d') and date_format(transactiondate, '%Y-%m-%d')<=current_date() order by transno asc"; */
/* String sql="select * from transactions where date_format(transactiondate, '%Y-%m-%d') between '"+dpf+"' and '"+dpt+"' order by transno asc"; */
String sql="select * from transactions where transactiondate>='"+dpf+"' and transactiondate<='"+dpt+"' order by transno asc";
System.out.println(sql);
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>


											<tr>
												<td><%=resultSet.getInt("transno") %></td>
												<td><%=resultSet.getString("bookname") %></td>
												<td><%=resultSet.getString("mname") %></td>
												<td><%=resultSet.getDate("transactiondate") %></td>
												
												
												<%
												if(resultSet.getDate("ReturnDate") == null){
												%>
												<td>Not returned</td>
												<% } %>
												<%  if(resultSet.getDate("ReturnDate") != null) { %>
												<td><%=resultSet.getDate("ReturnDate") %></td>
												<%} %>
											 
											</tr>




											<% 
}
} catch (Exception e) {
e.printStackTrace();
}
%>
										</table>
									</div>
							</div>
							<!--Grid row2 ends-->

						</div>
						<!--Panel content-->

					</div>

					<!--Grid column 1 of main panel over-->

					<!--Grid column 2 of main panel -->

					<div class="col-md-6">

						<!--row 1-->
						<div class="row-md-7">
							<!--TODAY'S DUE PANEL HEADER-->
							<div
								class="view view-cascade py-3 gradient-card-header info-color-dark mb-4">
								<h5 class="mb-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									BOOKS DUE</h5>
							</div>
							<jsp:include page="BooksDue1.jsp" />
							<br>
							<!--/Card image-->
							<!--row 1 over-->
						</div>
						<!--row 2-->
						<div class="row-md-7">
							<!--charts-->
							
							<div
								class="view view-cascade py-3 gradient-card-header info-color-dark mb-4">
								<h5 class="mb-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									CHARTS</h5>
							</div>
							<p>
 <form method="post">           
  <select name="dt" class="mdb-select colorful-select dropdown-info">
	  <option value="0" >Choose the Report you want to see</option>
	  <option value="1">Books available VS issued by Genre</option>
	  <option value="2">No of Books Issued past 12 months</option>
	  <option value="3">Books by popularity past 12 months</option>
  </select>
<input type="submit" value="Transaction Records">
</form>
</p> 
<c:if test = "${param.dt == 0}">
   <c:out value="No Report Selected"/> 
   
 </c:if>	
<c:if test = "${param.dt == 1}">
  <%--  <c:out value="this is report 0"/> --%>
   <jsp:include page="../Charts/charttrial.html" />
    <%-- <jsp:include page="charttrial2.html" /> --%>
 </c:if>
 <c:if test = "${param.dt == 2}">
   <jsp:include page="../Charts/ColChart.html" />
</c:if>
<c:if test = "${param.dt == 3}">
   <jsp:include page="../Charts/ColChart2.html" />
</c:if>
							
							<br>
							<!--/Card image-->
							<!--row 1 over-->
						</div>

					</div>
					<!--Grid column 2 of main panel over-->

				</div>
				<!--Grid row of main panel over-->
			</section>
			<!--Section: Main panel-->
		</div>
		</main>
		<!--Main layout-->
		<!-- Start your project here-->

		<!-- SCRIPTS -->
		<!-- JQuery -->
		<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
		<!-- Bootstrap tooltips -->
		<script type="text/javascript" src="../js/popper.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script type="text/javascript" src="../js/bootstrap.min.js"></script>
		<!-- MDB core JavaScript -->
		<script type="text/javascript" src="../js/mdb.min.js"></script>
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script>
		$(function(){
			$('[data-toggle="tooltip"]').tooltip()
		})
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
      
     /*  function next(){
          //Location where you want to forward your values
          window.location.href = "http://localhost:8563/And/try1.jsp?dymanicValue=" + dpf; 
          } */
    </script>
		
</body>

</html>