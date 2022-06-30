package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDateTime;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.db;

@WebServlet("/transfer")
public class transfer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public transfer() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();

		int account_id = Integer.parseInt(request.getParameter("account_id"));
		String accnoTo1 = request.getParameter("accnoTo1");
		String accnoTo2 = request.getParameter("accnoTo2");
		double transferAmt = Double.parseDouble(request.getParameter("transferAmt"));
		String naration = request.getParameter("naration");
		String ifsc = request.getParameter("ifsc"); // Branch Table
		String first_name = request.getParameter("first_name"); // Customer Table
		double acc_balFrom = 0, acc_balTo = 0;
		String accNoFrom = "", ifscTo="", first_nameTo="";
		int accountIdTo = 0, custIdTo=0, branchIdTo=0;

		HttpSession hs = request.getSession();
		hs.setAttribute("account_id", account_id);

		String getBalFrom = "select balance from account where id = " + account_id;
		db.select(getBalFrom);
		try {
			if (db.rs.next()) {
				acc_balFrom = db.rs.getDouble(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		String getAccNoFrom = "select account_no from account where id = " + account_id;
		db.select(getAccNoFrom);
		try {
			if (db.rs.next()) {
				accNoFrom = db.rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

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
		
		
		if(!first_name.equals(first_nameTo))
		{
			RequestDispatcher rd = request.getRequestDispatcher("transferPage.jsp");
			pw.print("Account Holder Name Does Not Match...");
			rd.include(request, response);
		}
		else if(!ifsc.equals(ifscTo))
		{
			RequestDispatcher rd = request.getRequestDispatcher("transferPage.jsp");
			pw.print("IFSC Does Not Match...");
			rd.include(request, response);
		}
		else if (acc_balFrom <= transferAmt) 
		{
			RequestDispatcher rd = request.getRequestDispatcher("transferPage.jsp");
			pw.print("Sorry!!!Insufficient Balance in Account...");
			rd.include(request, response);
		}
		else if (!accnoTo1.equals(accnoTo2)) 
		{
			RequestDispatcher rd = request.getRequestDispatcher("transferPage.jsp");
			pw.print("Account Numbers Do Not Match...");
			rd.include(request, response);
		} 
		else if (transferAmt >= 40000) 
		{
			RequestDispatcher rd = request.getRequestDispatcher("transferPage.jsp");
			pw.print("Tranfer Limit Exceeded(40,000)");
			rd.include(request, response);
		} 
		else 
		{
			acc_balFrom -= transferAmt;
			acc_balTo += transferAmt;

			String creditNaration = "From AccNo:" + accNoFrom+" For "+naration;
			String debitNaration = "To AccNo:" + accnoTo1+" For "+naration;

			String insertTrnFrom = "insert into transaction values(" + 0 + "," + account_id + ",'" + LocalDateTime.now()
					+ "'," + accNoFrom + "," + 1 + "," + 2 + "," + transferAmt + ",'" + debitNaration + "',"
					+ acc_balFrom + ")";
			int i = db.insert(insertTrnFrom);

			String insertTrnTo = "insert into transaction values(" + 0 + "," + accountIdTo + ",'" + LocalDateTime.now()
					+ "'," + accnoTo1 + "," + 2 + "," + 2 + "," + transferAmt + ",'" + creditNaration + "'," + acc_balTo
					+ ")";
			int j = db.insert(insertTrnTo);

			if (i > 0 && j > 0) 
			{
				String updateBalFrom = "update account set balance = " + acc_balFrom + " where id = " + account_id;
				i = db.update(updateBalFrom);
				
				String updateBalTo = "update account set balance = " + acc_balTo + " where id = " + accountIdTo;
				j = db.update(updateBalTo);
				
				if (i > 0 && j > 0)
				{
					RequestDispatcher rd = request.getRequestDispatcher("completedTransfer.jsp");
					pw.print("Transaction Saved");
					rd.include(request, response);
				} 
				else 
				{
					RequestDispatcher rd = request.getRequestDispatcher("transfer.jsp");
					pw.print("Error in Storing Data!!Please try again");
					rd.include(request, response);
				}
			} 
			else 
			{
				RequestDispatcher rd = request.getRequestDispatcher("transfer.jsp");
				pw.print("Error in Fetching Data!!Please try again");
				rd.include(request, response);
			}
		}
	}
}
