package com.bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.bank.util.DBConnection;

public class TransactionDAO {
	Connection con =DBConnection.getConnection();
	
	
	public void addTransaction(int accountId,String type,double amount) {
		
		try {
			String sql ="INSERT INTO transaction(account_id,type,amount) VALUES(?,?,?)";
			PreparedStatement ps =con.prepareStatement(sql);
			
			ps.setInt(1, accountId);
			ps.setString(2, type);
			ps.setDouble(3, amount);
			ps.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
