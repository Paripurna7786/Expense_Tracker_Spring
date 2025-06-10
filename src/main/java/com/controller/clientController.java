package com.controller;

import jakarta.servlet.http.HttpSession;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.controller.Dao.ClientDao;
import com.controller.Dao.ExpenseDao;
import com.entity.clientEntity;
import com.entity.expensEntity;

@Controller
public class clientController {
    @Autowired
    ClientDao clientdao;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    ExpenseDao expensedao;

    @GetMapping("clientSignUp")
    public String clientSignUp() {
        return "clientSignUp";
    }

    @PostMapping("clientsignuppost")
    public String clientsignuppost(clientEntity client, Model model, HttpSession session) {
        String encPwd = passwordEncoder.encode(client.getPass());
        client.setPass(encPwd);

        clientdao.AddClient(client);

        clientEntity loggedClient = clientdao.findByEmail(client.getEmail());
        if (loggedClient != null) {
            model.addAttribute("client", loggedClient);
            session.setAttribute("loggedClient", loggedClient);

            List<expensEntity> expenses = expensedao.getExpensesByClientId(loggedClient);
            model.addAttribute("expenses", expenses);
        }

        return "ClientManageHoPage";
    }

    @GetMapping("ClientLogin") 
    public String showLoginPage() {
        return "ClientLogin";
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
