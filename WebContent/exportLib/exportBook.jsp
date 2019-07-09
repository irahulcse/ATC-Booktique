<%@ page import="java.io.*,java.sql.*"%>
<html>
<body>
<table>
<%
 String filename = "c:\\csv\\export_Book_data.csv";
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
fw.append("Book No");
fw.append(',');
fw.append("Book Name");
fw.append(',');
fw.append("Author Name");
fw.append(',');
fw.append("Publisher");
fw.append(',');
fw.append("Publication Year");
fw.append(',');
fw.append("Language");
fw.append(',');
fw.append("Genre");
fw.append(',');
fw.append("ISBN NO.");
fw.append(',');
fw.append("Quantity On Hand");
fw.append(',');
fw.append("Issued Quantity Till Now");
fw.append('\n');
Class.forName(driver);
conn = DriverManager.getConnection(url+dbName,userName,password);
String query = "select * from books";
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
fw.append(',');
fw.append(rs.getString(11));
fw.append('\n');
}
fw.flush();
fw.close();
conn.close();
response.sendRedirect("../LibrarianBookApplication/BookApplication.jsp");
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>