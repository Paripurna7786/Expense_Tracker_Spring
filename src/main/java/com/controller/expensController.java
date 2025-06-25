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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestBody;



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

	@GetMapping("delete_expanse")
	public String deleteExpanses(@RequestParam("id") int id, HttpSession session, Model model) {
	    expensedao.deleteExpanses(id);

	    clientEntity loggedClient = (clientEntity) session.getAttribute("loggedClient");
	    if (loggedClient != null) {
	        List<expensEntity> expenses = expensedao.getExpensesByClientId(loggedClient);
	        model.addAttribute("client", loggedClient);
	        model.addAttribute("expenses", expenses);
	    }

	    return "ClientManageHoPage";
	}
	
	@GetMapping("edit_expanse")
	public String editexpanse(@RequestParam("id") int id, Model model) 
	{
		 expensEntity expense = expensedao.getExpenseById(id); 
		    model.addAttribute("expense", expense);
		return "edit_expense";
	}
	
	@PostMapping("update-expense")
	public String update_expense(expensEntity expense, HttpSession session, Model model) {

	    clientEntity loggedClient = (clientEntity) session.getAttribute("loggedClient");
	    
	    if (loggedClient != null) {
	        expense.setClient(loggedClient); 
	        expensedao.updateExpense(expense);
	        
	        List<expensEntity> expenses = expensedao.getExpensesByClientId(loggedClient);
	        model.addAttribute("client", loggedClient);
	        model.addAttribute("expenses", expenses);
	    }

	    return "ClientManageHoPage";
	}

	


}
