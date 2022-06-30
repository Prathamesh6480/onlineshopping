package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.EnquiryDao;
import com.dao.UserRegisterDao;
import com.entities.UserEnquiry;
import com.entities.UserRegister;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class EnquiryServlet
 */
@WebServlet("/EnquiryServlet")
public class EnquiryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnquiryServlet() {
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
		
		
		PrintWriter pw = response.getWriter();
		String fullname= request. getParameter("userfullname");
		String contact=request.getParameter("usercontact");
		String email =request.getParameter("useremail");
		String subject=request.getParameter("subject");
		String message = request.getParameter("usermessage");
		//create user object and set all data to that object
		
		UserEnquiry enquiry=new UserEnquiry();
		enquiry.setFullname(fullname);
		enquiry.setContact(contact);
		enquiry.setEmail(email);
		enquiry.setSubject(subject);
		enquiry.setMessage(message);
		
		HttpSession session=request.getSession();
		
		// create a user dao object
						EnquiryDao dao=new EnquiryDao(ConnectionProvider.getConnection());
						boolean f =dao.saveEnquiry(enquiry);
						if(f)
						{
							session.setAttribute("succMsg", "Thank You for your given response..");
							response.sendRedirect("ContactForm.jsp");
						}
						else
						{
							session.setAttribute("failedMsg", "Something Wrong on Server...");
							response.sendRedirect("ContactForm.jsp");
						}				
		}
	}


