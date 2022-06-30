package com.entities;

public class Supplier {
	private int supplier_id;
	private String supplier_name;
	private String company;
	private String typeoffirm;
	private String statusofcompany;
	private String email;
	private String country;
	private String state;
	private String address1;
	private String address2;
	private String contact;
	private String zip;
	private String panno;
	
	
	public Supplier(String supplier_name,String company, String typeoffirm, String statusofcompany, String email, String country,
			String state, String address1, String address2, String contact, String zip, String panno ) {
		super();
		this.supplier_name = supplier_name;
		this.company = company;
		this.typeoffirm = typeoffirm;
		this.statusofcompany = statusofcompany;
		this.email = email;
		this.country = country;
		this.state = state;
		this.address1 = address1;
		this.address2 = address2;
		this.contact = contact;
		this.zip = zip;
		this.panno = panno;
		
	}

	public Supplier(int supplier_id, String supplier_name,String company, String typeoffirm, String statusofcompany, String email,
			String country, String state, String address1, String address2, String contact, String zip, String panno) {
		super();
		this.supplier_id = supplier_id;
		this.supplier_name = supplier_name;
		this.company = company;
		this.typeoffirm = typeoffirm;
		this.statusofcompany = statusofcompany;
		this.email = email;
		this.country = country;
		this.state = state;
		this.address1 = address1;
		this.address2 = address2;
		this.contact = contact;
		this.zip = zip;
		this.panno = panno;
	}

	public int getSupplier_id() {
		return supplier_id;
	}

	public void setSupplier_id(int supplier_id) {
		this.supplier_id = supplier_id;
	}

	public String getSupplier_name() {
		return supplier_name;
	}

	public void setSupplier_name(String supplier_name) {
		this.supplier_name = supplier_name;
	}
	
	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getTypeoffirm() {
		return typeoffirm;
	}

	public void setTypeoffirm(String typeoffirm) {
		this.typeoffirm = typeoffirm;
	}

	public String getStatusofcompany() {
		return statusofcompany;
	}

	public void setStatusofcompany(String statusofcompany) {
		this.statusofcompany = statusofcompany;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getState() {
		return state;
	}
	
	public void setState(String state) {
		this.state = state;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getPanno() {
		return panno;
	}
	public void setPanno(String panno) {
		this.panno = panno;
	}


	public Supplier() {
		
	}

	
	
	
}
