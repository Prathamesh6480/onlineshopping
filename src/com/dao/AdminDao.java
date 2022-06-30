package com.dao;
import java.util.*;

import com.entities.Adminlogin;

import java.sql.*;

public class AdminDao {
	
	private Connection con;
	
	public AdminDao(Connection con)
	{
		this.con=con;
	}

	public Adminlogin getAdminByEmailAndPassword(String adminname,String adminpassword)
	{
		Adminlogin admin= null;
		try
		{
			String query="select * from adminlogin where adminname=? and password=?";
			PreparedStatement pstmt= this.con.prepareStatement(query);
			pstmt.setString(1, adminname);
			pstmt.setString(2, adminpassword);	
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				admin = new Adminlogin();
				//data from db
				String name=rs.getString("adminname");
				//set to user object	
				admin.setAdminid(rs.getInt("adminid"));
				admin.setAdminname(name);
				admin.setAdminpassword(rs.getString("password"));	
			}	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return admin;	
	}
}
