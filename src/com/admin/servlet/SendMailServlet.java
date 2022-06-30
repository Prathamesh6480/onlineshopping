package com.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SendEmail;
import com.entities.SendUser;

/**
 * Servlet implementation class SendMailServlet
 */
@WebServlet("/SendMailServlet")
public class SendMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMailServlet() {
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
		String name = request.getParameter("username");
		String email = request.getParameter("useremail");
		String subject = request.getParameter("usersubject");
		String message = request.getParameter("content");
		
		SendEmail sm = new SendEmail();
		SendUser user = new SendUser(name,email,subject,message);
		sm.sendEmail(user);
		
		HttpSession session = request.getSession();
		boolean test = sm.sendEmail(user);
		if(test)
		{
			
			session.setAttribute("succMsg", "Enquiry mail send sucessfully..");	
			response.sendRedirect("AdminView/ContactReport.jsp");
		}
		else
		{
			session.setAttribute("failedMsg", "Something wrong on server..");	
			response.sendRedirect("AdminView/ContactReport.jsp");	
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
