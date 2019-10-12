<%@ page import="java.sql.*" %>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<html>
<head>
<link rel='stylesheet' href='../bootstrap.min.css'/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">body { background:  white !important; }
.btn {
  background-color: DodgerBlue;
  border: none;
  color: white;
  padding: 12px 30px;
  cursor: pointer;
  font-size: 20px;
}
</style>

</head>
<body>

<jsp:include page="../AdminLibApplication/navheader.jsp" />
<div style="width:300px">

</div>



<jsp:include page="../navfooter.jsp" />
<br>
<br>

<div class='container'>
<table class='table table-bordered table-striped' border="1">
<tr><th>ADMIN NAME</th><th>DATE OF CREATION</th></tr>
<%
Connection con = null;
String url = "jdbc:mysql://localhost:3306/";
String db = "lib";
String driver = "com.mysql.jdbc.Driver";
String userName ="root";
String password="password";


Statement st;
try{
Class.forName(driver);
con = DriverManager.getConnection(url+db,userName,password);
String query = "select * from admin";
st = con.createStatement();
ResultSet rs = st.executeQuery(query);
%>
<%
while(rs.next()){
%>
<tr><td><%=rs.getString("adminid")%></td>
<td><%=rs.getDate("dateofcreation") %></td>
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
</form>
</body>
</html>