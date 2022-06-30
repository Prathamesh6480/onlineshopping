package com.servlet;

import java.io.IOException;
import java.sql.*;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CartDao;
import com.dao.ProductDao;
import com.entities.AddProduct;
import com.entities.Cart;
import com.entities.UserRegister;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class QuantityServlet
 */
@WebServlet("/QuantityServlet")
public class QuantityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuantityServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		response.getWriter().append("Served at: ").append(request.getContextPath());
		UserRegister user=(UserRegister)session.getAttribute("currentUser");
		
		int pid=Integer.parseInt(request.getParameter("pid"));
		int uid=Integer.parseInt(request.getParameter("uid"));
		String incdec= request.getParameter("quantity");
		ProductDao dao=new ProductDao(ConnectionProvider.getConnection());
		AddProduct ap=dao.getProductEditById(pid);
	
		
		int availableQty = Integer.parseInt(ap.getProduct_stock());
	
		
		Double price=0.0;
		Double total=0.0;
		int quantity=0;
		
		try
		{
			Connection con =ConnectionProvider.getConnection();
			Statement st = con.createStatement();
			ResultSet rs =st.executeQuery("select * from cart where userid='"+uid+"' and product_id='"+pid+"' ");
			while(rs.next())
			{
				price=rs.getDouble(11);
				total=rs.getDouble(12);
				quantity=rs.getInt(6);
				
				
			}
			
			if(availableQty <= quantity  ) 
			{
				response.sendRedirect("AddtoCart.jsp?msg=notQty");
				response.sendRedirect("AddtoCart.jsp");
				if(quantity !=1 && incdec.equals("dec"))
				{
					total=total-price;
					quantity=quantity-1;
					st.executeUpdate("update cart set total_price='"+total+"', product_qty='"+quantity+"' where userid='"+uid+"' and product_id='"+pid+"' ");
					
					response.sendRedirect("AddtoCart.jsp");
					
				}
				
			
			}
			else
			{
				
				if(quantity==1 && incdec.equals("dec"))

					response.sendRedirect("AddtoCart.jsp?msg=notPossible");
				
				
				
				else if(quantity !=1 && incdec.equals("dec"))
				{
					total=total-price;
					quantity=quantity-1;
					st.executeUpdate("update cart set total_price='"+total+"', product_qty='"+quantity+"' where userid='"+uid+"' and product_id='"+pid+"' ");
					
					response.sendRedirect("AddtoCart.jsp");
					
				}
				else
				{
					total=total+price;
					quantity=quantity+1;
					st.executeUpdate("update cart set total_price='"+total+"', product_qty='"+quantity+"' where userid='"+uid+"' and product_id='"+pid+"' ");
				
					
					response.sendRedirect("AddtoCart.jsp");
				}
			
				
			}
			
			}
			
			
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
