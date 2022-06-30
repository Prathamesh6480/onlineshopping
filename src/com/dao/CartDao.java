package com.dao;

import com.entities.AddProduct;
import com.entities.Cart;
import com.entities.Supplier;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class CartDao implements CartDaoInter{
	private Connection con;
	
	public CartDao(Connection con)
	{
		this.con=con;
	}
	
	@Override
	public boolean addCart(Cart cart) {
		boolean f= false;
		try
		{
			String sql="insert into cart(product_id,userid,product_name,product_photo,product_qty,product_mrp,"
					+ "sales_price,gst,product_discount,selling_price,total_price)value(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt=this.con.prepareStatement(sql);
			pstmt.setInt(1,cart.getProduct_id());
			pstmt.setInt(2,cart.getUserid());
			pstmt.setString(3,cart.getProduct_name());
			pstmt.setString(4, cart.getProduct_image());
			pstmt.setString(5, cart.getProduct_qty());
			pstmt.setDouble(6, cart.getProduct_mrp());
			pstmt.setDouble(7, cart.getSales_price());
			pstmt.setString(8, cart.getGst());
			pstmt.setString(9,cart.getProduct_discount());
			pstmt.setDouble(10,cart.getSelling_price());
			pstmt.setDouble(11,cart.getTotal_price());
			int i=pstmt.executeUpdate();
			if(i==1)
			{
				f=true;
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return f;
	}
	

	@Override
	public List<Cart> getProductByUser(int userId) {
		List<Cart>list= new ArrayList<Cart>();
		Cart cart=null;
		try
		{
			String query ="select * from cart where userid=?";
			PreparedStatement pstmt =this.con.prepareStatement(query);
			pstmt.setInt(1, userId);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{		
				cart=new Cart();
				cart.setCart_id(rs.getInt(1));
				cart.setProduct_id(rs.getInt(2));
				cart.setUserid(rs.getInt(3));
				cart.setProduct_name(rs.getString(4));
				cart.setProduct_image(rs.getString(5));
				cart.setProduct_qty(rs.getString(6));
				cart.setProduct_mrp(rs.getDouble(7));
				cart.setSales_price(rs.getDouble(8));
				cart.setGst(rs.getString(9));
				cart.setProduct_discount(rs.getString(10));
				cart.setSelling_price(rs.getDouble(11));
				cart.setTotal_price(rs.getDouble(12));
				list.add(cart);	
			}
		}
		catch(Exception e)
		{
			
		}
		
		return list;
	}
	
	public boolean deleteCartProduct(int pid)
	{
		boolean f=false;
		
		try
		{
			String sql="delete from cart where cartid=?";
			PreparedStatement pstmt=this.con.prepareStatement(sql);
			pstmt.setInt(1, pid);
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
	
	public boolean deleteCartProducts(int userId)
	{
		boolean f=false;
		
		try
		{
			String sql="delete from cart where userid=?";
			PreparedStatement pstmt=this.con.prepareStatement(sql);
			pstmt.setInt(1, userId);
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


}
