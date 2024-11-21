package com.codingbamboo.finalproject.usersg.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserSgController {

	@RequestMapping("/userSuggestionsView")
	public String userSgView() {
		return "user/userSuggestionsView";
	}
}
