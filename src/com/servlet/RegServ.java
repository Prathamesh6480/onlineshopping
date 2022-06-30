package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

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
 * Servlet implementation class RegServ
 */
@WebServlet("/RegServ")
public class RegServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegServ() {
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
		String fname= request. getParameter("userfirstname");
		String lname=request.getParameter("userlastname");
		String email =request.getParameter("useremail");
		String mobileno=request.getParameter("mobileno");
		String password = request.getParameter("userpassword");
		String check = request.getParameter("check");
		
		//create user object and set all data to that object
		UserRegister user= new UserRegister();
		user.setFname(fname);
		user.setLname(lname);
		user.setEmail(email);
		user.setMobileno(mobileno);
		user.setPassword(password);		
		HttpSession session=request.getSession();
		
		if(check!=null)
		{
			// create a user dao object
						UserRegisterDao dao=new UserRegisterDao(ConnectionProvider.getConnection());
						boolean f3=dao.checkUser(email);
						if(f3)
						{
							boolean f2=dao.checkUser1(mobileno);
							if(f2)
							{
								boolean f =dao.saveUser(user);
								if(f)
								{
									session.setAttribute("succMsg", "User Register Successfully...");
									response.sendRedirect("registration.jsp");
								}
								else
								{
									session.setAttribute("failedMsg", "Something Wrong on Server...");
									response.sendRedirect("registration.jsp");
								}	
							}
							else
							{
								session.setAttribute("failedMsg", "User Already Exist Try Another mobile..");
								response.sendRedirect("registration.jsp");
							}
						}
						else
						{
							session.setAttribute("failedMsg", "User Already Exist Try Another Email..");
							response.sendRedirect("registration.jsp");	
						}
		}else
		{	
			session.setAttribute("failedMsg", "Please Check Agree & Terms Conditions");
			response.sendRedirect("registration.jsp");
		}
	}
}