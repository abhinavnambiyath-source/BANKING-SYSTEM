package com.bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bank.dto.User;
import com.bank.util.DBConnection;

public class UserDAO {
	
	Connection con=DBConnection.getConnection();
	
	public boolean  registerUser(User user) {
		
		try {
			String sql="INSERT INTO users(name,email,password)VALUES(?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			
			return ps.executeLargeUpdate()>0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return false;
	}
	public  User Login(String email,String password) {
		
		
		try {
			String sql="SELECT *FROM users WHERE  email=? AND password=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs=ps.executeQuery();
			
			
			if(rs.next()) {
				User user =new User();
				user.setUserId(rs.getInt("user_id"));
				user.setName(rs.getString("name"));;
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("role"));
				return user;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	public boolean emailExists(String email) {
	    try {
	        String sql = "SELECT * FROM users WHERE email=?";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setString(1, email);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            return true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}

}
