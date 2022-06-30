package com.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.entities.AddProduct;
import com.entities.Adminlogin;
import com.entities.UserRegister;

public class UserRegisterDao {
	
	private Connection con;
	
	public UserRegisterDao(Connection con)
	{
		this.con=con;
		
	}
	
	// method insert userregister to database
	
	public boolean saveUser(UserRegister  user)
	{
		boolean f= false;
		try
		{
			// user ---> database
		
			String query ="insert into userregistertb(firstname,lastname,email,mobileno,password) value(?,?,?,?,?)";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			pstmt.setString(1,user.getFname());
			pstmt.setString(2, user.getLname());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getMobileno());
			pstmt.setString(5, user.getPassword());
			int i=pstmt.executeUpdate();
			if(i==1)
			{
				f=true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return f;
	}
	
	public boolean checkpassword(int id,String ps)
	{
		boolean f =false;
		try
		{
		String sql ="select * from userregistertb where userid=? and password=?";
		PreparedStatement pstmt= this.con.prepareStatement(sql);
		pstmt.setInt(1, id);
		pstmt.setString(2, ps);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next())
		{
			f=true;
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean forgetUserPassword(UserRegister user) {
		boolean f=false;
		
		try
		{
			String query="update userregistertb set password=?"
					+ " where userid=?";
			PreparedStatement pstmt =this.con.prepareStatement(query);
	
			pstmt.setString(1, user.getPassword());
			pstmt.setInt(2, user.getId());
			
		    pstmt.executeUpdate();
			f=true;
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	// get user by email and password
	public UserRegister getUserByEmailAndPassword(String email,String password)
	{
		UserRegister user= null;
		
		try
		{
			String query="select * from userregistertb where email=?  and password=?";
			PreparedStatement pstmt= this.con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);	
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				user = new UserRegister();
				//data from db
				String name=rs.getString("firstname");
				//set to user object	
				user.setId(rs.getInt("userid"));
				user.setFname(name);
				user.setLname(rs.getString("lastname"));
				user.setEmail(rs.getString("email"));
				user.setMobileno(rs.getString("mobileno"));
				user.setPassword(rs.getString("password"));
				user.setDatetime(rs.getTimestamp("r_date"));
				user.setAddress(rs.getString("Address"));
				user.setCity(rs.getString("city"));
				user.setState(rs.getString("state"));
				user.setZip(rs.getString("zip"));	
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return user;
		
	}
	
	public boolean updateUser(UserRegister user) {
		boolean f=false;
		try
		{
			String query="update userregistertb set firstname=?,lastname=?,email=?,mobileno=?"
					+ " where userid=?";
			PreparedStatement pstmt =this.con.prepareStatement(query);
			pstmt.setString(1, user.getFname());
			pstmt.setString(2, user.getLname());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getMobileno());
			pstmt.setInt(5, user.getId());
		   int i = pstmt.executeUpdate();
			
		   if(i==1)
		   {
		   f=true;
		   }
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean updateAddress(UserRegister user) {
		boolean f=false;
		try
		{
			String query="update userregistertb set Address=?,city=?,state=?,zip=?"
					+ " where userid=?";
			PreparedStatement pstmt =this.con.prepareStatement(query);
			pstmt.setString(1, user.getAddress());
			pstmt.setString(2, user.getCity());
			pstmt.setString(3, user.getState());
			pstmt.setString(4, user.getZip());
			pstmt.setInt(5, user.getId());
		    pstmt.executeUpdate();
			f=true;
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	
	
	public List<UserRegister> getAllUser() {
		List<UserRegister> list = new ArrayList<UserRegister>();
		UserRegister user=null;
			try
			{		
				String query = "select * from userregistertb ";
				PreparedStatement pstmt =this.con.prepareStatement(query);
		
				ResultSet rs=pstmt.executeQuery();
				while(rs.next())
				{
					user=new UserRegister();
					user.setId(rs.getInt(1));
					user.setFname(rs.getString(2));
					user.setLname(rs.getString(3));
					user.setEmail(rs.getString(4));
					user.setMobileno(rs.getString(5));
					user.setPassword(rs.getString(6));
					user.setDatetime(rs.getTimestamp(7));
					
					list.add(user);
				}
				
				
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}		
			return list;
	}
	
	public boolean checkUser(String email)
	{
		boolean f= true;
		try
		{
			String sql= "select * from userregistertb where email=?";
			PreparedStatement pstmt= con.prepareStatement(sql);
			pstmt.setString(1, email);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				f=false;
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean checkUser1(String mobileno)
	{
		boolean f= true;
		try
		{
			String sql= "select * from userregistertb where mobileno=?";
			PreparedStatement pstmt= con.prepareStatement(sql);
		
			pstmt.setString(1, mobileno);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				f=false;
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
}