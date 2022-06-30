package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entities.UserRegister;

public class SendUserpassDao {
private Connection con;
	
	public SendUserpassDao(Connection con)
	{
		this.con=con;
	}
	
	public UserRegister getUserByEmailAndPassword(String email)
	{
		UserRegister user= null;
		try
		{
			String query="select * from userregistertb where email=?";
			PreparedStatement pstmt= this.con.prepareStatement(query);
			pstmt.setString(1, email);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
			{
				user = new UserRegister();
				//data from d
				
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
					
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return user;
		
	}
	
	
	
	
	

}
