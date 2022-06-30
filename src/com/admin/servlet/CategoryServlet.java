package com.admin.servlet;

import java.io.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ProductDao;
import com.dao.CategoryDao;
import com.entities.ProductCategory;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class SubCategoryServlet
 */
@WebServlet("/CategoryServlet")
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryServlet() {
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
		PrintWriter pw= response.getWriter();
		
		int supplierid=Integer.parseInt(request.getParameter("supplierid"));
		String suppliername=request.getParameter("suppliername");
		String categoryname=request.getParameter("categoryname");
		ProductCategory sc = new ProductCategory(supplierid,suppliername,categoryname);
		CategoryDao dao=new CategoryDao(ConnectionProvider.getConnection());
		HttpSession session = request.getSession();
		if(dao.saveCategory(sc))
		{
			session.setAttribute("succMsg", "Category Added sucessfully..");	
			response.sendRedirect("AdminView/Category.jsp");
		}
		else
		{
			session.setAttribute("failedMsg", "Something Wrong on Server...");
			response.sendRedirect("AdminView/Category.jsp");
			
		}
	}

}
