package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	private static final String Driver="com.mysql.cj.jdbc.Driver";
	private static final String url="jdbc:mysql://localhost:3306/billing_db";
	private static final String user="root";
	private static final String pass="root";
	
	public static Connection getConnection() throws Exception {
		Class.forName(Driver);
		
		return DriverManager.getConnection(url,user,pass);
	}
}