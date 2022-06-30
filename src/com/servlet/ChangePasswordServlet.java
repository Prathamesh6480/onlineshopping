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
 * Servlet implementation class ChangePasswordServlet
 */
@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordServlet() {
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
		int userid = Integer.parseInt(request.getParameter("userid"));
		String opassword = request.getParameter("oldpassword");
		String npassword= request.getParameter("newpassword");
		
		UserRegister user = new UserRegister();
		user.setId(userid);
		user.setPassword(npassword);
		
		HttpSession session=request.getSession();
		UserRegisterDao dao = new UserRegisterDao(ConnectionProvider.getConnection());
		boolean f = dao.checkpassword(userid,opassword);
			if(f)
			{
				boolean f2=dao.forgetUserPassword(user);
				if(f2)
				{
					session.setAttribute("succMsg", "Password Change sucessfully..");	
					response.sendRedirect("changepsw.jsp");
				}
				else
				{
					session.setAttribute("failedMsg", "something is wrong on server..");	
					response.sendRedirect("changepsw.jsp");		
				}
				
			}
			else
			{
				session.setAttribute("failedMsg", "Your password is Incorect..");	
				response.sendRedirect("changepsw.jsp");	
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
