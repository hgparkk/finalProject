package com.codingbamboo.finalproject.admin.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingbamboo.finalproject.user.dto.UserDTO;

@Controller
public class adminController {

	@RequestMapping("/adminHomeView")
	public String adminHomeView(HttpSession session) {
		if ((UserDTO) session.getAttribute("login") == null
				|| ((UserDTO) session.getAttribute("login")).getUserIsmaster() != 1) {
			return "redirect:/";
		}
		return "admin/adminHomeView";

	}
}
