package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SupplierDao;
import com.entities.Supplier;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class EditCategoryServlet
 */
@WebServlet("/EditSupplierServlet")
public class EditSupplierServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditSupplierServlet() {
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
			int id=Integer.parseInt(request.getParameter("id"));
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
			
		
			
			
			Supplier supplier= new Supplier();
			supplier.setSupplier_id(id);
			supplier.setSupplier_name(supplier_name);
			supplier.setCompany(company);
			supplier.setTypeoffirm(typeoffirm);
			supplier.setStatusofcompany(statusofcompany);
			supplier.setEmail(email);
			supplier.setCountry(country);
			supplier.setState(state);
			supplier.setAddress1(address1);
			supplier.setAddress2(address2);
			supplier.setContact(contact);
			supplier.setZip(zip);
			supplier.setPanno(panno);
			
			
			SupplierDao dao = new SupplierDao(ConnectionProvider.getConnection());
			boolean f=dao.updateSupplier(supplier);
			HttpSession session=request.getSession();
			if(f)
			{
				session.setAttribute("succMsg", "Supplier Records updated sucessfully..");	
				response.sendRedirect("AdminView/supplierreport.jsp");
			}
			else
			{
				session.setAttribute("failedMsg", "Something wrong on server..");	
				response.sendRedirect("AdminView/supplierreport.jsp");		
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
