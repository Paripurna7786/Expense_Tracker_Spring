package com.entity;

import java.sql.Date;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
public class expensEntity 
{
	
    private Long id;

   
    private String title;


    private String vendor;


    private String category;

   
    private Integer amount;

   
    private String paymentMode;


    private Date expenseDate;


    private clientEntity client;
}
