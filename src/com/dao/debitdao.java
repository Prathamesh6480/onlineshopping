package com.dao;

import java.sql.*;

import com.entities.debit;

public class debitdao {

private Connection con;
	
	public debitdao(Connection con)
	{
		this.con=con;
		
	}
	
	public debit getUserByEmailAndPassword(String cardname,String cardno, String edate, String cvv)
	{
	 debit user= null;
		
		try
		{
			String query="select cardname,cardno,edate,cvv from debitcard where cardname=? and cardno=? ";
			PreparedStatement pstmt= this.con.prepareStatement(query);
			pstmt.setString(1, cardname);
			pstmt.setString(2, cardno);
			
			
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
			{
				user = new debit();
				
				//data from db
			
				//set to user object
			
				user.setId(rs.getInt("id"));
				user.setCartname(rs.getString("cardname"));
				user.setCartno(rs.getString("cardno"));
				user.setEdate(rs.getString("edate"));
				user.setCvv(rs.getString("cvv"));
				
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return user;
		
	}
}
