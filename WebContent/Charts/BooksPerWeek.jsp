<%@page import="java.sql.*" %>
  <%@page import="java.util.*" %>
  <%@page import="org.json.JSONObject" %>

<%
    Connection con= null;
 try{
  Class.forName("com.mysql.jdbc.Driver").newInstance();
 con =      DriverManager.getConnection("jdbc:mysql://localhost:3306/lib","root","password");

        ResultSet rs = null;
        List bookpw = new LinkedList();
        JSONObject responseObj = new JSONObject();

   		 String query = "SELECT count(transactiondate) as quantity, MName, MONTH FROM booksperweek WHERE transactiondate>=date_sub(current_date(),INTERVAL 12 MONTH) AND transactiondate<=current_date()+1 group by MONTH ORDER BY MONTH";
         PreparedStatement pstm= con.prepareStatement(query);

           rs = pstm.executeQuery();
           JSONObject weekObj = null;

        while (rs.next()) {
            
            int month = rs.getInt("month"); 
            int quantity = rs.getInt("quantity");
            String MName = rs.getString("MName");
           /*  int month = rs.getInt("MONTH"); */
            weekObj = new JSONObject();
            weekObj.put("month", month);
            weekObj.put("quantity", quantity);
            weekObj.put("MName",MName);
          /*   weekObj.put("month",month); */
            bookpw.add(weekObj);
        }
        responseObj.put("bookpw", bookpw);
    out.print(responseObj.toString());
    }
    catch(Exception e){
        e.printStackTrace();
    }finally{
        if(con!= null){
            try{
            con.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }
 %>
  