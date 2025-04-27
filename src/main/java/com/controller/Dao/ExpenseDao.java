package com.controller.Dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.entity.clientEntity;
import com.entity.expensEntity;

@Repository
public class ExpenseDao 
{
	@Autowired
    JdbcTemplate stmt;
	public void AddExpense(expensEntity expense) {
	  
	    stmt.update("INSERT INTO expenses (title, vendor, category, amount, payment_mode, expense_date, user_id) VALUES (?, ?, ?, ?, ?, ?, ?)",
	        expense.getTitle(),
	        expense.getVendor(),
	        expense.getCategory(),
	        expense.getAmount(),
	        expense.getPaymentMode(),
	        expense.getExpenseDate(),
	        expense.getClient().getId() 
	    );
	}
	
	public List<expensEntity> getExpensesByClientId(clientEntity client) {
	    List<expensEntity> expenses = stmt.query(
	        "SELECT * FROM expenses WHERE user_id = ?",
	        new BeanPropertyRowMapper<>(expensEntity.class),
	        client.getId()
	    );

	    for (expensEntity e : expenses) {
	        e.setClient(client);
	    }

	    return expenses;
	}



}
