package com.controller;
import jakarta.servlet.http.HttpSession;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;


import com.controller.Dao.ClientDao;
import com.controller.Dao.ExpenseDao;
import com.entity.clientEntity;
import com.entity.expensEntity;

@Controller
public class clientController 
{
	@Autowired
	
	ClientDao clientdao;
	@Autowired
	ExpenseDao expensedao;
	@GetMapping("clientSignUp")
	public String clientSignUp()
	{
		return "clientSignUp";
	}
	
	@PostMapping("clientsignuppost")
	public String clientsignuppost(clientEntity client,Model model,HttpSession session) {
		
		
		clientdao.AddClient(client);
		 List<clientEntity> loggedInClients = clientdao.clientLogin(client.getEmail(), client.getPass());

		    if (!loggedInClients.isEmpty()) {
		        clientEntity loggedClient = loggedInClients.get(0);
		        model.addAttribute("client", loggedClient);
		        session.setAttribute("loggedClient", loggedClient);

		        List<expensEntity> expenses = expensedao.getExpensesByClientId(loggedClient);
		        model.addAttribute("expenses", expenses); 

		    }
		
		model.addAttribute("client",client);
		return "ClientManageHoPage";
	}
	
	@GetMapping("Clientogin")
	public String showLoginPage() {
	    return "ClientLogin"; 
	}

	@PostMapping("loginpost")
	public String loginpost(clientEntity client, Model model, HttpSession session) {
	    List<clientEntity> loggedInClients = clientdao.clientLogin(client.getEmail(), client.getPass());

	    if (!loggedInClients.isEmpty()) {
	        clientEntity loggedClient = loggedInClients.get(0);
	        model.addAttribute("client", loggedClient);
	        session.setAttribute("loggedClient", loggedClient);

	        List<expensEntity> expenses = expensedao.getExpensesByClientId(loggedClient);
	        model.addAttribute("expenses", expenses); 

	        return "ClientManageHoPage";
	    } else
	    {
	        return "ClientLogin";
	    }
	}


}
