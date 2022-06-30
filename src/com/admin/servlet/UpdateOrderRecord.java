package com.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.OrderDao;
import com.entities.Order;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class UpdateOrderRecord
 */
@WebServlet("/UpdateOrderRecord")
public class UpdateOrderRecord extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateOrderRecord() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		try
		{
		    int id=Integer.parseInt(request.getParameter("id"));	
			String  status=request.getParameter("status");
		
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
           
         Order order= new Order();
				order.setOrderid(id);
				order.setStatus(status);
				order.setDatetime2(formatter.format(date));
				OrderDao dao = new OrderDao(ConnectionProvider.getConnection());
				boolean f=dao.updateOrder(order);
				HttpSession session=request.getSession();
				if(f)
				{
					session.setAttribute("succMsg", "Order is Packed sucessfully..");	
					response.sendRedirect("AdminView/Packed.jsp");
				}	
				else
				{
					session.setAttribute("succMsg", "Something is wrong on server");
					response.sendRedirect("AdminView/Packed.jsp");
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
		PrintWriter pw=response.getWriter();
		
			
		
			
		
	}

}
