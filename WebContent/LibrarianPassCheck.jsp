
<%@page import="java.sql.*,java.util.*"%>
<%
String uid1=request.getParameter("eid1");
String  pass1=request.getParameter("password1");
String userName=new String("");
String password=new String("");
try
{
Class.forName("com.mysql.jdbc.Driver");
String sql = "SELECT * FROM librarian where bdeleted='n'";
Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/lib", "rahul", "pass");
Statement st=conn.createStatement();
ResultSet rs = st.executeQuery(sql);
int count=0;
while (rs.next()) 
{
	 userName=rs.getString("lid");
	 password=rs.getString("currentpassword");
	 if(userName.equals(uid1)&&password.equals(pass1))
	 {
	 	out.println("User Is Valid");
	 	//String redirectURL = "process.jsp";
   		 //response.sendRedirect(redirectURL);
   		 count=1;
	 	break;
	 }
}
if(count!=1)
{
	
	request.getRequestDispatcher("index.jsp").include(request, response);
	/* out.println("</div>");
	out.println("<div class='container'>");
	out.println("<h3>Username or Password Is Wrong For Librarian</h3>"); */
	
}
	//out.print(rs.getString("Uid"));
	//String a = resultSet.getString("Uid");
	//if ( a.equals(uid1))
	//{
		//out.print("found");
		//out.print(resultSet.getString("Password"));
}
catch(Exception e)
{
out.print(e);
e.printStackTrace();
}

%> 