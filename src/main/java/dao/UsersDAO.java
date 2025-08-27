package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


import model.Student;
import model.User;

public class UsersDAO {

	public User LoginAuthenticate() throws Exception {

		Connection con = DBConnection.getConnection();

		Statement s = con.createStatement();
		ResultSet rs = s.executeQuery("select * from user");
		User u = new User();

		if (rs.next()) {
			u.setUsername(rs.getString("username"));
			u.setPassword(rs.getString("password"));
		}

		return u;   
	}

	public ResultSet DisplayAll() throws Exception{
		Connection con = DBConnection.getConnection();

		Statement s = con.createStatement();
		ResultSet rs = s.executeQuery("select * from Student");
		
		return rs;
	}
	
	public int addData(Student s)throws Exception {
		Connection con = DBConnection.getConnection();

		PreparedStatement ps=con.prepareStatement("insert into student values(?,?,?,?,?)");
		ps.setInt(1, s.getId());
		ps.setString(2, s.getName());
		ps.setDouble(3, s.getMarks());
		ps.setLong(4, s.getContact());
		ps.setString(5, s.getGender());
		
		return ps.executeUpdate();
	}
	
	public int deleteRow(int id) throws Exception{
		Connection con = DBConnection.getConnection();

		PreparedStatement ps=con.prepareStatement("delete from student where id = ?");
		ps.setInt(1, id);
		
		return ps.executeUpdate();
	}
}
