package com.codingbamboo.finalproject.carbonCalculate.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingbamboo.finalproject.carbonCalculate.dao.ICarbonCalculateDAO;

@Controller
public class carbonCalculateController {
	
	@Autowired
	ICarbonCalculateDAO dao;
	
	@RequestMapping("/carbonCalView")
	public String calCarbon() {
		return "carbonCal/carbonCalView";
	}
}
