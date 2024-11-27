package com.codingbamboo.finalproject.admincoefficient.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminCoefficientController {

	@RequestMapping("/adminCalView")
	public String adminCalView() {
		return "admin/adminCalculationView";
	}
	
}
