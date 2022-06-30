package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ProductDao;
import com.entities.AddProduct;
import com.helper.ConnectionProvider;


/**
 * Servlet implementation class EditProductServlet
 */
@WebServlet("/EditProductServlet")
public class EditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try
		{
			int id=Integer.parseInt(request.getParameter("id"));
			String productname =request.getParameter("productname");
			String product_category=request.getParameter("productcategory");
			String product_subcat=request.getParameter("productsubcat");
			String product_type=request.getParameter("producttype");
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
			
			AddProduct ap= new AddProduct();
			ap.setProduct_id(id);
			ap.setProudct_name(productname);
			ap.setProduct_category(product_category);
			ap.setProduct_subcat(product_subcat);
			ap.setProduct_type(product_type);
			ap.setProduct_color(product_color);
			ap.setProduct_size(product_size);
			ap.setProduct_specification(product_specification);
			ap.setProduct_stock(product_stock);
			ap.setProduct_mrp(product_mrp);
			ap.setPurchase_price(purchase_price);
			ap.setSales_price(sales_price);
			ap.setProduct_gst(product_gst);
			ap.setGst_price(gst_price);
			ap.setDiscount_price(discount_price);
			ap.setProduct_discount(product_discount);
			ap.setProduct_price(product_price);
			ap.setStatus(status);
			
			ProductDao dao = new ProductDao(ConnectionProvider.getConnection());
			boolean f=dao.updateProduct(ap);
			HttpSession session=request.getSession();
			if(f)
			{
				session.setAttribute("succMsg", "Product updated sucessfully..");	
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
