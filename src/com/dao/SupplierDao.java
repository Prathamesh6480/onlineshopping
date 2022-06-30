package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entities.AddProduct;
import com.entities.ProductCategory;
import com.entities.Supplier;

public class SupplierDao {
	
	private Connection con;
	public SupplierDao(Connection con)
	{
		this.con=con;
	}
	public boolean saveSupplierData(Supplier supplier)
	{
		boolean f =false;
		//Category to ------>  database
		try
		{
		String query="insert into supplier(supplier_name,company,typeoffirm,statusofcompany,email,country,state,address1,address2,contact,zip,panno)value(?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt=this.con.prepareStatement(query);
		pstmt.setString(1, supplier.getSupplier_name());
		pstmt.setString(2, supplier.getCompany());
		pstmt.setString(3, supplier.getTypeoffirm());
		pstmt.setString(4, supplier.getStatusofcompany());
		pstmt.setString(5, supplier.getEmail());
		pstmt.setString(6, supplier.getCountry());
		pstmt.setString(7, supplier.getState());
		pstmt.setString(8, supplier.getAddress1());
		pstmt.setString(9, supplier.getAddress2());
		pstmt.setString(10, supplier.getContact());
		pstmt.setString(11, supplier.getZip());
		pstmt.setString(12, supplier.getPanno());
		
		pstmt.executeUpdate();
		f=true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	

	
	
	//dffffff List Category product
		public List<Supplier> getAllSupplier()
		{
			List<Supplier> list = new ArrayList<>();
			try
			{
				String query="select * from supplier";
				PreparedStatement pstmt = this.con.prepareStatement(query);
				ResultSet rs=pstmt.executeQuery();
				while(rs.next())
				{			
					int supplier_id=rs.getInt("supplier_id");
					String supplier_name=rs.getString("supplier_name");
					String company=rs.getString("company");
					String typeoffirm=rs.getString("typeoffirm");
					String statusofcompany=rs.getString("statusofcompany");
					String email=rs.getString("email");
					String country=rs.getString("country");
					String state=rs.getString("state");
					String address1=rs.getString("address1");
					String address2=rs.getString("address2");
					String contact=rs.getString("contact");
					String zip=rs.getString("zip");
					String panno=rs.getString("panno");
				
					Supplier supplier= new Supplier(supplier_id,supplier_name,company,typeoffirm,statusofcompany,email,country,state,address1,address2,contact,zip,panno);
					list.add(supplier);			
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return list;
		}

		
		public List<Supplier> getAllsSupplier()
		{
			List<Supplier> list = new ArrayList<>();
			try
			{
				String query="select supplier_id,supplier_name from supplier";
				PreparedStatement pstmt = this.con.prepareStatement(query);
				ResultSet rs=pstmt.executeQuery();
				while(rs.next())
				{			
					Supplier supplier= new Supplier();
					supplier.setSupplier_id(rs.getInt("supplier_id"));;
					supplier.setSupplier_name(rs.getString("supplier_name"));
					list.add(supplier);			
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return list;
		}

		
		
	
	public Supplier getSupplierEditById(int id)
	
	{
		Supplier supplier=null;
		try
		{
			String query = "select * from supplier where supplier_id=?";
			PreparedStatement pstmt =this.con.prepareStatement(query);
			pstmt.setInt(1, id);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				supplier=new Supplier();
				supplier.setSupplier_id(rs.getInt(1));
				supplier.setSupplier_name(rs.getString(2));
				supplier.setCompany(rs.getString(3));
				supplier.setTypeoffirm(rs.getString(4));
				supplier.setStatusofcompany(rs.getString(5));
				supplier.setEmail(rs.getString(6));
				supplier.setCountry(rs.getString(7));
				supplier.setState(rs.getString(8));
				supplier.setAddress1(rs.getString(9));
				supplier.setAddress2(rs.getString(10));
				supplier.setContact(rs.getString(11));
				supplier.setZip(rs.getString(12));
				supplier.setPanno(rs.getString(13));
				
			
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return supplier;
	}
	public boolean updateSupplier(Supplier supplier)
	{
		boolean f=false;
		try
		{
			String query="update supplier set supplier_name=?,company=?, typeoffirm=?, statusofcompany=?, email=?, country=?, state=?, address1=?, address2=?, contact=?, zip=?, panno=? where supplier_id=?";
			PreparedStatement pstmt =this.con.prepareStatement(query);
			pstmt.setString(1, supplier.getSupplier_name());
			pstmt.setString(2, supplier.getCompany());
			pstmt.setString(3, supplier.getTypeoffirm());
		
			pstmt.setString(4, supplier.getStatusofcompany());
			pstmt.setString(5, supplier.getEmail());
			pstmt.setString(6, supplier.getCountry());
			pstmt.setString(7, supplier.getState());
			pstmt.setString(8, supplier.getAddress1());
			pstmt.setString(9, supplier.getAddress2());
			pstmt.setString(10, supplier.getContact());
			pstmt.setString(11, supplier.getZip());
			pstmt.setString(12, supplier.getPanno());			
			pstmt.setInt(13, supplier.getSupplier_id());
			int i=pstmt.executeUpdate();
			if(i==1)
			{
			f=true;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return f;
	}
	
	public boolean deleteSupplier(int id)
	{
		boolean f=false;
		try
		{
			String query="delete from supplier where supplier_id=?";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			pstmt.setInt(1, id);
			int i=pstmt.executeUpdate();
			if(i==1)
			{
				f=true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}

	
}
