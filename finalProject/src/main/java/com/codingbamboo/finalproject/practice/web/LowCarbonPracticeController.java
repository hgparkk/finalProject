package com.codingbamboo.finalproject.practice.web;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LowCarbonPracticeController {

	@RequestMapping("/lowCarbonPracticeView")
	public String lowCarbonPracticeView() {
		return "practice/lowCarbonPracticeView";
	}
	@RequestMapping("/energyReduceView")
	public String energyReduceView() {
		return "practice/energyReduceView";
	}
	@RequestMapping("/ecoConsumptionView")
	public String ecoConsumptionView() {
		return "practice/ecoConsumptionView";
	}
	@RequestMapping("/ecoMovementView")
	public String ecoMovementView() {
		return "practice/ecoMovementView";
	}
	@RequestMapping("/ecoCircularView")
	public String ecoCircularView() {
		return "practice/ecoCircularView";
	}
	@RequestMapping("/ecoSinksView")
	public String ecoSinksView() {
		return "practice/ecoSinksView";
	}
}
