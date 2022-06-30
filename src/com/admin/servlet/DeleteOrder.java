package com.admin.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.OrderDao;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class DeleteOrder
 */
@WebServlet("/DeleteOrder")
public class DeleteOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int oid=Integer.parseInt(request.getParameter("oid"));
		int pid=Integer.parseInt(request.getParameter("pid"));
		int pqty = Integer.parseInt(request.getParameter("pqty"));
		
		OrderDao dao = new OrderDao(ConnectionProvider.getConnection());
		boolean f = dao.deleteOrdered(oid);
		HttpSession session=request.getSession();
		if(f)
		{
			    int stock=0;
		try
		{
			
			Connection con =ConnectionProvider.getConnection();
			Statement st = con.createStatement();
			ResultSet rs =st.executeQuery("select * from producttb1 where product_id='"+pid+"' ");
			while(rs.next())
			{
				stock=rs.getInt(10);
			
			}
			
			stock= stock+pqty;
			
			
			st.executeUpdate("update producttb1 set  product_stock='"+stock+"' where  product_id='"+pid+"' ");
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		session.setAttribute("succMsg", "Your Order Cancel successfully");
		response.sendRedirect("myorder.jsp");
		
		}
		else
		{
			
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
