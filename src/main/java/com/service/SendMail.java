package com.service;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpSession;

@Service
public class SendMail
{

	@Autowired
    private JavaMailSender mailSender;
	
	public void sendmail(String email)
	{
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("paripurnatiwari@gmail.com");
        message.setTo(email);
        message.setSubject("welcome mail");
        message.setText("welcome,we are happy to serve you");
        mailSender.send(message);
	}
	
	
	public void newsendmail(String email) {
        try {
           
            ClassPathResource resource = new ClassPathResource("templates/welcome-email.html");
            String htmlContent = new String(resource.getInputStream().readAllBytes(), StandardCharsets.UTF_8);


            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

            helper.setFrom("paripurnatiwari@gmail.com");
            helper.setTo(email);
            helper.setSubject("Welcome to Our Platform");
            helper.setText(htmlContent, true);
            System.out.println("Sending mail to: " + email);
            mailSender.send(message);
            System.out.println("Mail sent successfully to: " + email);
            mailSender.send(message);

        } catch (IOException e) {
            e.printStackTrace(); 
        } catch (MessagingException e) {
	
			e.printStackTrace();
		}
    }
	
	public void sendOtpMail(String email, HttpSession session) {
	    try {
	        int otp = 100000 + new Random().nextInt(900000);
	        String otpString = String.valueOf(otp);

	        session.setAttribute("otpString", otpString);

	        ClassPathResource resource = new ClassPathResource("templates/otp-email.html");
	        String htmlContent = new String(resource.getInputStream().readAllBytes(), StandardCharsets.UTF_8);
	        htmlContent = htmlContent.replace("${OTP}", otpString);

	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

	        helper.setFrom("paripurnatiwari@gmail.com");
	        helper.setTo(email);
	        helper.setSubject("Your OTP for Password Reset");
	        helper.setText(htmlContent, true);

	        mailSender.send(message);

	        System.out.println("Generated OTP for " + email + ": " + otpString);
	    } catch (IOException | MessagingException e) {
	        e.printStackTrace();
	    }
	}



	
}
