<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap.min.css"/>
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
.buttonnew {
 background-color: #008CBA; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 20px;
  margin-left: 900px;
}


.button3 {background-color: #f44336;} /* Red */ 
.button4 {background-color: #800080;} /* Gray */ 
.button5 {background-color: #8000ff;} /* Black */
.button6{padding: 30px 100px;background-color: #8000ff;}
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
  width: 35%;
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

</head>
<body>
<div class="jumbotron text-center" style="background-color: powderblue;height:150px;margin-bottom:0;">
  <h2 ><b>American Tower Corporation</b></h2>
</div>
<nav class="navbar navbar-inverse">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header"> 
      <a class="navbar-brand" href="index.jsp"><b>Online Library System</b></a>
    </div>
</nav>


<div class="row-md-3">
  <div class="col-md-6">
  <h3><b>LIBRARIAN LOGIN</h3>
   <form action="LibrarianPassCheck.jsp" method="post" style="width:300px">
  <div class="form-group">
    <label for="email1">Employee Id</label>
    <input type="text" class="form-control" name="eid1"  placeholder="Employee Id"/>
  </div>
  <div class="form-group">
    <label for="password1">Password</label>
    <input type="password" class="form-control" name="password1" placeholder="Librarien's Password"/>
  </div>  
  <div class="form-group">
  </div>
  <button type="submit" class="btn btn-primary">Login</button>
  <button id="myBtn" class="btn btn-primary">Forget Password!</button>
  <br><br><br><p><font color="red">The default password for the First Time User is===rahul</font></p>
  <div style="float: right; width:140px;">
</div>
</form>
  </div>
  
  
  <div class="col-md-6">
  <h3 ><b>ADMIN LOGIN</b></h3>
  <form action="AdminPassCheck.jsp" method="post" style="width:300px">
  <div class="form-group">
    <label for="email1">Employee Name</label>
    <input type="text" class="form-control" name="uid1"  placeholder="Employee Name"/>
  </div>
  <div class="form-group">
    <label for="password1">Password</label>
    <input type="password" class="form-control" name="password1" placeholder="Password"/>
  </div>  
  <button type="submit" class="btn btn-primary">Login</button>
  <button id="myBtn" class="btn btn-primary">Forget Password!</button>
</form>
</div>
  </div>





<jsp:include page="navfooter.jsp" />
<script src="jquery.min.js"></script>
<script src="bootstrap.min.js"></script>
</body>
</html>
