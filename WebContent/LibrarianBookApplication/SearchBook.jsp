 <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*" %>
<%-- <%@page import="org.json.simple.JSONObject" %> --%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "lib";
String userid = "rahul";
String password = "pass";
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
try{
String roll_no=request.getParameter("roll_no");
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select bookno, bookname from books where bookno='"+roll_no+"' and bdeleted='n'";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){ 
String book_no=resultSet.getString("bookno");
out.print(book_no);
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%> 