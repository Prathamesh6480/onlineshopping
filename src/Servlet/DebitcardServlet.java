package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CartDao;
import com.dao.OrderDao;
import com.dao.UserRegisterDao;
import com.entities.Cart;
import com.entities.Order;
import com.entities.UserRegister;
import com.helper.ConnectionProvider;

import database.db;

/**
 * Servlet implementation class DebitcardServlet
 */
@WebServlet("/DebitcardServlet")
public class DebitcardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DebitcardServlet() {
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
		try
		{
			HttpSession session=request.getSession();
			UserRegister  user=(UserRegister)session.getAttribute("currentUser");
			int id =Integer.parseInt(request.getParameter("id"));
			String paymentmode=request.getParameter("paymentmode");
			String mobileno=request.getParameter("mobileno");
			String address=request.getParameter("address");
			String district=request.getParameter("district");
			String zip=request.getParameter("zip");
			String city=request.getParameter("city");
			double transferAmt=Double.parseDouble(request.getParameter("total_price"));
			
		String accnoTo1 = "1";
		
		
/*customer*/int custIdTo=0, branchIdTo=0;
			
			String first_name =request.getParameter("cardname");
			String cardnoFrom=request.getParameter("cardno");
			String expdate=request.getParameter("edate");
			String cvv =request.getParameter("cvv");
			
/*Customer*/int  custIdFrom=0;
/*Mydetail*/int accountIdTo = 0;

/*customer*/String expdateFrom="",first_NameFrom="",debit_cardFrom ="",cvvFrom="",accNoFrom = "";
/*mydetails*/String ifscTo="", first_nameTo="";

/*customer*/double acc_balFrom = 0;
/*mydetail*/double acc_balTo = 0;

			
			
		
			int norec;
			norec=db.select("select * from account where debit_card_no='"+cardnoFrom+"'and expdate='"+expdate+"' and cvv='"+cvv+"' ");
			if(norec>0)
			{
				if(db.rs.next()){
			
			String getBalFrom = "select balance from account where debit_card_no="+ cardnoFrom;
			db.select(getBalFrom);
			try {
				if (db.rs.next()) {
					acc_balFrom = db.rs.getDouble(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			String getAccNoFrom = "select account_no from account where debit_card_no="+ cardnoFrom;
			db.select(getAccNoFrom);
			try {
				if (db.rs.next()) {
					accNoFrom = db.rs.getString(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			String getdebit_cardFrom = "select debit_card_no from account where debit_card_no="+ cardnoFrom;
			db.select(getdebit_cardFrom);
			try {
				if (db.rs.next()) {
					debit_cardFrom = db.rs.getString(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
			
			String getCvvFrom = "select cvv from account where debit_card_no= "+ cardnoFrom;
			db.select(getCvvFrom);
			try {
				if (db.rs.next()) {
					cvvFrom = db.rs.getString(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
			String getExpdateFrom = "select expdate from account where debit_card_no= "+ cardnoFrom;
			db.select(getExpdateFrom);
			try {
				if (db.rs.next()) {
					expdateFrom = db.rs.getString(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
			String getCustIdFrom = "select customer_id from account where  debit_card_no = " + cardnoFrom;
			db.select(getCustIdFrom);
			try {
				if (db.rs.next()) {
					custIdFrom = db.rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			String getFirstNameFrom = "select first_name from customer where id = "+ custIdFrom;
			db.select(getFirstNameFrom);
			try {
				if (db.rs.next()) {
					first_NameFrom = db.rs.getString(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			
			// My Details
			
			String getBalTo = "select balance from account where account_no = " + accnoTo1;
			db.select(getBalTo);
			try {
				if (db.rs.next()) {
					acc_balTo = db.rs.getDouble(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			String getAccIdTo = "select id from account where account_no = " + accnoTo1;
			db.select(getAccIdTo);
			try {
				if (db.rs.next()) {
					accountIdTo = db.rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			String getCustIdTo = "select customer_id from account where account_no = " + accnoTo1;
			db.select(getCustIdTo);
			try {
				if (db.rs.next()) {
					custIdTo = db.rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			String getFirstNameTo = "select first_name from customer where id = "+ custIdTo;
			db.select(getFirstNameTo);
			try {
				if (db.rs.next()) {
					first_nameTo = db.rs.getString(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			String getBranchIdTo = "select branch_id from account where account_no = " + accnoTo1;
			db.select(getBranchIdTo);
			try {
				if (db.rs.next()) {
					branchIdTo = db.rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			String getIfscTo = "select ifsc from branch where id = "+ branchIdTo;
			db.select(getIfscTo);
			try {
				if (db.rs.next()) {
					ifscTo = db.rs.getString(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			//validating check
			if(!first_name.equals(first_NameFrom))
			{
				session.setAttribute("failedMsg", "Account Holder Name Does Not Match");
				response.sendRedirect("debit2.jsp");	
			}
		
			else if(!cardnoFrom.equals(debit_cardFrom))
			{
				session.setAttribute("failedMsg", "Card Number Not Match");
				response.sendRedirect("debit2.jsp");	
			}
			else if(!cvv.equals(cvvFrom))
			{
				session.setAttribute("failedMsg", "CVV Does Not Match");
				response.sendRedirect("debit2.jsp");		
			}
			
			else if(!expdate.equals(expdateFrom))
			{
				session.setAttribute("failedMsg", "expire date not Match...");
				response.sendRedirect("debit2.jsp");		
			}
			
			else if (acc_balFrom <= transferAmt) 
			{
				session.setAttribute("failedMsg", "Sorry!!!Insufficient Balance in Account...");
				response.sendRedirect("debit2.jsp");
			}
			
			else if (transferAmt >= 40000) 
			{
				session.setAttribute("failedMsg", "Tranfer Limit Exceeded(40,000)");
				response.sendRedirect("debit2.jsp");
			} 
		
			else
			{
				
				
				acc_balFrom -= transferAmt;
				acc_balTo += transferAmt;

				String creditNaration = "From AccNo:" + accNoFrom+" For "+paymentmode;
				String debitNaration = "To AccNo:" + accnoTo1+" For "+paymentmode;

				String insertTrnFrom = "insert into transaction values(" + 0 + "," + cardnoFrom + ",'" + LocalDateTime.now()
						+ "'," + accNoFrom + "," + 1 + "," + 2 + "," + transferAmt + ",'" + debitNaration + "',"
						+ acc_balFrom + ")";
				int i = db.insert(insertTrnFrom);

				String insertTrnTo = "insert into transaction values(" + 0 + "," + accountIdTo + ",'" + LocalDateTime.now()
						+ "'," + accnoTo1 + "," + 2 + "," + 2 + "," + transferAmt + ",'" + creditNaration + "'," + acc_balTo
						+ ")";
				int j = db.insert(insertTrnTo);

				if (i > 0 && j > 0) 
				{
					String updateBalFrom = "update account set balance = " + acc_balFrom + " where debit_card_no = " + cardnoFrom;
					i = db.update(updateBalFrom);
					
					String updateBalTo = "update account set balance = " + acc_balTo + " where id = " + accountIdTo;
					j = db.update(updateBalTo);
					
					
					CartDao dao=new CartDao(ConnectionProvider.getConnection());
					List<Cart> list=dao.getProductByUser(user.getId());
					if(list != null && user!=null)
					{
					//Double total_price=0.00;
					for(Cart c:list)
					{ 
						Order order=new Order();
						
						//total_price=c.getTotal_price();
						order.setUserid(user.getId());
						order.setProductid(c.getProduct_id());
						order.setProductname(c.getProduct_name());
						order.setQuantity(c.getProduct_qty());
						order.setProductmrp(Double.toString(c.getProduct_mrp()));
						order.setSalesprice(Double.toString(c.getSales_price()));
						order.setGst(c.getGst());
						order.setDiscount(c.getProduct_discount());
						order.setProductprice(Double.toString(c.getSelling_price()));
						order.setTotalprice(Double.toString(c.getTotal_price()));
						order.setFirstname(user.getFname());
						order.setLastname(user.getLname());
						order.setEmail(user.getEmail());
						order.setMobile(mobileno);
						order.setAddress(address);
						order.setDistrict(district);
						order.setCity(city);
						order.setState(user.getState());
						order.setZip(zip);
						order.setPaymentmode(paymentmode);
						OrderDao dao1 = new OrderDao(ConnectionProvider.getConnection());
						boolean f =dao1.saveUserOrder(order);
						if(f)
						{
							 CartDao dao2=new CartDao(ConnectionProvider.getConnection());
							    boolean f2=dao2.deleteCartProducts(id);
							    int  productid = c.getProduct_id();
							    int cqty=Integer.parseInt(c.getProduct_qty());
							    int stock=0;
						try
						{
							
							Connection con =ConnectionProvider.getConnection();
							Statement st = con.createStatement();
							ResultSet rs =st.executeQuery("select * from producttb1 where product_id='"+productid+"' ");
							while(rs.next())
							{
								stock=rs.getInt(10);
							
							}
							
							stock= stock-cqty;
							
							
							st.executeUpdate("update producttb1 set  product_stock='"+stock+"' where  product_id='"+productid+"' ");
							
							
						}
						catch(Exception e)
						{
							e.printStackTrace();
						}
						session.setAttribute("succMsg", "Transaction Complete");
							    response.sendRedirect("Success.jsp");
						}
						else
						{
							pw.println("Error");
							
						}
					}

					
					}
					
					
					if (i > 0 && j > 0)
					{
						
						session.setAttribute("failedMsg", "Transaction Saved");
								response.sendRedirect("debit2.jsp");
					} 
					else 
					{
					
						session.setAttribute("failedMsg", "Error in Storing Data!!Please try again");
						response.sendRedirect("debit2.jsp");
					}
				} 
				else 
				{
					
					session.setAttribute("failedMsg", "Error in Fetching Data!!Please try again");
					response.sendRedirect("debit2.jsp");
				}
				
				
				
			}
				}
				else
				{
					session.setAttribute("failedMsg", "Something wrong on server...");
					response.sendRedirect("debit2.jsp");
				}
				
				
				
				
				
			}
			else
			{
				session.setAttribute("failedMsg", "Something wrong on server...");
				response.sendRedirect("debit2.jsp");
			}
				


		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
