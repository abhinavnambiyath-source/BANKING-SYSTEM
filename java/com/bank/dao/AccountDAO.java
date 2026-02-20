package com.bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import com.bank.util.DBConnection;

public class AccountDAO {
	Connection con =DBConnection.getConnection();
	
	private String genrateAccountNumber() {
		Random r =new Random();
		return "ACC"+(100000+r.nextInt(900000));
	}
	
	public void createAccount(int userId) {
		
		
		try {
			String accNo =genrateAccountNumber();
			String sql="INSERT INTO accounts(user_id,account_number,balance)VALUE(?,?,0)";
			PreparedStatement ps =con.prepareStatement(sql);
			
			ps.setInt(1, userId);
			ps.setString(2, accNo);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	 public ResultSet getAccountByUser(int userId) {
	        try {
	            String sql = "SELECT * FROM accounts WHERE user_id=?";
	            PreparedStatement ps = con.prepareStatement(sql);
	            ps.setInt(1, userId);
	            return ps.executeQuery();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return null;
	 }
	 public boolean deposit(int userId, double amount) {
	        try {
	            String sql = "UPDATE accounts SET balance = balance + ? WHERE user_id=?";
	            PreparedStatement ps = con.prepareStatement(sql);
	            ps.setDouble(1, amount);
	            ps.setInt(2, userId);
	            return ps.executeUpdate() > 0;
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return false;
	 }
	 public boolean withdraw(int userId,double amount) {
		 
		 
		 try {
			 String check="SELECT balance FROM accounts WHERE user_id=?";
			 PreparedStatement ps1=con.prepareStatement(check);
			 ps1.setInt(1, userId);
			 ResultSet rs=ps1.executeQuery();
			 
			 
			 if(rs.next()) {
				 double balance=rs.getDouble("balance");
				 if(balance>=amount) {
					 String sql ="UPDATE accounts SET balance =balance-? WHERE user_id=?";
					 PreparedStatement ps2=con.prepareStatement(sql);
					 ps2.setDouble(1, amount);
					 ps2.setInt(2, userId);
					 return ps2.executeUpdate()>0;
				 }
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		return false;
		 
	 }
	 public boolean transfer(String fromAcc,String toAcc,double amount) {
		 
		 try {
			con.setAutoCommit(false);
			
			
			String check="SELECT balance FROM accounts WHERE account_number=?";
			PreparedStatement ps1=con.prepareStatement(check);
			ps1.setString(1, fromAcc);
			ResultSet rs=ps1.executeQuery();
			
			
			if(rs.next()) {
				double balance=rs.getDouble("balance");
				
				if (balance>=amount) {
					String debit="UPDATE accounts SET balance =balance-? WHERE account_number=?";
					PreparedStatement ps2=con.prepareStatement(debit);
					ps2.setDouble(1, amount);
					ps2.setString(2, fromAcc);
					ps2.executeUpdate();
					
					
					String credit="UPDATE accounts SET balance= balance+? WHERE account_number=?";
					PreparedStatement ps3=con.prepareStatement(credit);
					ps3.setDouble(1, amount );
					ps3.setString(2, toAcc);
					ps3.executeUpdate();
					
					
					con.commit();
					return true;
					
				}
			}
			con.rollback();
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		 }
		return false;
		 
	 }
	 
	 
	 

}
