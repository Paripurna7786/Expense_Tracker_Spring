package com.controller;

import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.controller.Dao.ClientDao;
import com.controller.Dao.ExpenseDao;
import com.entity.clientEntity;
import com.entity.expensEntity;
import com.service.SendMail;

@Controller
public class clientController {
    @Autowired
    ClientDao clientdao;

    
    @Autowired
    SendMail mail;
    
    @Autowired
	Cloudinary cloudinary;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    ExpenseDao expensedao;

    @GetMapping("clientSignUp")
    public String clientSignUp() {
        return "clientSignUp";
    }

    @PostMapping("clientsignuppost")
    public String clientsignuppost(clientEntity client, Model model, HttpSession session, @RequestParam MultipartFile image) {

        // Check if client already exists
        if (clientdao.findByEmail(client.getEmail()) != null)
        {
            model.addAttribute("error", "Email already exists.");
            return "clientSignUp";
        }

        try 
        {
            // Upload image to Cloudinary
            Map result = cloudinary.uploader().upload(image.getBytes(), ObjectUtils.emptyMap());
            String imagePath = result.get("secure_url").toString();
            client.setProfilepicpath(imagePath);
        } catch (IOException e) 
        {
            e.printStackTrace();
            model.addAttribute("error", "Image upload failed.");
            return "clientSignUp";
        }

        // Encrypt password
        String encPwd = passwordEncoder.encode(client.getPass());
        client.setPass(encPwd);

        // Save new client
        clientEntity newClient = clientdao.AddClient(client);

        // Set in session and model
        session.setAttribute("loggedClient", newClient);
        model.addAttribute("client", newClient);

        // Fetch and set expenses
        List<expensEntity> expenses = expensedao.getExpensesByClientId(newClient);
        model.addAttribute("expenses", expenses);

        return "ClientManageHoPage";
    }

    @GetMapping("ClientLogin") 
    public String showLoginPage() {
        return "ClientLogin";
    }

    @GetMapping("Forgetpasswordpost")
    public String ShowForgetPssword()
    {
    	
    	return "forgetpassword";
    }
    
    @PostMapping("verifyOTP")
    public String verifyotp(@RequestParam("otp") int otp, HttpSession session) {
        String storedOtp = (String) session.getAttribute("otpString");

        if (storedOtp != null && storedOtp.equals(String.valueOf(otp))) {
            System.out.println("OTP verified: " + otp);
            
            return "setnewpassword";
        } else {
            System.out.println("OTP incorrect: " + otp);
            return "EnterOtp";
        }
    }
    
    @PostMapping("updatePassword")
    public String updatePassword(@RequestParam String newPassword, HttpSession session) {
        String email = (String) session.getAttribute("email");

        if (email != null) {
           
            String encPwd = passwordEncoder.encode(newPassword);

           
            clientdao.updatePassword(email, encPwd);

            return "ClientLogin"; 
        }

        return "setnewpassword";
    }

    
    @PostMapping("sendotp")
    public String Sendotp(clientEntity client, HttpSession session) {
        clientEntity loggedClient = clientdao.findByEmail(client.getEmail());

        if (loggedClient == null) {
            return "clientSignUp"; 
        }

        if (client.getEmail().trim().equalsIgnoreCase(loggedClient.getEmail().trim())) {
            session.setAttribute("email", client.getEmail()); 
            mail.sendOtpMail(client.getEmail(), session);
            return "EnterOtp";
        } else {
            return "clientSignUp";
        }
    }

    @PostMapping("loginpost")
    public String loginpost(clientEntity client, Model model, HttpSession session) 
    {
        clientEntity loggedClient = clientdao.findByEmail(client.getEmail());
        
        System.out.println("hereeeee");
        
        if (loggedClient != null)
        {
        	
            System.out.println("here4");
            
            boolean ans = passwordEncoder.matches(client.getPass(), loggedClient.getPass());
            System.out.println("here");
            
            if (ans) 
            {
                model.addAttribute("client", loggedClient);
                
                session.setAttribute("loggedClient", loggedClient);
                System.out.println("here2");
                
                List<expensEntity> expenses = expensedao.getExpensesByClientId(loggedClient);
                model.addAttribute("expenses", expenses);
                
                System.out.println("here3");
                return "ClientManageHoPage";
            }
        }

        return "ClientLogin";
    }
}
