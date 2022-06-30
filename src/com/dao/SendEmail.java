package com.dao;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.entities.SendUser;

public class SendEmail {
		
	public boolean sendEmail(SendUser user)
	{
		boolean test = false;
		
		String username = user.getMessage();
		String sub = user.getSubject();
		String toEmail = user.getEmail();
		final String fromEmail = "pppisal@gmail.com";
		final String password = "8875481904";
		String host ="smtp.gmail.com";
		try
		{
		
			Properties pr = new Properties();
			pr.setProperty("mail.smtp.host", host);
			pr.setProperty("mail.smtp.port", "465");
			pr.setProperty("mail.smtp.ssl.enable", "true");
			pr.setProperty("mail.smtp.auth", "true");
			
			//getSession
			
			Session session= Session.getInstance(pr, new Authenticator() {

				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					// TODO Auto-generated method stub
					return new PasswordAuthentication(fromEmail, password);
				}
					
			});
			
			session.setDebug(true);
			Message  mess = new MimeMessage(session);
			mess.setFrom(new InternetAddress(fromEmail));
			mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
			
		
			mess.setSubject(user.getSubject());
			
			mess.setText("Hello"+user.getName()+""+user.getMessage());
			
			//
			Transport.send(mess);
			test=true;
			
			
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		
		return test;
	}

}
