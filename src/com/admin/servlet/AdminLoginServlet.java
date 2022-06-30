package com.admin.servlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AdminDao;
import com.dao.UserRegisterDao;
import com.entities.Adminlogin;
import com.entities.UserRegister;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginServlet() {
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
		
		String userEmail = request.getParameter("email");
		String userPassword=request.getParameter("password");
		AdminDao dao= new AdminDao(ConnectionProvider.getConnection());
				
		HttpSession session = request.getSession();
		
		Adminlogin admin=dao.getAdminByEmailAndPassword(userEmail, userPassword);
		
		if(admin!=null)
		{
			session.setAttribute("currentUser", admin);
		
			response.sendRedirect("AdminView/Dashboard.jsp");
			//Admin login... sucess
		}
			else
			{
				session.setAttribute("failedMsg", "Something Wrong on Server...");
				  response.sendRedirect("AdminView/login.jsp");
				  //Admin login.... error
			}
		
		
	
	
		
	}
}
