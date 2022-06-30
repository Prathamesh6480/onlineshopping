package com.dao;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

import javax.servlet.http.HttpSession;

import com.entities.Order;
import com.entities.UserRegister;
import com.mysql.cj.Session;

public class OrderDao {
	
private Connection con;
	
	public OrderDao(Connection con)
	{
		this.con=con;
	}
	
	// method insert userregister to database
	
		public boolean saveUserOrder(Order order)
		{
			boolean f= false;
			try
			{
				// order ---> database
				String query ="insert into orders(userid,productid,product_name,quantity,product_mrp,sales_price,gst,product_discount,productprice,total_price,firstname,lastname,email,mobile,address,district,city,state,zip,paymentmode,status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement pstmt=this.con.prepareStatement(query);
				pstmt.setInt(1, order.getUserid());
				pstmt.setInt(2, order.getProductid());
				pstmt.setString(3,order.getProductname());
				pstmt.setString(4, order.getQuantity());
				pstmt.setString(5, order.getProductmrp());
				pstmt.setString(6, order.getSalesprice());
				pstmt.setString(7, order.getGst());
				pstmt.setString(8, order.getDiscount());
				pstmt.setString(9, order.getProductprice());
				pstmt.setString(10, order.getTotalprice());
				pstmt.setString(11, order.getFirstname());
				pstmt.setString(12, order.getLastname());
				pstmt.setString(13, order.getEmail());
				pstmt.setString(14, order.getMobile());
				pstmt.setString(15, order.getAddress());
				pstmt.setString(16, order.getDistrict());
				pstmt.setString(17, order.getCity());	
				pstmt.setString(18, order.getState());
				pstmt.setString(19, order.getZip());
				pstmt.setString(20, order.getPaymentmode());
				pstmt.setString(21, "Ordered");
				pstmt.executeUpdate();
				f=true;
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
			return f;
		}
		
		public List <Order> getAllOrder()
		{
			List<Order>list= new ArrayList<Order>();
			Order order=null;
			try
			{	
				String query = "SELECT * FROM orders WHERE status='Delivery' ORDER BY  orderid DESC ";
				PreparedStatement pstmt =this.con.prepareStatement(query);
				ResultSet rs=pstmt.executeQuery();
				while(rs.next())
				{
					order=new Order();
					order.setOrderid(rs.getInt(1));
					order.setUserid(rs.getInt(2));
					order.setProductid(rs.getInt(3));
					order.setProductname(rs.getString(4));
					order.setQuantity(rs.getString(5));
					order.setProductprice(rs.getString(10));
					order.setTotalprice(rs.getString(11));
					order.setFirstname(rs.getString(12));
					order.setEmail(rs.getString(14));
					order.setAddress(rs.getString(16));
					order.setCity(rs.getString(18));
					order.setState(rs.getString(19));
					order.setZip(rs.getString(20));
					order.setPaymentmode(rs.getString(21));
					order.setStatus(rs.getString(22));
					order.setDatetime1(rs.getTimestamp(23));
					order.setDatetime2(rs.getString(24));
					list.add(order);
				}
				
				
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}		
			return list;
		}
		
		public List <Order> getAllOrderedUser(int userId)
		{
			List<Order>list= new ArrayList<Order>();
			Order order=null;
			try
			{	
				String query = "SELECT * FROM orders WHERE userid=? ORDER BY  orderid DESC";
				PreparedStatement pstmt =this.con.prepareStatement(query);
				pstmt.setInt(1, userId);
				ResultSet rs=pstmt.executeQuery();
				while(rs.next())
				{
					order=new Order();
					order.setOrderid(rs.getInt(1));
					order.setUserid(rs.getInt(2));
					order.setProductid(rs.getInt(3));
					order.setProductname(rs.getString(4));
					order.setQuantity(rs.getString(5));
					order.setProductprice(rs.getString(10));
					order.setTotalprice(rs.getString(11));
					order.setFirstname(rs.getString(12));
					order.setEmail(rs.getString(14));
					order.setAddress(rs.getString(16));
					order.setCity(rs.getString(18));
					order.setState(rs.getString(19));
					order.setZip(rs.getString(20));
					order.setPaymentmode(rs.getString(21));
					order.setStatus(rs.getString(22));
					order.setDatetime1(rs.getTimestamp(23));
					list.add(order);
				}
				
				
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}		
			return list;
		}
		
		
		public List <Order> getAllOrdered()
		{
			List<Order>list= new ArrayList<Order>();
			Order order=null;
			try
			{	
				String query = "SELECT * FROM orders WHERE status='Ordered' ORDER BY  orderid DESC";
				PreparedStatement pstmt =this.con.prepareStatement(query);
				ResultSet rs=pstmt.executeQuery();
				while(rs.next())
				{
					order=new Order();
					order.setOrderid(rs.getInt(1));
					order.setUserid(rs.getInt(2));
					order.setProductid(rs.getInt(3));
					order.setProductname(rs.getString(4));
					order.setQuantity(rs.getString(5));
					order.setProductprice(rs.getString(10));
					order.setTotalprice(rs.getString(11));
					order.setFirstname(rs.getString(12));
					order.setEmail(rs.getString(14));
					order.setAddress(rs.getString(16));
					order.setCity(rs.getString(18));
					order.setState(rs.getString(19));
					order.setZip(rs.getString(20));
					order.setPaymentmode(rs.getString(21));
					order.setStatus(rs.getString(22));
					order.setDatetime1(rs.getTimestamp(23));
					list.add(order);
				}
				
				
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}		
			return list;
		}
		
		
		public List <Order> getCountOrdered()
		{
			List<Order>list= new ArrayList<Order>();
			Order order=null;
			try
			{	
				String query = "select count(*) from orders where status='Ordered'";
				PreparedStatement pstmt =this.con.prepareStatement(query);
				ResultSet rs=pstmt.executeQuery();
				while(rs.next())
				{
					order=new Order();
				order.setStatus(rs.getString("status"));
					
					list.add(order);
				}
				
				
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}		
			return list;
		}
		
		
		public List <Order> getAllPacked()
		{
			List<Order>list= new ArrayList<Order>();
			Order order=null;
			try
			{	
				String query = "SELECT * FROM orders WHERE status='Packed' ORDER BY  orderid DESC";
				PreparedStatement pstmt =this.con.prepareStatement(query);
				ResultSet rs=pstmt.executeQuery();
				while(rs.next())
				{
					order=new Order();
					order.setOrderid(rs.getInt(1));
					order.setUserid(rs.getInt(2));
					order.setProductid(rs.getInt(3));
					order.setProductname(rs.getString(4));
					order.setQuantity(rs.getString(5));
					order.setProductprice(rs.getString(10));
					order.setFirstname(rs.getString(12));
					order.setEmail(rs.getString(14));
					order.setAddress(rs.getString(16));
					order.setCity(rs.getString(18));
					order.setState(rs.getString(19));
					order.setZip(rs.getString(20));
					order.setPaymentmode(rs.getString(21));
					order.setStatus(rs.getString(22));
					order.setDatetime2(rs.getString(24));
					list.add(order);
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}		
			return list;
		}
	
		
		public List <Order> getAllShipped()
		{
			List<Order>list= new ArrayList<Order>();
			Order order=null;
			try
			{	
				String query = "SELECT * FROM orders WHERE status='Shipped' ORDER BY  orderid DESC";
				PreparedStatement pstmt =this.con.prepareStatement(query);
				ResultSet rs=pstmt.executeQuery();
				while(rs.next())
				{
					order=new Order();
					order.setOrderid(rs.getInt(1));
					order.setUserid(rs.getInt(2));
					order.setProductid(rs.getInt(3));
					order.setProductname(rs.getString(4));
					order.setQuantity(rs.getString(5));
					order.setProductprice(rs.getString(10));
					order.setFirstname(rs.getString(12));
					order.setEmail(rs.getString(14));
					order.setAddress(rs.getString(16));
					order.setCity(rs.getString(18));
					order.setState(rs.getString(19));
					order.setZip(rs.getString(20));
					order.setPaymentmode(rs.getString(21));
					order.setStatus(rs.getString(22));
					order.setDatetime2(rs.getString(24));
					list.add(order);
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}		
			return list;
		}
		
	
	    public Order getOrderEditById(int id) {
			Order order=null;
			try
			{
				String query = "select * from Orders where orderid=?";
				PreparedStatement pstmt =this.con.prepareStatement(query);
				pstmt.setInt(1, id);
				ResultSet rs=pstmt.executeQuery();
				while(rs.next())
				{
					order=new Order();
					order.setOrderid(rs.getInt(1));
					order.setUserid(rs.getInt(2));
					order.setProductid(rs.getInt(3));
					order.setProductname(rs.getString(4));
					order.setQuantity(rs.getString(5));
					order.setProductmrp(rs.getString(6));
				    order.setSalesprice(rs.getString(7));
				    order.setGst(rs.getString(8));
				    order.setDiscount(rs.getString(8));
					order.setProductprice(rs.getString(10));
					order.setTotalprice(rs.getString(11));
					order.setFirstname(rs.getString(12));
					order.setLastname(rs.getString(13));
					order.setEmail(rs.getString(14));
					order.setAddress(rs.getString(16));
					order.setCity(rs.getString(18));
					order.setZip(rs.getString(20));
					order.setPaymentmode(rs.getString(21));
					order.setStatus(rs.getString(22));
					order.setDatetime1(rs.getTimestamp(23));
					order.setDatetime2(rs.getString(24));
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return order;
		}
	    
	    public Order getOrderPrintUr(int id,int uid) {
			Order order=null;
			try
			{
				String query = "select * from Orders where orderid=? and userid=?";
				PreparedStatement pstmt =this.con.prepareStatement(query);
				pstmt.setInt(1, id);
				pstmt.setInt(2, uid);
				ResultSet rs=pstmt.executeQuery();
				while(rs.next())
				{
					order=new Order();
					order.setOrderid(rs.getInt(1));
					order.setUserid(rs.getInt(2));
					order.setProductid(rs.getInt(3));
					order.setProductname(rs.getString(4));
					order.setQuantity(rs.getString(5));
					order.setProductmrp(rs.getString(6));
				    order.setSalesprice(rs.getString(7));
				    order.setGst(rs.getString(8));
				    order.setDiscount(rs.getString(8));
					order.setProductprice(rs.getString(10));
					order.setTotalprice(rs.getString(11));
					order.setFirstname(rs.getString(12));
					order.setLastname(rs.getString(13));
					order.setEmail(rs.getString(14));
					order.setAddress(rs.getString(16));
					order.setCity(rs.getString(18));
					order.setZip(rs.getString(20));
					order.setPaymentmode(rs.getString(21));
					order.setStatus(rs.getString(22));
					order.setDatetime1(rs.getTimestamp(23));
					order.setDatetime2(rs.getString(24));
				}
				
				
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return order;
		}
	    
	    public boolean updateOrder(Order order) {
			boolean f=false;
			try
			{
			
				String query="update orders set status=?,completedate=? where orderid=?";
				PreparedStatement pstmt =this.con.prepareStatement(query);
				
				pstmt.setString(1, order.getStatus());
				pstmt.setString(2, order.getDatetime2());
				pstmt.setInt(3, order.getOrderid());
				int i=pstmt.executeUpdate();
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
	    
	    // for print
	    
		public boolean deleteOrdered(int id)
		{
			boolean f=false;
			try
			{
				String query="delete from orders where orderid=?";
				PreparedStatement pstmt=this.con.prepareStatement(query);
				pstmt.setInt(1, id);
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
		
		// Search Datewise Order
		
		public List <Order> getAllOrderDatewise(String form_date,String to_date)
		{
			List<Order>list= new ArrayList<Order>();
			Order order=null;
			try
			{	
				String query = "SELECT * FROM orders WHERE completedate BETWEEN '"+form_date+"' and '"+to_date+"' ";
				PreparedStatement pstmt =this.con.prepareStatement(query);
				ResultSet rs=pstmt.executeQuery();
				while(rs.next())
				{
					order=new Order();
					order.setOrderid(rs.getInt(1));
					order.setUserid(rs.getInt(2));
					order.setProductid(rs.getInt(3));
					order.setProductname(rs.getString(4));
					order.setQuantity(rs.getString(5));
					order.setProductprice(rs.getString(10));
					order.setTotalprice(rs.getString(11));
					order.setFirstname(rs.getString(12));
					order.setEmail(rs.getString(14));
					order.setAddress(rs.getString(16));
					order.setCity(rs.getString(18));
					order.setState(rs.getString(19));
					order.setZip(rs.getString(20));
					order.setPaymentmode(rs.getString(21));
					order.setStatus(rs.getString(22));
					order.setDatetime1(rs.getTimestamp(23));
					order.setDatetime2(rs.getString(24));
					list.add(order);
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}		
			return list;
		}
		
		
		// Search Monthwise Order
		
				public List <Order> getAllOrderMonthwise(String form_date)
				{
					List<Order>list= new ArrayList<Order>();
					Order order=null;
					try
					{	
						String query = "select * from orders where completedate like '%"+form_date+"%' ";
						PreparedStatement pstmt =this.con.prepareStatement(query);
						//pstmt.setString(1, form_date);
						ResultSet rs=pstmt.executeQuery();
						while(rs.next())
						{
							order=new Order();
							order.setOrderid(rs.getInt(1));
							order.setUserid(rs.getInt(2));
							order.setProductid(rs.getInt(3));
							order.setProductname(rs.getString(4));
							order.setQuantity(rs.getString(5));
							order.setProductprice(rs.getString(10));
							order.setEmail(rs.getString(14));
							order.setPaymentmode(rs.getString(21));
							order.setStatus(rs.getString(22));
							order.setDatetime2(rs.getString(24));
							list.add(order);
						}
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}		
					return list;
				}
				
				
				// Search Yearwise Order
				
				public List <Order> getAllOrderYearwise(String form_date)
				{
					List<Order>list= new ArrayList<Order>();
					Order order=null;
					try
					{	
						String query = "select * from orders where completedate="+form_date+" ";
						PreparedStatement pstmt =this.con.prepareStatement(query);
						//pstmt.setString(1, form_date);
						ResultSet rs=pstmt.executeQuery();
						while(rs.next())
						{
							order=new Order();
							order.setOrderid(rs.getInt(1));
							order.setUserid(rs.getInt(2));
							order.setProductid(rs.getInt(3));
							order.setProductname(rs.getString(4));
							order.setQuantity(rs.getString(5));
							order.setProductprice(rs.getString(10));
							order.setEmail(rs.getString(14));
							order.setPaymentmode(rs.getString(21));
							order.setStatus(rs.getString(22));
							order.setDatetime2(rs.getString(24));
							list.add(order);
						}
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}		
					return list;
				}
}
