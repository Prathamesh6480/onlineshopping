package com.servlet;
import com.dao.CartDao;
import com.dao.ProductDao;
import com.entities.AddProduct;
import com.entities.Cart;
import com.helper.ConnectionProvider;
import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public CartServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		try
		{
			int pid=Integer.parseInt(request.getParameter("pid"));
			int uid=Integer.parseInt(request.getParameter("uid"));
			String txtqty= (String)request.getParameter("txtqty");
			ProductDao dao=new ProductDao(ConnectionProvider.getConnection());
			AddProduct ap=dao.getProductEditById(pid);
			Cart cart=new Cart();
			cart.setProduct_id(pid);
			cart.setUserid(uid);
			cart.setProduct_name(ap.getProudct_name());
			cart.setProduct_image(ap.getProduct_photo());
			cart.setProduct_qty(txtqty);
			cart.setProduct_mrp(Double.parseDouble(ap.getProduct_mrp()));
			cart.setSales_price(Double.parseDouble(ap.getSales_price()));
			cart.setGst(ap.getProduct_gst());
			cart.setProduct_discount(ap.getProduct_discount());
			cart.setSelling_price(Double.parseDouble(ap.getProduct_price()));
			cart.setTotal_price(Double.parseDouble(ap.getProduct_price()) );		
			CartDao dao2=new CartDao(ConnectionProvider.getConnection());
			boolean f=dao2.addCart(cart);
			HttpSession session =request.getSession();
			if(f)
			{
				session.setAttribute("addCart", "Product Added to Cart");
				response.sendRedirect("ShowProduct.jsp");
			}
			else
			{
				session.setAttribute("addCart", "Somethings wrong on server");
				response.sendRedirect("ShowProduct.jsp");
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
