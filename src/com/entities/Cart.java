package com.entities;

public class Cart {
	
	private int cart_id;
	private int product_id;
	private int userid;
	private String product_name;
	private String product_image;
	private String product_qty;
	
	
	public Cart(int cart_id, int product_id, int userid, String product_name, String product_image, String product_qty,
			Double product_mrp, Double sales_price, String gst, String product_discount, Double selling_price,
			Double total_price) {
		super();
		this.cart_id = cart_id;
		this.product_id = product_id;
		this.userid = userid;
		this.product_name = product_name;
		this.product_image = product_image;
		this.product_qty = product_qty;
		this.product_mrp = product_mrp;
		this.sales_price = sales_price;
		this.gst = gst;
		this.product_discount = product_discount;
		this.selling_price = selling_price;
		this.total_price = total_price;
	}



	public int getCart_id() {
		return cart_id;
	}



	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}



	public int getProduct_id() {
		return product_id;
	}



	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}



	public int getUserid() {
		return userid;
	}



	public void setUserid(int userid) {
		this.userid = userid;
	}



	public String getProduct_name() {
		return product_name;
	}



	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}



	public String getProduct_image() {
		return product_image;
	}



	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}



	public String getProduct_qty() {
		return product_qty;
	}



	public void setProduct_qty(String product_qty) {
		this.product_qty = product_qty;
	}



	public Double getProduct_mrp() {
		return product_mrp;
	}



	public void setProduct_mrp(Double product_mrp) {
		this.product_mrp = product_mrp;
	}



	public Double getSales_price() {
		return sales_price;
	}



	public void setSales_price(Double sales_price) {
		this.sales_price = sales_price;
	}



	public String getGst() {
		return gst;
	}



	public void setGst(String gst) {
		this.gst = gst;
	}



	public String getProduct_discount() {
		return product_discount;
	}



	public void setProduct_discount(String product_discount) {
		this.product_discount = product_discount;
	}



	public Double getSelling_price() {
		return selling_price;
	}



	public void setSelling_price(Double selling_price) {
		this.selling_price = selling_price;
	}



	public Double getTotal_price() {
		return total_price;
	}



	public void setTotal_price(Double total_price) {
		this.total_price = total_price;
	}



	private Double product_mrp;
	private Double sales_price;
	private String gst;
	private String product_discount;
	private Double selling_price;
	private Double total_price;
	
	

	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
