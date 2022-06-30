package com.dao;

import java.sql.*;
import java.util.*;

import com.entities.Supplier;
import com.entities.ProductCategory;

public class CategoryDao {
	
	private Connection con;
	public CategoryDao(Connection con)
	{
		this.con=con;
	}
	
	//subCategory save 
		public boolean saveCategory(ProductCategory sc)
		{
			boolean f =false;
			//Category to ------>  database
			try
			{
			String query="insert into product_category(supplier_id,supplier_name,category_name)value(?,?,?)";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			pstmt.setInt(1, sc.getSupplierid());
			pstmt.setString(2, sc.getSuppliername());
			pstmt.setString(3, sc.getCategoryname());
			pstmt.executeUpdate();
			f=true;
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return f;
		}
		
		
		public HashSet<ProductCategory> getOneCategory()
		{
			HashSet<ProductCategory> set = new HashSet<>();
			try
			{
				String query="select DISTINCT category_name from product_category";
				PreparedStatement pstmt = this.con.prepareStatement(query);
				
				ResultSet rs=pstmt.executeQuery();
				  Iterator<ProductCategory> itr=set.iterator();  
				while(rs.next())
				{	
			
					ProductCategory pc = new ProductCategory();
					
					pc.setCategoryname(rs.getString("category_name"));
					set.add(pc);
						
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return set;
		}
		
		
		
		//dffffff List SubCategory product
				public List<ProductCategory> getAllCategory()
				{
					List<ProductCategory> list = new ArrayList<>();
					try
					{
						String query="select * from product_category";
						PreparedStatement pstmt = this.con.prepareStatement(query);
						ResultSet rs=pstmt.executeQuery();
						while(rs.next())
						{			
							int categoryid=rs.getInt("category_id");
							int supplierid=rs.getInt("supplier_id");
							String suppliername=rs.getString("supplier_name");
							String categoryname=rs.getString("category_name");
							ProductCategory cat= new ProductCategory(categoryid,supplierid,suppliername,categoryname);
							list.add(cat);			
						}
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
					return list;
				}
				
				
				
				public boolean updateCategory(ProductCategory category)
				{
					boolean f=false;
					try
					{
						String query="update product_category set supplier_id=?, supplier_name=?, categoryname=? where category_id=?";
						PreparedStatement pstmt =this.con.prepareStatement(query);
						pstmt.setInt(1, category.getSupplierid());
						pstmt.setString(2, category.getSuppliername());
						pstmt.setString(3, category.getCategoryname());
						pstmt.setInt(4, category.getCategoryid());
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
				
			
				public boolean deleteCategory(int id)
				{
					boolean f=false;
					try
					{
						String query="delete from product_category where category_id=?";
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

