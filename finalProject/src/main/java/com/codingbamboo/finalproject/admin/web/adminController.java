package com.codingbamboo.finalproject.admin.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminController {

	@RequestMapping("/adminHomeView")
	public String adminHomeView() {
		return "admin/adminHomeView";
	}
}
