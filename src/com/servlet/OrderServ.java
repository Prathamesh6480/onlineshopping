package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CartDao;
import com.dao.OrderDao;
import com.dao.ProductDao;
import com.entities.Cart;
import com.entities.Order;
import com.entities.UserRegister;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class OrderServ
 */
@WebServlet("/OrderServ")
public class OrderServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		HttpSession session =request.getSession();
		UserRegister user=(UserRegister)session.getAttribute("currentUser");
		int id = Integer.parseInt(request.getParameter("id"));
		String mobileno = request.getParameter("mobileno");
		String address = request.getParameter("address");
		String district = request.getParameter("district");
		String city = request.getParameter("city");
		String zip = request.getParameter("zip");
		String check = request.getParameter("check");
		Double total_price=Double.parseDouble(request.getParameter("total_price"));
		
		if(request.getParameter("check") != null)
		{
		
			if(request.getParameter("check").equals("cashondelivery"))
			{
			    CartDao dao=new CartDao(ConnectionProvider.getConnection());
			   
				
				List<Cart> list=dao.getProductByUser(user.getId());
				if(list != null && user!=null)
				{
				//Double total_price=0.00;
				for(Cart c:list)
				{ 
					
					Order order=new Order();
					
					//total_price=c.getTotal_price();
					order.setUserid(user.getId());
					order.setProductid(c.getProduct_id());
					order.setProductname(c.getProduct_name());
					order.setQuantity(c.getProduct_qty());
					order.setProductmrp(Double.toString(c.getProduct_mrp()));
					order.setSalesprice(Double.toString(c.getSales_price()));
					order.setGst(c.getGst());
					order.setDiscount(c.getProduct_discount());
					order.setProductprice(Double.toString(c.getSelling_price()));
					order.setTotalprice(Double.toString(c.getTotal_price()));
					order.setFirstname(user.getFname());
					order.setLastname(user.getLname());
					order.setEmail(user.getEmail());
					order.setMobile(mobileno);
					order.setAddress(address);
					order.setDistrict(district);
					order.setCity(city);
					order.setState(user.getState());
					order.setZip(zip);
					order.setPaymentmode(check);
					OrderDao dao1 = new OrderDao(ConnectionProvider.getConnection());
					
					boolean f =dao1.saveUserOrder(order);
					if(f)
					{
						 CartDao dao2=new CartDao(ConnectionProvider.getConnection());
						    boolean f2=dao2.deleteCartProducts(id);
						    
						    int  productid = c.getProduct_id();
						    int cqty=Integer.parseInt(c.getProduct_qty());
						    int stock=0;
					try
					{
						
						Connection con =ConnectionProvider.getConnection();
						Statement st = con.createStatement();
						ResultSet rs =st.executeQuery("select * from producttb1 where product_id='"+productid+"' ");
						while(rs.next())
						{
							stock=rs.getInt(10);
						
						}
						
						stock= stock-cqty;
						
						
						st.executeUpdate("update producttb1 set  product_stock='"+stock+"' where  product_id='"+productid+"' ");
						
						
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
						   
					response.sendRedirect("Success.jsp");
					}
					else
					{
						pw.println("Error");
						
					}
				}
				
			}
			}
			
			if(request.getParameter("check").equals("onlinepayment"))
			{
				
				session.setAttribute("id", id);
				session.setAttribute("mobileno", mobileno);
				session.setAttribute("address", address);
				session.setAttribute("district", district);
				session.setAttribute("city", city);
				session.setAttribute("zip", zip);
				session.setAttribute("zip", zip);
				session.setAttribute("check", check);
				session.setAttribute("total_price", total_price);
				response.sendRedirect("debit2.jsp");
				
			}
			
		}
		
		
		
	
	}

	}
