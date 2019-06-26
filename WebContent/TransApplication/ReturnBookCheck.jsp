<%@page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
<%
String no=request.getParameter("id");
int id=Integer.parseInt(no);
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lib", "rahul", "pass");
Statement st=con.createStatement();
Statement st1=con.createStatement();
Statement st2=con.createStatement();
Statement st3=con.createStatement();
Statement st4=con.createStatement();

//We are setting the tdeleted to yes, so that we can filter the returned books with unreturned ones;
st4.executeUpdate("update trans set trans.tdeleted='y' where transno='"+id+"' ");

//In the below query we are updating the return date and time in the trans table
st.executeUpdate("update trans set trans.ReturnDate=current_timestamp where transno='"+id+"'");

//In the below update query we are basically working to update the quantity of the issued and qoh in the books table..
st1.executeUpdate("update books inner join trans on trans.bookno=books.bookno set books.issued=books.issued-1,books.qoh=books.qoh+1");

//In this below query we are going to update the mReturn count +=1, so and also going to generate the mPending(mReturn plus mcount with it).
st2.executeUpdate("update mem inner join trans on trans.memid=mem.memid set mem.mReturn=mem.mReturn+1,mem.mPending=mem.mcount-mem.mReturn where transno='"+id+"'");

//For showing the calculation better, we need to run this statement too, so that we will be going to get the mPending in the right format
st3.executeUpdate("update mem inner join trans on trans.memid=mem.memid set mem.mPending=mem.mPending-1 where transno='"+id+"'");

//For Redirecting the page back to the same aplication so that we will be to get the result.
response.sendRedirect("TransApplication.jsp");
}	
catch(Exception e){
System.out.println(e);
}
%>