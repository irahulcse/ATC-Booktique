<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap.min.css"/>
<style type="text/css">body { background:  white !important; }</style>
</head>
<body>
 
<div class="jumbotron text-center" style="background:pink">
  <h2 ><b>American Tower Corporation</h2>
</div>


<nav class="navbar navbar-inverse">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.jsp">Online Library System</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="index.jsp" class="active">HOME PAGE</a></li>
        <li><a href="#">ADMIN</a></li>
        <li><a href="#">LIBRARIAN</a></li>
       </ul>
   <div>
   
   </div>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
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
  <br><br><br><p><font color="red">The default password for the First Time User is===rahul</font></p>
</form>
  </div>
  
  
  <div class="col-md-6">
  <h3 ><b>ADMIN LOGIN</h3>
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
</form>
</div>
  </div>
</div>

<script src="jquery.min.js"></script>
<script src="bootstrap.min.js"></script>
</body>
</html>
