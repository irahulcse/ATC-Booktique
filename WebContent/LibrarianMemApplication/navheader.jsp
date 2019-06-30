<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
<div class="amt-logo-container"><a href="http://www.atctower.in/en/index.htm" title="Home">
<img alt="atc-india-logo" class="amt-logo" height="81" src="../atc_india_logo.png" width="185" />
</a>
</div>
</div>
</div>
<nav class="navbar navbar-inverse">
  <div class="container" >
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header"> 
      <a class="navbar-brand" href="../navlibrarian.jsp"><b>Online Library System</b></a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
                <li><a href="../Logout"><b>LOGOUT</b></a></li>
       </ul>
       <div>
       
       </div>
    </div>
    </div>
</nav>
</div>
<script src="../jquery.min.js"></script>
<script src="../bootstrap.min.js"></script>
</body>
</html>