<%@page import="java.sql.*" %>
  <%@page import="java.util.*" %>
  <%@page import="org.json.JSONObject" %>

<%
    Connection con= null;
 try{
  Class.forName("com.mysql.jdbc.Driver").newInstance();
 con =      DriverManager.getConnection("jdbc:mysql://localhost:3306/lib","root","password");

        ResultSet rs = null;
        List bookdetails = new LinkedList();
        JSONObject responseObj = new JSONObject();

        String query = "SELECT bcategoryid, qoh from books";
          PreparedStatement pstm= con.prepareStatement(query);

           rs = pstm.executeQuery();
           JSONObject bookObj = null;

        while (rs.next()) {
            String bcategoryid = rs.getString("bcategoryid");
            int qoh = rs.getInt("qoh");
            bookObj = new JSONObject();
            bookObj.put("bcategoryid", bcategoryid);
            bookObj.put("qoh", qoh);
            bookdetails.add(bookObj);
        }
        responseObj.put("bookdetails", bookdetails);
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
  