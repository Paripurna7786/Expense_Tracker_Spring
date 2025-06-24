package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


import com.controller.Dao.ExpenseDao;
import com.entity.clientEntity;
import com.entity.expensEntity;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class expensController 
{
	@Autowired
	
	ExpenseDao expensedao;

	@GetMapping("addexpense")
	public String addexpense() {
		
		return "new_expense";
	}
	
	
	@PostMapping("add-expense")
	public String add_expense(expensEntity expense, Model model, HttpSession session) {
	    clientEntity loggedClient = (clientEntity) session.getAttribute("loggedClient");

	    if (loggedClient != null) {
	        expense.setClient(loggedClient);
	   
	        expensedao.AddExpense(expense);
	        List<expensEntity> expenses = expensedao.getExpensesByClientId(loggedClient);
	        model.addAttribute("client", loggedClient);
	        model.addAttribute("expenses", expenses);
	    }

	    return "ClientManageHoPage"; 
	}


}
