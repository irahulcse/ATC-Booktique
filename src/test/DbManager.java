	package test;

import java.sql.*;

public class DbManager {
	public Connection getConnection() {
		Connection con=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/new","rahul","pass");
			}
		catch(Exception e) {
			System.out.println(e);
		}
		return con;
	}
}
