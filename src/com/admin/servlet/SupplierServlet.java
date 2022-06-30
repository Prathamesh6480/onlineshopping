package com.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SupplierDao;
import com.dao.ProductDao;
import com.entities.Supplier;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class CategoryServlet
 */
@WebServlet("/SupplierServlet")
public class SupplierServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupplierServlet() {
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
		
		
		String supplier_name= request. getParameter("suppliername");
		String company= request. getParameter("company");
		String typeoffirm= request. getParameter("typeoffirm");
		String statusofcompany= request. getParameter("statusofcompany");
		String email= request. getParameter("email");
		String country= request. getParameter("country");
		String state= request. getParameter("state");
		String address1= request. getParameter("address1");
		String address2= request. getParameter("address2");
		String contact= request. getParameter("contact");
		String zip= request. getParameter("zip");
		String panno= request. getParameter("panno");
	
	
		//create supplier object and set all data to that object
		
	Supplier cat= new Supplier(supplier_name,company,typeoffirm,statusofcompany,email,country,state,address1,address2,contact,zip,panno);
		HttpSession session=request.getSession();
		
		// create a supplier dao object
		
		SupplierDao dao=new SupplierDao(ConnectionProvider.getConnection());
		if(dao.saveSupplierData(cat))
		{
			session.setAttribute("succMsg", "Supplier Date Insert sucessfully..");	
			response.sendRedirect("AdminView/Supplier.jsp");
		}
		else
		{
			session.setAttribute("failedMsg", "Something wrong on server..");	
			response.sendRedirect("AdminView/Supplier.jsp");		
		}
		
	}

}
