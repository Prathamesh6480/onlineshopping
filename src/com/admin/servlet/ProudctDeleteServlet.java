package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ProductDao;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class ProudctDeleteServlet
 */
@WebServlet("/ProudctDeleteServlet")
public class ProudctDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProudctDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		try
		{
			int id=Integer.parseInt(request.getParameter("id"));
			ProductDao dao=new ProductDao(ConnectionProvider.getConnection());
			boolean f=dao.deleteProduct(id);
			
			HttpSession session=request.getSession();
			if(f)
			{
				session.setAttribute("succMsg", "Product Deleted sucessfully..");	
				response.sendRedirect("AdminView/ViewProduct.jsp");
			}
			else
			{
				session.setAttribute("failedMsg", "Something wrong on server..");	
				response.sendRedirect("AdminView/ViewProduct.jsp");		
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}


}
