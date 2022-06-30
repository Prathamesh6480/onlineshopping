package com.entities;

import java.sql.Timestamp;

public class UserEnquiry {
	
	private int enquiry_id;
	private String fullname;
	private String contact;
	private String email;
	private String subject;
	private String message;
	private Timestamp datetime;
	public int getEnquiry_id() {
		return enquiry_id;
	}
	public void setEnquiry_id(int enquiry_id) {
		this.enquiry_id = enquiry_id;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	
	
	public Timestamp getDatetime() {
		return datetime;
	}
	public void setDatetime(Timestamp datetime) {
		this.datetime = datetime;
	}
	public UserEnquiry(String fullname, String contact, String email, String subject, String message) {
		super();
		this.fullname = fullname;
		this.contact = contact;
		this.email = email;
		this.subject = subject;
		this.message = message;
	}
	
	
	
	
	public UserEnquiry(int enquiry_id, String fullname, String contact, String email, String subject, String message,
			Timestamp datetime) {
		super();
		this.enquiry_id = enquiry_id;
		this.fullname = fullname;
		this.contact = contact;
		this.email = email;
		this.subject = subject;
		this.message = message;
		this.datetime = datetime;
	}
	public UserEnquiry()
	{
		
	}
	

}
