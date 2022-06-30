package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserRegisterDao;
import com.entities.UserRegister;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class UserAddressServlet
 */
@WebServlet("/UserAddressServlet")
public class UserAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserAddressServlet() {
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
		

		try
		{
			String address =request.getParameter("address");
			String city=request.getParameter("city");
			String state=request.getParameter("state");
			String zip =request.getParameter("zip");
			
			HttpSession session=request.getSession();
			UserRegister  user=(UserRegister)session.getAttribute("currentUser");
		
			user.setAddress(address);
			user.setCity(city);
			user.setState(state);
			user.setZip(zip);
			
			
			UserRegisterDao dao = new UserRegisterDao(ConnectionProvider.getConnection());
			boolean f=dao.updateAddress(user);
			if(f)
			{
				session.setAttribute("succMsg", "User Address sucessfully..");	
				response.sendRedirect("address.jsp");
			}
			else
			{
				session.setAttribute("failedMsg", "Something wrong on server..");	
				response.sendRedirect("address.jsp");		
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	

	}

}
