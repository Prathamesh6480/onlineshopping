package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.activation.ActivationException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AdminDao;
import com.dao.EmailUtility;
import com.dao.SendEmail;
import com.dao.SendUserpassDao;
import com.dao.UserRegisterDao;
import com.entities.EmailMessage;
import com.entities.SendUser;
import com.entities.UserRegister;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class ForgetPassMailServlet
 */
@WebServlet("/ForgetPassMailServlet")
public class ForgetPassMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgetPassMailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		PrintWriter pw=response.getWriter();
		response.setContentType("text/html");
		String email = request.getParameter("email").trim();
		
	
		SendUserpassDao dao1= new SendUserpassDao(ConnectionProvider.getConnection());
			UserRegister user =dao1.getUserByEmailAndPassword(email);		
			HttpSession session=request.getSession();
				if(user!=null)
				{
					 try {
							EmailMessage emailbean = new EmailMessage();
							emailbean.setTo(email);
							emailbean.setSubject("User password");
							emailbean.setMessage("Hii "+email+ "Your Password is: "+user.getPassword());
							
					      EmailUtility.sendMail(emailbean);
					      session.setAttribute("succMsg", "Send password Successfully check your mail...");
					      response.sendRedirect("changepassword.jsp");
					    } catch (ActivationException e) {
					      // TODO Auto-generated catch block
					    	pw.println("error");
					    }
				}
					 else
					 {
							session.setAttribute("failedMsg", "Wrong emai address mentioned");
							response.sendRedirect("changepassword.jsp");
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
