<%@page import="java.sql.*" %>
  <%@page import="java.util.*" %>
  <%@page import="org.json.JSONObject" %>

<%
    Connection con= null;
 try{
  Class.forName("com.mysql.jdbc.Driver").newInstance();
 con =      DriverManager.getConnection("jdbc:mysql://localhost:3306/lib","root","password");

        ResultSet rs = null;
        List popdetail = new LinkedList();
        JSONObject responseObj = new JSONObject();

        String query = "select bookname, count(transactiondate) as Popularity from transactions WHERE transactiondate>=date_sub(current_date(),INTERVAL 12 MONTH) AND transactiondate<=current_date()+1 group by bookno; ";
          PreparedStatement pstm= con.prepareStatement(query);

           rs = pstm.executeQuery();
           JSONObject popobj = null;

        while (rs.next()) {
            String bookname = rs.getString("bookname");
            int Popularity = rs.getInt("Popularity");
            popobj = new JSONObject();
            popobj.put("bookname", bookname);
            popobj.put("Popularity", Popularity);
            popdetail.add(popobj);
        }
        responseObj.put("popdetail", popdetail);
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
  