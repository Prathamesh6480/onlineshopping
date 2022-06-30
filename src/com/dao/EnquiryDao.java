package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entities.AddProduct;
import com.entities.UserEnquiry;
import com.entities.UserRegister;

public class EnquiryDao {
	
	private Connection con;
	public EnquiryDao(Connection con)
	{
		this.con=con;
		
	}
	public boolean saveEnquiry(UserEnquiry  enquiry)
	{
		boolean f= false;
		try
		{
			// user ---> database
		
			String query ="insert into enquiry(full_name,contact_no,email,subject,message) value(?,?,?,?,?)";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			pstmt.setString(1,enquiry.getFullname());
			pstmt.setString(2, enquiry.getContact());
			pstmt.setString(3, enquiry.getEmail());
			pstmt.setString(4, enquiry.getSubject());
			pstmt.setString(5, enquiry.getMessage());
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
	
	
	public List<UserEnquiry> getAllEnquiry() {
		List<UserEnquiry> list = new ArrayList<UserEnquiry>();
		UserEnquiry enquiry=null;
			try
			{		
				String query = "select * from enquiry order by equiry_id desc";
				PreparedStatement pstmt =this.con.prepareStatement(query);
		
				ResultSet rs=pstmt.executeQuery();
				while(rs.next())
				{
					enquiry=new UserEnquiry();
					enquiry.setEnquiry_id(rs.getInt(1));
					enquiry.setFullname(rs.getString(2));
					enquiry.setContact(rs.getString(3));
					enquiry.setEmail(rs.getString(4));
					enquiry.setSubject(rs.getString(5));
					enquiry.setMessage(rs.getString(6));
					enquiry.setDatetime(rs.getTimestamp(7));
					
					list.add(enquiry);
				}
				
				
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}		
			return list;
	}
	
	public UserEnquiry getEnquiryByEmailId(int id) {
		UserEnquiry enquiry=null;
		try
		{
			String query = "select * from enquiry where equiry_id=?";
			PreparedStatement pstmt =this.con.prepareStatement(query);
			pstmt.setInt(1, id);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				enquiry=new UserEnquiry();
				enquiry.setFullname(rs.getString(2));
				enquiry.setEmail(rs.getString(4));
				enquiry.setSubject(rs.getString(5));	
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return enquiry;
	}

}
