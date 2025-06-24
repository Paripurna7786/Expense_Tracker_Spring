package com.entity;

import java.time.LocalDate;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
public class clientEntity
{
	
    private Long id;

   
    private String fname;

   
    private String lname;

    private String email;

    private String pass;

    private String gender;

    private String profilepicpath;
    
    private String role = "User";

    private LocalDate createdAt = LocalDate.now();
    
    
}
