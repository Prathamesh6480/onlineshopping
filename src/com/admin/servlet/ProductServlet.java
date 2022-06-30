package com.admin.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.ProductDao;
import com.entities.AddProduct;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class ProductServlet
 */
@MultipartConfig
@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductServlet() {
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
	/**
	 *
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		PrintWriter pw=response.getWriter();
		try
		{
			String productname =request.getParameter("productname");
			String product_category=request.getParameter("productcategory");
			String product_subcat=request.getParameter("productsubcat");
			String product_type =request.getParameter("producttype");
			Part part=request.getPart("productphoto");
			String fileName=part.getSubmittedFileName();
			String product_color =request.getParameter("productcolor");
			String product_size=request.getParameter("productsize");
			String product_specification=request.getParameter("productspecification");
			String product_stock=request.getParameter("productstock");
			String product_mrp=request.getParameter("productmrp");
			String purchase_price=request.getParameter("purchaseprice");
			String sales_price=request.getParameter("sellingprice");
			String  product_gst=request.getParameter("productgst");
			String gst_price=request.getParameter("gstprice");
			String discount_price=request.getParameter("discountprice");
			String  product_discount=request.getParameter("productdiscount");
			String  product_price=request.getParameter("productprice");
			String  status=request.getParameter("status");
			AddProduct  ap=new AddProduct(productname,product_category,product_subcat,product_type,fileName,
					product_color,product_size,product_specification,product_stock,product_mrp,purchase_price,sales_price,
					product_gst,gst_price,discount_price,product_discount,product_price,status);
			
			ProductDao dao=new ProductDao(ConnectionProvider.getConnection());
			
			boolean f=dao.addProduct(ap);
			HttpSession session=request.getSession();
			
			
			
			
			if(f) 
			{
				
				InputStream is=part.getInputStream();
				byte []data=new byte[is.available()];
				is.read(data);
				String path=request.getRealPath("/") + "product" +  File.separator + fileName;
				System.out.println(path);
				FileOutputStream fos=new FileOutputStream(path);
			
				fos.write(data);
				fos.close();
				session.setAttribute("succMsg", "Product Added sucessfully..");	
				response.sendRedirect("AdminView/Add_Produt.jsp");	
			}
			else {
				session.setAttribute("failedMsg", "Something wrong on server..");	
				response.sendRedirect("AdminView/Add_Produt.jsp");		
			  
			  }
			 
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
