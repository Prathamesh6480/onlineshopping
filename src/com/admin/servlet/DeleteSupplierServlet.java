package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CartDao;
import com.dao.SupplierDao;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class DeleteCategoryServlet
 */
@WebServlet("/DeleteSupplierServlet")
public class DeleteSupplierServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteSupplierServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int id=Integer.parseInt(request.getParameter("id"));
		SupplierDao dao= new SupplierDao(ConnectionProvider.getConnection());
		boolean f=dao.deleteSupplier(id);
		HttpSession session=request.getSession();
		
		if(f)
		{
			session.setAttribute("succMsg", "Suplier Data  Removed");
			response.sendRedirect("AdminView/supplierreport.jsp");
		}
		else
		{
			session.setAttribute("failedMsg", "Something wrong for server");
			response.sendRedirect("AdminView/supplierreport.jsp");
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
