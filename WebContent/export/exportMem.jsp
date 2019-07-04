<%@ page import="java.io.*,java.sql.*"%>
<html>
<body>
<table>
<%
String filename = "c:\\csv\\export_Member_data.csv";
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
fw.append("Member's Id");
fw.append(',');
fw.append("Member's Name");
fw.append(',');
fw.append("Member's Address");
fw.append(',');
fw.append("Member's Contact No");
fw.append(',');
fw.append("Member's Email Id");
fw.append(',');
fw.append("Member's City");
fw.append(',');
fw.append("Member's Employee Type");
fw.append(',');
fw.append("Member's Superviser_Name");
fw.append(',');
fw.append("Member's Superviser_Email Id");
fw.append('\n');
Class.forName(driver);
conn = DriverManager.getConnection(url+dbName,userName,password);
String query = "select * from mem";
stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(query);
while(rs.next())
{
fw.append(rs.getString(2));
fw.append(',');
fw.append(rs.getString(3));
fw.append(',');
fw.append(rs.getString(4));
fw.append(',');
fw.append(rs.getString(5));
fw.append(',');
fw.append(rs.getString(6));
fw.append(',');
fw.append(rs.getString(7));
fw.append(',');
fw.append(rs.getString(8));
fw.append(',');
fw.append(rs.getString(9));
fw.append(',');
fw.append(rs.getString(10));
fw.append('\n');
}
fw.flush();
fw.close();
conn.close();
response.sendRedirect("../AdminMemApplication/MemApplication.jsp");
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>