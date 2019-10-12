<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Notification Bar</title>
<link rel="stylesheet" type="text/css" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<style type="text/css">
 .container{
 padding: 20px;
 margin-bottom:20px;
 margin-top: -20px;}
 .notificationbar{
 list-style:none;
 padding: 2px;
 margin: 2px;
 position:relative;}
 .notificationbar li{ margin-top:5px;}
  .notificationbar li div{
  margin-left: 10px
  margin-top: -40px;
  border: 5px solid black;
  padding: 10px;
  background-color: white;
  }
 .notificationbar li i {
 width: 30px
 height:30px
 display:block;
 text-allign:center;
 line-height:30px;
 border: 1px solid #ddd;
 border-radius:50%;
 background-color: white;}
</style>
</head>
<body>
 <div class="container">
 <ul class= "notificationbar">
 <li><i class="ion-person-add"></i>
 <div>Members Added</div>
 </li>
 <li><i class="ion-backspace"></i>
  <div>Members Deleted</div></li>
 <li><i class="ion-ios-book"></i>
  <div>Books Added</div></li>
 <li><i class="ion-backspace"></i>
  <div>Books Deleted</div></li>
 </ul>
 </div>
</body>
</html></form>




<jsp:forward page="HelloJSP/WebContent/export/ExportDaily.jsp"> 
<jsp:param name="dpf1" value="<%=request.getParameter(\"datepicker1\") %>" /> 
<jsp:param name="dpf2" value="<%=request.getParameter(\"datepicker2\") %>" /> 
</jsp:forward> 