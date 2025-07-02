package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class MainPageController {

	
	
	 	@GetMapping("/")
		public String mianpage()
		{
			System.out.println("called");
			return "mainpage";//jsp name
		}

	   
	        @GetMapping("/about_us")
	        public String aboutPage() {
	            return "about_us"; // Do NOT include .jsp
	        }

}
