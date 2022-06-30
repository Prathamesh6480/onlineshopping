package com.dao;
import java.sql.*;
import java.util.*;

import com.entities.AddProduct;
import com.entities.Supplier;
import com.entities.ProductCategory;

public class ProductDao implements ProductDaoInter 
{
private Connection con;
	public ProductDao(Connection con)
	{
		this.con=con;
	}
	
	
	
	@Override
	public boolean addProduct(AddProduct ap) {
		boolean f=false;
		try
		{
			String sql="insert into producttb1(product_name,product_category,product_subcat,product_type,product_color,"
					+ "product_photo,product_size,product_specification,product_stock,"
					+ "product_mrp,purchase_price,sales_price,product_gst,gst_price,discount_price,product_discount,"
					+ "product_price,status)value (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt =this.con.prepareStatement(sql);
			pstmt.setString(1, ap.getProudct_name());
			pstmt.setString(2, ap.getProduct_category());
			
			pstmt.setString(3, ap.getProduct_subcat());
			pstmt.setString(4, ap.getProduct_type());
			pstmt.setString(5, ap.getProduct_color());
			pstmt.setString(6, ap.getProduct_photo());
			pstmt.setString(7, ap.getProduct_size());
			pstmt.setString(8, ap.getProduct_specification());
			pstmt.setString(9, ap.getProduct_stock());
			pstmt.setString(10, ap.getProduct_mrp());
			pstmt.setString(11, ap.getPurchase_price());
			pstmt.setString(12, ap.getSales_price());
			pstmt.setString(13, ap.getProduct_gst());
			pstmt.setString(14, ap.getGst_price());
			pstmt.setString(15, ap.getDiscount_price());
			pstmt.setString(16, ap.getProduct_discount());
			pstmt.setString(17, ap.getProduct_price());
			pstmt.setString(18, ap.getStatus());
			pstmt.executeUpdate();
			f=true;	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	@Override
	public List<AddProduct> getAllProduct(String category) {
	List<AddProduct> list = new ArrayList<AddProduct>();
	AddProduct ap=null;
	
		try
		{	
			String query;
			if(category!=null)
			{
				query="select * from producttb1 where product_type like '%"+category+"%' or  product_category like '%"+category+"%' ";
			}
			else
			{
				query = "select * from producttb1 ";
			}
			
			PreparedStatement pstmt =this.con.prepareStatement(query);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				ap=new AddProduct();
				ap.setProduct_id(rs.getInt(1));
				ap.setProudct_name(rs.getString(2));
				ap.setProduct_category(rs.getString(3));
				ap.setProduct_type(rs.getString(5));
				
				ap.setProduct_color(rs.getString(6));
				ap.setProduct_photo(rs.getString(7));
				ap.setProduct_size(rs.getString(8));
				ap.setProduct_price(rs.getString(18));
				ap.setStatus(rs.getString(19));
				list.add(ap);
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}		
		return list;
	}

	public List<AddProduct> getStockProduct(String category) {
		List<AddProduct> list = new ArrayList<AddProduct>();
		AddProduct ap=null;
	
			try
			{	
				String query;
				if(category!=null)
				{
					query="select * from producttb1 where product_id like '%"+category+"%' ";
				}
				else
				{
					
					query = "select * from producttb1 ";
				}
				
				
				PreparedStatement pstmt =this.con.prepareStatement(query);
				ResultSet rs=pstmt.executeQuery();
				while(rs.next())
				{
					ap=new AddProduct();
					ap.setProduct_id(rs.getInt(1));
				ap.setProduct_stock(rs.getString(10));
					ap.setProduct_mrp(rs.getString(11));
					ap.setPurchase_price(rs.getString(12));
					ap.setSales_price(rs.getString(13));
					ap.setProduct_gst(rs.getString(14));
					ap.setGst_price(rs.getString(15));
					ap.setDiscount_price(rs.getString(16));
					ap.setProduct_discount(rs.getString(17));
					ap.setProduct_price(rs.getString(18));
					list.add(ap);
				}
				
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}		
			return list;
		}
	
	
	
	public List<AddProduct> allStockProduct() {
		List<AddProduct> list = new ArrayList<AddProduct>();
		AddProduct ap=null;
	
			try
			{	
				String query = "select sum(product_stock) from producttb1";
			
				
				PreparedStatement pstmt =this.con.prepareStatement(query);
				ResultSet rs=pstmt.executeQuery();
				while(rs.next())
				{
					ap=new AddProduct();
				
					list.add(ap);
				}
				
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}		
			return list;
		}


	
	@Override
	public AddProduct getProductEditById(int id) {
		AddProduct ap=null;
		try
		{
			String query = "select * from producttb1 where product_id=?";
			PreparedStatement pstmt =this.con.prepareStatement(query);
			pstmt.setInt(1, id);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				ap=new AddProduct();
				ap.setProduct_id(rs.getInt(1));
				ap.setProudct_name(rs.getString(2));
				ap.setProduct_category(rs.getString(3));
				ap.setProduct_subcat(rs.getString(4));
				ap.setProduct_type(rs.getString(5));
				ap.setProduct_color(rs.getString(6));
				ap.setProduct_photo(rs.getString(7));
				ap.setProduct_size(rs.getString(8));
				ap.setProduct_specification(rs.getString(9));
				ap.setProduct_stock(rs.getString(10));
				ap.setProduct_mrp(rs.getString(11));
				ap.setPurchase_price(rs.getString(12));
				ap.setSales_price(rs.getString(13));
				ap.setProduct_gst(rs.getString(14));
				ap.setGst_price(rs.getString(15));
				ap.setDiscount_price(rs.getString(16));
				ap.setProduct_discount(rs.getString(17));
				ap.setProduct_price(rs.getString(18));
				ap.setStatus(rs.getString(19));
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ap;
	}

	@Override
	public boolean updateProduct(AddProduct ap) {
		boolean f=false;
		try
		{
			String query="update producttb1 set product_name=?, product_category=?,product_subcat=?,product_type=?,product_color=?,product_size=?,product_specification=?,product_stock=?,"
					+ "product_mrp=?,purchase_price=?,sales_price=?,product_gst=?,gst_price=?,discount_price=?,product_discount=?,product_price=?,"
					+ "status=? where product_id=?";
			PreparedStatement pstmt =this.con.prepareStatement(query);
			pstmt.setString(1, ap.getProudct_name());
			pstmt.setString(2, ap.getProduct_category());
			pstmt.setString(3, ap.getProduct_subcat());
			pstmt.setString(4, ap.getProduct_type());
			pstmt.setString(5, ap.getProduct_color());
			pstmt.setString(6, ap.getProduct_size());
			pstmt.setString(7, ap.getProduct_specification());
			pstmt.setString(8, ap.getProduct_stock());
			pstmt.setString(9, ap.getProduct_mrp());
			pstmt.setString(10, ap.getPurchase_price());
			pstmt.setString(11, ap.getSales_price());
			pstmt.setString(12, ap.getProduct_gst());
			pstmt.setString(13, ap.getGst_price());
			pstmt.setString(14, ap.getDiscount_price());
			pstmt.setString(15, ap.getProduct_discount());
			pstmt.setString(16, ap.getProduct_price());
			pstmt.setString(17, ap.getStatus());
			pstmt.setInt(18, ap.getProduct_id());
			int i=pstmt.executeUpdate();
			if(i==1)
			{
			f=true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean deleteProduct(int id)
	{
		boolean f=false;
		try
		{
			String query="delete from producttb1 where product_id=?";
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

	@Override
	public List<AddProduct> getNewProduct() {
		List<AddProduct> list=new ArrayList<AddProduct>();
		AddProduct ap=null;
		try
		{
			String query ="Select * from producttb1 ";
			PreparedStatement pstmt=this.con.prepareStatement(query);
		//	pstmt.setString(1, "22");
			ResultSet rs=pstmt.executeQuery();
			
			//int i=1;
			while(rs.next())//&& i<=4)
			{
				ap=new AddProduct();
				
				ap.setProduct_id(rs.getInt(1));
				ap.setProudct_name(rs.getString(2));
				ap.setProduct_category(rs.getString(3));
				ap.setProduct_subcat(rs.getString(4));
				ap.setProduct_type(rs.getString(5));
				ap.setProduct_photo(rs.getString(7));
				
				ap.setProduct_stock(rs.getString(10));
				ap.setProduct_mrp(rs.getString(11));
				ap.setDiscount_price(rs.getString(16));
				ap.setProduct_discount(rs.getString(17));
				ap.setProduct_price(rs.getString(18));
				ap.setStatus(rs.getString(19));	
				list.add(ap);
			//i++;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	
	public List<AddProduct> getTopProduct() {
		List<AddProduct> list=new ArrayList<AddProduct>();
		AddProduct ap=null;
		try
		{
			String query ="Select * from producttb1 LIMIT 4";
			PreparedStatement pstmt=this.con.prepareStatement(query);
		//	pstmt.setString(1, "22");
			ResultSet rs=pstmt.executeQuery();
			
			//int i=1;
			while(rs.next())//&& i<=4)
			{
				ap=new AddProduct();
				
				ap.setProduct_id(rs.getInt(1));
				ap.setProudct_name(rs.getString(2));
				ap.setProduct_category(rs.getString(3));
				ap.setProduct_subcat(rs.getString(4));
				ap.setProduct_type(rs.getString(5));
				ap.setProduct_photo(rs.getString(7));
				
				ap.setProduct_stock(rs.getString(10));
				ap.setProduct_mrp(rs.getString(11));
				ap.setDiscount_price(rs.getString(16));
				ap.setProduct_discount(rs.getString(17));
				ap.setProduct_price(rs.getString(18));
				ap.setStatus(rs.getString(19));	
				list.add(ap);
			//i++;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<AddProduct> getHeadphoneProduct() {
		List<AddProduct> list=new ArrayList<AddProduct>();
		AddProduct ap=null;
		try
		{
			String query ="Select * from producttb1 where product_type='Headphone' ";
			PreparedStatement pstmt=this.con.prepareStatement(query);
		//	pstmt.setString(1, "22");
			ResultSet rs=pstmt.executeQuery();
			
			//int i=1;
			while(rs.next())//&& i<=4)
			{
				ap=new AddProduct();
				
				ap.setProduct_id(rs.getInt(1));
				ap.setProudct_name(rs.getString(2));
				ap.setProduct_category(rs.getString(3));
				ap.setProduct_subcat(rs.getString(4));
				ap.setProduct_type(rs.getString(5));
				ap.setProduct_photo(rs.getString(7));
				
				ap.setProduct_stock(rs.getString(10));
				ap.setProduct_mrp(rs.getString(11));
				ap.setDiscount_price(rs.getString(16));
				ap.setProduct_discount(rs.getString(17));
				ap.setProduct_price(rs.getString(18));
				ap.setStatus(rs.getString(19));	
				list.add(ap);
			//i++;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<AddProduct> getLaptopProduct() {
		List<AddProduct> list=new ArrayList<AddProduct>();
		AddProduct ap=null;
		try
		{
			String query ="Select * from producttb1 where product_type='Laptop' ";
			PreparedStatement pstmt=this.con.prepareStatement(query);
		//	pstmt.setString(1, "22");
			ResultSet rs=pstmt.executeQuery();
			
			//int i=1;
			while(rs.next())//&& i<=4)
			{
				ap=new AddProduct();
				
				ap.setProduct_id(rs.getInt(1));
				ap.setProudct_name(rs.getString(2));
				ap.setProduct_category(rs.getString(3));
				ap.setProduct_subcat(rs.getString(4));
				ap.setProduct_type(rs.getString(5));
				ap.setProduct_photo(rs.getString(7));
				
				ap.setProduct_stock(rs.getString(10));
				ap.setProduct_mrp(rs.getString(11));
				ap.setDiscount_price(rs.getString(16));
				ap.setProduct_discount(rs.getString(17));
				ap.setProduct_price(rs.getString(18));
				ap.setStatus(rs.getString(19));	
				list.add(ap);
			//i++;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<AddProduct> getSmartphoneProduct() {
		List<AddProduct> list=new ArrayList<AddProduct>();
		AddProduct ap=null;
		try
		{
			String query ="Select * from producttb1 where product_type='Smartphone' ";
			PreparedStatement pstmt=this.con.prepareStatement(query);
		//	pstmt.setString(1, "22");
			ResultSet rs=pstmt.executeQuery();
			
			//int i=1;
			while(rs.next())//&& i<=4)
			{
				ap=new AddProduct();
				
				ap.setProduct_id(rs.getInt(1));
				ap.setProudct_name(rs.getString(2));
				ap.setProduct_category(rs.getString(3));
				ap.setProduct_subcat(rs.getString(4));
				ap.setProduct_type(rs.getString(5));
				ap.setProduct_photo(rs.getString(7));
				
				ap.setProduct_stock(rs.getString(10));
				ap.setProduct_mrp(rs.getString(11));
				ap.setDiscount_price(rs.getString(16));
				ap.setProduct_discount(rs.getString(17));
				ap.setProduct_price(rs.getString(18));
				ap.setStatus(rs.getString(19));	
				list.add(ap);
			//i++;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<AddProduct> getSmartwatchProduct() {
		List<AddProduct> list=new ArrayList<AddProduct>();
		AddProduct ap=null;
		try
		{
			String query ="Select * from producttb1 where product_type='smartwatch' ";
			PreparedStatement pstmt=this.con.prepareStatement(query);
		//	pstmt.setString(1, "22");
			ResultSet rs=pstmt.executeQuery();
			
			//int i=1;
			while(rs.next())//&& i<=4)
			{
				ap=new AddProduct();
				
				ap.setProduct_id(rs.getInt(1));
				ap.setProudct_name(rs.getString(2));
				ap.setProduct_category(rs.getString(3));
				ap.setProduct_subcat(rs.getString(4));
				ap.setProduct_type(rs.getString(5));
				ap.setProduct_photo(rs.getString(7));
				
				ap.setProduct_stock(rs.getString(10));
				ap.setProduct_mrp(rs.getString(11));
				ap.setDiscount_price(rs.getString(16));
				ap.setProduct_discount(rs.getString(17));
				ap.setProduct_price(rs.getString(18));
				ap.setStatus(rs.getString(19));	
				list.add(ap);
			//i++;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<AddProduct> getElectronicProduct() {
		List<AddProduct> list=new ArrayList<AddProduct>();
		AddProduct ap=null;
		try
		{
			String query ="Select * from producttb1 where product_subcat='Electronics'  ";
			PreparedStatement pstmt=this.con.prepareStatement(query);
		//	pstmt.setString(1, "22");
			ResultSet rs=pstmt.executeQuery();
			
			//int i=1;
			while(rs.next())//&& i<=4)
			{
				ap=new AddProduct();
				
				ap.setProduct_id(rs.getInt(1));
				ap.setProudct_name(rs.getString(2));
				ap.setProduct_category(rs.getString(3));
				ap.setProduct_subcat(rs.getString(4));
				ap.setProduct_type(rs.getString(5));
				ap.setProduct_photo(rs.getString(7));
				
				ap.setProduct_stock(rs.getString(10));
				ap.setProduct_mrp(rs.getString(11));
				ap.setDiscount_price(rs.getString(16));
				ap.setProduct_discount(rs.getString(17));
				ap.setProduct_price(rs.getString(18));
				ap.setStatus(rs.getString(19));	
				list.add(ap);
			//i++;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<AddProduct> getHomeDecorProduct() {
		List<AddProduct> list=new ArrayList<AddProduct>();
		AddProduct ap=null;
		try
		{
			String query ="Select * from producttb1 where product_category='Home Art'  ";
			PreparedStatement pstmt=this.con.prepareStatement(query);
		//	pstmt.setString(1, "22");
			ResultSet rs=pstmt.executeQuery();
			
			//int i=1;
			while(rs.next())//&& i<=4)
			{
				ap=new AddProduct();
				
				ap.setProduct_id(rs.getInt(1));
				ap.setProudct_name(rs.getString(2));
				ap.setProduct_category(rs.getString(3));
				ap.setProduct_subcat(rs.getString(4));
				ap.setProduct_type(rs.getString(5));
				ap.setProduct_photo(rs.getString(7));
				
				ap.setProduct_stock(rs.getString(10));
				ap.setProduct_mrp(rs.getString(11));
				ap.setDiscount_price(rs.getString(16));
				ap.setProduct_discount(rs.getString(17));
				ap.setProduct_price(rs.getString(18));
				ap.setStatus(rs.getString(19));	
				list.add(ap);
			//i++;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<AddProduct> getHomePlant() {
		List<AddProduct> list=new ArrayList<AddProduct>();
		AddProduct ap=null;
		try
		{
			String query ="Select * from producttb1 where product_category='Home Plant'  ";
			PreparedStatement pstmt=this.con.prepareStatement(query);
		//	pstmt.setString(1, "22");
			ResultSet rs=pstmt.executeQuery();
			
			//int i=1;
			while(rs.next())//&& i<=4)
			{
				ap=new AddProduct();
				
				ap.setProduct_id(rs.getInt(1));
				ap.setProudct_name(rs.getString(2));
				ap.setProduct_category(rs.getString(3));
				ap.setProduct_subcat(rs.getString(4));
				ap.setProduct_type(rs.getString(5));
				ap.setProduct_photo(rs.getString(7));
				
				ap.setProduct_stock(rs.getString(10));
				ap.setProduct_mrp(rs.getString(11));
				ap.setDiscount_price(rs.getString(16));
				ap.setProduct_discount(rs.getString(17));
				ap.setProduct_price(rs.getString(18));
				ap.setStatus(rs.getString(19));	
				list.add(ap);
			//i++;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	
	public List<AddProduct> getAgri() {
		List<AddProduct> list=new ArrayList<AddProduct>();
		AddProduct ap=null;
		try
		{
			String query ="Select * from producttb1 where product_category='Agro'  ";
			PreparedStatement pstmt=this.con.prepareStatement(query);
		//	pstmt.setString(1, "22");
			ResultSet rs=pstmt.executeQuery();
			
			//int i=1;
			while(rs.next())//&& i<=4)
			{
				ap=new AddProduct();
				
				ap.setProduct_id(rs.getInt(1));
				ap.setProudct_name(rs.getString(2));
				ap.setProduct_category(rs.getString(3));
				ap.setProduct_subcat(rs.getString(4));
				ap.setProduct_type(rs.getString(5));
				ap.setProduct_photo(rs.getString(7));
				
				ap.setProduct_stock(rs.getString(10));
				ap.setProduct_mrp(rs.getString(11));
				ap.setDiscount_price(rs.getString(16));
				ap.setProduct_discount(rs.getString(17));
				ap.setProduct_price(rs.getString(18));
				ap.setStatus(rs.getString(19));	
				list.add(ap);
			//i++;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}



	@Override
	public List<AddProduct> getProductBySearch(String ch) {
		// TODO Auto-generated method stub
		List<AddProduct> list=new ArrayList<AddProduct>();
		AddProduct ap=null;
		try
		{
			String query ="Select * from producttb1 where product_name like ? or product_category like ? or product_subcat like ? or product_type like ?";
			PreparedStatement pstmt=this.con.prepareStatement(query);
       	pstmt.setString(1, "%"+ch+"%");
       	pstmt.setString(2, "%"+ch+"%");
       	pstmt.setString(3, "%"+ch+"%");
       	pstmt.setString(4, "%"+ch+"%");
			ResultSet rs=pstmt.executeQuery();
			
			//int i=1;
			while(rs.next())//&& i<=4)
			{
				ap=new AddProduct();
				
				ap.setProduct_id(rs.getInt(1));
				ap.setProudct_name(rs.getString(2));
				ap.setProduct_category(rs.getString(3));
				ap.setProduct_subcat(rs.getString(4));
				ap.setProduct_type(rs.getString(5));
				ap.setProduct_photo(rs.getString(7));
				
				ap.setProduct_stock(rs.getString(10));
				ap.setProduct_mrp(rs.getString(11));
				ap.setDiscount_price(rs.getString(16));
				ap.setProduct_discount(rs.getString(17));
				ap.setProduct_price(rs.getString(18));
				ap.setStatus(rs.getString(19));	
				list.add(ap);
			//i++;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	
}
