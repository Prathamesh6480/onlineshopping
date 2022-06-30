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
 * Servlet implementation class ForgePassServ
 */
@WebServlet("/ForgePassServ")
public class ForgePassServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgePassServ() {
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
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			HttpSession session=request.getSession();
			UserRegister user= new UserRegister();
			
			user.setEmail(email);
			user.setPassword(password);
			
			UserRegisterDao dao = new UserRegisterDao(ConnectionProvider.getConnection());
			boolean f=dao.forgetUserPassword(user);
			if(f)
			{
				session.setAttribute("succMsg", "User updated sucessfully..");	
				response.sendRedirect("login.jsp");
			}
			else
			{
				session.setAttribute("failedMsg", "Something wrong on server..");	
				response.sendRedirect("login.jsp");		
			}
		}
		catch(Exception e)
		{
			
		}
	}

}
