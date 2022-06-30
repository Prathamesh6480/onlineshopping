package com.entities;
import java.sql.*;
public class UserRegister {
	
	private int id;
	private String fname;
	private String lname;
	private String email;
	private String mobileno;
	private String password;
	private Timestamp datetime;
	
	private String address;
	private String city;
	private String state;
	private String zip;
	
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public UserRegister(int id, String fname, String lname, String email, String mobileno, String password,
			Timestamp datetime) {
	
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.mobileno = mobileno;
		this.password = password;
		this.datetime = datetime;
	}
	public UserRegister() {
	
	}
	public UserRegister(String fname, String lname, String email, String mobileno, String password) {
		
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.mobileno = mobileno;
		this.password = password;
	}
	
	//getters and setters
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobileno() {
		return mobileno;
	}
	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Timestamp getDatetime() {
		return datetime;
	}
	public void setDatetime(Timestamp datetime) {
		this.datetime = datetime;
	}
}