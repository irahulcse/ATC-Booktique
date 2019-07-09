<%@ page import="java.io.*,java.sql.*"%>
<html>
<body>
<table>
<%
String filename = "c:\\csv\\export_return_data.csv";
Connection conn = null;
String url = "jdbc:mysql://localhost:3306/";
String dbName = "lib";
String driver = "com.mysql.jdbc.Driver";
String userName = "rahul";
String password = "pass";
Statement stmt;
Statement st2;
try
{
FileWriter fw = new FileWriter(filename);
fw.append("Transaction No");
fw.append(',');
fw.append("Issued Book No");
fw.append(',');
fw.append("Member ID");
fw.append(',');
fw.append("Member Name");
fw.append(',');
fw.append("Transaction Date");
fw.append(',');
fw.append("Expected Return Date");
fw.append(',');
fw.append("Actual Return Date");
fw.append(',');
fw.append("Member Phone No");
fw.append(',');
fw.append("Member Email_Id");
fw.append(',');
fw.append("Superviser's Name");
fw.append(',');
fw.append("Superviser's Email Id");
fw.append('\n');
Class.forName(driver);
conn = DriverManager.getConnection(url+dbName,userName,password);
String query = "select * from trans where tdeleted='y'";
String query2="select * from mem inner join trans on trans.memid=mem.memid";
stmt = conn.createStatement();
st2=conn.createStatement();
ResultSet rs = stmt.executeQuery(query);
ResultSet rs1=st2.executeQuery(query2);
while(rs.next() & rs1.next())
{
fw.append(rs.getString(1));
fw.append(',');
fw.append(rs.getString(2));
fw.append(',');
fw.append(rs.getString(3));
fw.append(',');
fw.append(rs1.getString(3));
fw.append(',');
fw.append(rs.getString(4));
fw.append(',');
fw.append(rs.getString(5));
fw.append(',');
fw.append(rs.getString(7));
fw.append(',');
fw.append(rs1.getString(5));
fw.append(',');
fw.append(rs1.getString(6));
fw.append(',');
fw.append(rs1.getString(9));
fw.append(',');
fw.append(rs1.getString(10));
fw.append('\n');
}
fw.flush();
fw.close();
conn.close();
response.sendRedirect("../LibrarianTransApplication/TransApplication.jsp");
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>