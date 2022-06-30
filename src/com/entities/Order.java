package com.entities;

import java.sql.Timestamp;

public class Order {
	
	private int orderid;
	private int userid;
	private int productid;
	private String productname;
	private String quantity;
	private String productmrp;
	private String salesprice;
	private String gst;
	private String discount;
	private String productprice;
	private String totalprice;
	
	private String firstname;
	private String lastname;
	private String email;
	private String mobile;
	private String address;
	private String district;
	private String city;
	private String state;
	private String zip;
	private String paymentmode;
	private String status;
	private Timestamp datetime1;
	private String datetime2;
	
	
	
	
	public Order() {
	
	}




	public int getOrderid() {
		return orderid;
	}




	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}




	public int getUserid() {
		return userid;
	}




	public void setUserid(int userid) {
		this.userid = userid;
	}




	public int getProductid() {
		return productid;
	}




	public void setProductid(int productid) {
		this.productid = productid;
	}




	public String getProductname() {
		return productname;
	}




	public void setProductname(String productname) {
		this.productname = productname;
	}




	public String getQuantity() {
		return quantity;
	}




	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}




	public String getProductmrp() {
		return productmrp;
	}




	public void setProductmrp(String productmrp) {
		this.productmrp = productmrp;
	}




	public String getSalesprice() {
		return salesprice;
	}




	public void setSalesprice(String salesprice) {
		this.salesprice = salesprice;
	}




	public String getGst() {
		return gst;
	}




	public void setGst(String gst) {
		this.gst = gst;
	}




	public String getDiscount() {
		return discount;
	}




	public void setDiscount(String discount) {
		this.discount = discount;
	}




	public String getProductprice() {
		return productprice;
	}




	public void setProductprice(String productprice) {
		this.productprice = productprice;
	}




	public String getTotalprice() {
		return totalprice;
	}




	public void setTotalprice(String totalprice) {
		this.totalprice = totalprice;
	}




	public String getFirstname() {
		return firstname;
	}




	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}




	public String getLastname() {
		return lastname;
	}




	public void setLastname(String lastname) {
		this.lastname = lastname;
	}




	public String getEmail() {
		return email;
	}




	public void setEmail(String email) {
		this.email = email;
	}




	public String getMobile() {
		return mobile;
	}




	public void setMobile(String mobile) {
		this.mobile = mobile;
	}




	public String getAddress() {
		return address;
	}




	public void setAddress(String address) {
		this.address = address;
	}




	public String getDistrict() {
		return district;
	}




	public void setDistrict(String district) {
		this.district = district;
	}




	public String getCity() {
		return city;
	}




	public void setCity(String city) {
		this.city = city;
	}




	public String getState() {
		return state;
	}




	public void setState(String state) {
		this.state = state;
	}




	public String getZip() {
		return zip;
	}




	public void setZip(String zip) {
		this.zip = zip;
	}




	public String getPaymentmode() {
		return paymentmode;
	}




	public void setPaymentmode(String paymentmode) {
		this.paymentmode = paymentmode;
	}




	public String getStatus() {
		return status;
	}




	public void setStatus(String status) {
		this.status = status;
	}




	public Timestamp getDatetime1() {
		return datetime1;
	}




	public void setDatetime1(Timestamp datetime1) {
		this.datetime1 = datetime1;
	}




	public String getDatetime2() {
		return datetime2;
	}




	public void setDatetime2(String datetime2) {
		this.datetime2 = datetime2;
	}



}
