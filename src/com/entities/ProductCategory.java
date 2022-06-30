package com.entities;
import java.sql.*;

public class ProductCategory {
	private int categoryid;
	private int supplierid;
	private String suppliername;
	private String categoryname;
	
	public ProductCategory()
	{
		
	}

	public int getCategoryid() {
		return categoryid;
	}

	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}

	public int getSupplierid() {
		return supplierid;
	}

	public void setSupplierid(int supplierid) {
		this.supplierid = supplierid;
	}

	public String getSuppliername() {
		return suppliername;
	}

	public void setSuppliername(String suppliername) {
		this.suppliername = suppliername;
	}

	public String getCategoryname() {
		return categoryname;
	}

	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}

	public ProductCategory(int categoryid, int supplierid, String suppliername, String categoryname) {
		super();
		this.categoryid = categoryid;
		this.supplierid = supplierid;
		this.suppliername = suppliername;
		this.categoryname = categoryname;
	}

	public ProductCategory(int supplierid, String suppliername, String categoryname) {
		super();
		this.supplierid = supplierid;
		this.suppliername = suppliername;
		this.categoryname = categoryname;
	}

}
