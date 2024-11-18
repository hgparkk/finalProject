package com.codingbamboo.finalproject.usersg.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserSgController {

	@RequestMapping("/userSgView")
	public String userSgView() {
		return "user/userSgView";
	}
}
