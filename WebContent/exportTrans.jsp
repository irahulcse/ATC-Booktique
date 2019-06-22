<%@ page import="java.io.*,java.sql.*"%>
<html>
<body>
<table>
<%
String filename = "c:\\csv\\export_Transaction_data.csv";
Connection conn = null;
String url = "jdbc:mysql://localhost:3306/";
String dbName = "lib";
String driver = "com.mysql.jdbc.Driver";
String userName = "rahul";
String password = "pass";
Statement stmt;
try
{
FileWriter fw = new FileWriter(filename);
fw.append("Transaction No");
fw.append(',');
fw.append("Issued Book No");
fw.append(',');
fw.append("Member ID");
fw.append(',');
fw.append("Transaction Date");
fw.append(',');
fw.append("Expected Return Date");
fw.append('\n');
Class.forName(driver);
conn = DriverManager.getConnection(url+dbName,userName,password);
String query = "select * from trans";
stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(query);
while(rs.next())
{
fw.append(rs.getString(1));
fw.append(',');
fw.append(rs.getString(2));
fw.append(',');
fw.append(rs.getString(3));
fw.append(',');
fw.append(rs.getString(4));
fw.append(',');
fw.append(rs.getString(5));
fw.append('\n');
}
fw.flush();
fw.close();
conn.close();
response.sendRedirect("TransApplication.jsp");
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>