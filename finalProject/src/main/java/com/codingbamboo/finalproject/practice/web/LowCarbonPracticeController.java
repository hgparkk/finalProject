package com.codingbamboo.finalproject.practice.web;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LowCarbonPracticeController {

	@RequestMapping("/lowCarbonPracticeView")
	public String lowCarbonPracticeView() {
		return "practice/lowCarbonPracticeView";
	}
}
