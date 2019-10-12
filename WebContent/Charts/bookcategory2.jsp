<%@page import="java.sql.*" %>
  <%@page import="java.util.*" %>
  <%@page import="org.json.JSONObject" %>

<%
    Connection con= null;
 try{
  Class.forName("com.mysql.jdbc.Driver").newInstance();
 con =      DriverManager.getConnection("jdbc:mysql://localhost:3306/lib","root","password");

        ResultSet rs = null;
        List bookdetail = new LinkedList();
        JSONObject responseObj = new JSONObject();

        String query = "SELECT bcategoryid, issued from books";
          PreparedStatement pstm= con.prepareStatement(query);

           rs = pstm.executeQuery();
           JSONObject bookobj1 = null;

        while (rs.next()) {
            String bcategoryid = rs.getString("bcategoryid");
            int issued = rs.getInt("issued");
            bookobj1 = new JSONObject();
            bookobj1.put("bcategoryid", bcategoryid);
            bookobj1.put("issued", issued);
            bookdetail.add(bookobj1);
        }
        responseObj.put("bookdetail", bookdetail);
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
  