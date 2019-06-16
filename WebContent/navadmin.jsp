<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap.min.css"/>
<style type="text/css">
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
  border-radius: 20px;
}

.button3 {background-color: #f44336;} /* Red */ 
.button4 {background-color: #800080;} /* Gray */ 
.button5 {background-color: #8000ff;} /* Black */
.button6{padding: 30px 100px;background-color: #8000ff;}
</style>
</head>
<body>
<div class="jumbotron text-center" style="background-color: powderblue;height:150px;margin-bottom:0;">
  <h2 ><strong><img src="ATClogo.PNG" width="100" height="70">&nbsp;&nbsp;AMERICAN TOWER CORPORATION</strong></h2>
</div>
<nav class="navbar navbar-inverse">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header"> 
      <a class="navbar-brand" href="navadmin.jsp"><b>Online Library System</b></a>
    </div>
    <!-- <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
                <li><a href="navadmin.jsp"><b>LOGOUT</b></a></li>
       </ul>
   <div> -->
   
   </div>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<div align="center">
  <div align="center">
  <h3 align="centre"><b>ADMINISTRATIVE TASK</h3>
  <br>
   <form action="LibApplication.jsp">
  <!--  <table class=button>
    <td><button class="button">A</button>
    </td>
</table>
<table class=button>
    <td><button class="button">B</button>
    </td>
</table> -->
   <button class="button" style="width:350px">LIBRARIAN PORTAL</style></button>
	</form>  
	<br>
	<form action="MemApplication.jsp">
   <button class="button button4" style="width:350px">MEMBER PORTAL</button>
	</form> 
	<br>
	<form action="BookApplication.jsp">
   <button class="button button5" style="width:350px">BOOKS PORTAL</button>
	</form> 
	<br>
	<form action="TransApplication.jsp">
 	   <button class="button button3" style="width:360px">TRANSACTION PORTAL</button>
	</form> 
  </div>
</div>
</body>
</html>
