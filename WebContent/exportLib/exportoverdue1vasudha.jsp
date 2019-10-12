<%@ page import="java.io.*,java.sql.*"%>
<html>
<body>
<table>
<%
String filename = "c:\\csv\\Libexport_Overdue.csv";
Connection conn = null;
String url = "jdbc:mysql://localhost:3306/";
String dbName = "lib";
String driver = "com.mysql.jdbc.Driver";
String userName = "root";
String password = "password";
Statement stmt;
try
{
FileWriter fw = new FileWriter(filename);
fw.append("Transaction Id");
fw.append(',');
fw.append("Book No");
fw.append(',');
fw.append("Book Name");
fw.append(',');
fw.append("Member Name");
fw.append(',');
fw.append("Expected Return Date");
fw.append(',');
fw.append("Days Passed");
fw.append('\n');
Class.forName(driver);
conn = DriverManager.getConnection(url+dbName+"?zeroDateTimeBehavior=convertToNull",userName,password);
String query = "select *, DATEDIFF(current_date(),STR_TO_DATE(expreturndate, '%Y-%m-%d')) as days from transactions where str_to_date(expreturndate,'%Y-%m-%d')<=current_date() and tdeleted='n'";
stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(query);
while(rs.next())
{
fw.append(rs.getString(1));
fw.append(',');
fw.append(rs.getString(6));
fw.append(',');
fw.append(rs.getString(10));
fw.append(',');
fw.append(rs.getString(8));
fw.append(',');
fw.append(rs.getString(4));
fw.append(',');
fw.append(rs.getString("days"));
fw.append('\n');
}
fw.flush();
fw.close();
conn.close();
response.sendRedirect("../LibrarianDashboard/ExecDash.jsp");
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>