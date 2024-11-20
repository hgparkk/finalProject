package com.codingbamboo.finalproject.carbonresearch.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CarbonResearchController {

	@RequestMapping("/carbonResearchView")
	public String carbonResearchView(){
		return "/carbonresearch/carbonResearchView";
	}
	
}
