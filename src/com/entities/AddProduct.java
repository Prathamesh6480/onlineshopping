package com.entities;

public class AddProduct {
	
	private int product_id;
	private String proudct_name;
	private String product_category;
	private String product_subcat;
	private String product_type;
	private String product_photo;
	private String product_color;
	private String product_size;
	private String product_specification;
	private String product_stock;
	private String product_mrp;
	private String purchase_price;
	private String sales_price;
	private String product_gst;
	private String gst_price;
	private String discount_price;
	private String product_discount;
	private String product_price;
	private String status;
	

	public AddProduct() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getProduct_id() {
		return product_id;
	}


	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}


	public String getProudct_name() {
		return proudct_name;
	}


	public void setProudct_name(String proudct_name) {
		this.proudct_name = proudct_name;
	}


	public String getProduct_category() {
		return product_category;
	}


	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}


	public String getProduct_subcat() {
		return product_subcat;
	}


	public void setProduct_subcat(String product_subcat) {
		this.product_subcat = product_subcat;
	}


	
	public String getProduct_type() {
		return product_type;
	}


	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}


	public String getProduct_photo() {
		return product_photo;
	}


	public void setProduct_photo(String product_photo) {
		this.product_photo = product_photo;
	}


	public String getProduct_color() {
		return product_color;
	}


	public void setProduct_color(String product_color) {
		this.product_color = product_color;
	}


	public String getProduct_size() {
		return product_size;
	}


	public void setProduct_size(String product_size) {
		this.product_size = product_size;
	}


	public String getProduct_specification() {
		return product_specification;
	}


	public void setProduct_specification(String product_specification) {
		this.product_specification = product_specification;
	}


	public String getProduct_stock() {
		return product_stock;
	}


	public void setProduct_stock(String product_stock) {
		this.product_stock = product_stock;
	}


	public String getProduct_mrp() {
		return product_mrp;
	}


	public void setProduct_mrp(String product_mrp) {
		this.product_mrp = product_mrp;
	}


	public String getPurchase_price() {
		return purchase_price;
	}


	public void setPurchase_price(String purchase_price) {
		this.purchase_price = purchase_price;
	}


	public String getSales_price() {
		return sales_price;
	}


	public void setSales_price(String sales_price) {
		this.sales_price = sales_price;
	}


	public String getProduct_gst() {
		return product_gst;
	}


	public void setProduct_gst(String product_gst) {
		this.product_gst = product_gst;
	}


	public String getGst_price() {
		return gst_price;
	}


	public void setGst_price(String gst_price) {
		this.gst_price = gst_price;
	}


	public String getDiscount_price() {
		return discount_price;
	}


	public void setDiscount_price(String discount_price) {
		this.discount_price = discount_price;
	}


	public String getProduct_discount() {
		return product_discount;
	}


	public void setProduct_discount(String product_discount) {
		this.product_discount = product_discount;
	}


	public String getProduct_price() {
		return product_price;
	}


	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public AddProduct(String proudct_name, String product_category, String product_subcat, String product_type,
			String product_photo, String product_color, String product_size, String product_specification,
			String product_stock, String product_mrp, String purchase_price, String sales_price, String product_gst,
			String gst_price, String discount_price, String product_discount, String product_price, String status) {
		super();
		this.proudct_name = proudct_name;
		this.product_category = product_category;
		this.product_subcat = product_subcat;
		this.product_type = product_type;
		this.product_photo = product_photo;
		this.product_color = product_color;
		this.product_size = product_size;
		this.product_specification = product_specification;
		this.product_stock = product_stock;
		this.product_mrp = product_mrp;
		this.purchase_price = purchase_price;
		this.sales_price = sales_price;
		this.product_gst = product_gst;
		this.gst_price = gst_price;
		this.discount_price = discount_price;
		this.product_discount = product_discount;
		this.product_price = product_price;
		this.status = status;
	}




	
}
