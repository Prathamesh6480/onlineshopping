package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ProductDao;
import com.dao.UserRegisterDao;
import com.entities.AddProduct;
import com.entities.UserRegister;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class EditUserServlet
 */
@WebServlet("/EditUserServlet")
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUserServlet() {
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
			String fname =request.getParameter("fname");
			String lname=request.getParameter("lname");
			String email=request.getParameter("email");
			String mobileno =request.getParameter("mobileno");
			String password= request.getParameter("password");
			
			UserRegister user = new UserRegister();
			user.setId(userid);
			user.setFname(fname);
			user.setLname(lname);
			user.setEmail(email);
			user.setMobileno(mobileno);
			
			HttpSession session=request.getSession();
		UserRegisterDao dao = new UserRegisterDao(ConnectionProvider.getConnection());
		boolean f = dao.checkpassword(userid,password);
			if(f)
			{
				
						boolean f4=dao.updateUser(user);
						if(f4)
						{
							session.setAttribute("succMsg", "User updated sucessfully..");	
							response.sendRedirect("myaccount.jsp");
						}
						else
						{
							session.setAttribute("failedMsg", "something is wrong on server..");	
							response.sendRedirect("myaccount.jsp");		
						}
					}
					
			else
			{
				session.setAttribute("failedMsg", "Your password is Incorect..");	
				response.sendRedirect("myaccount.jsp");	
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
