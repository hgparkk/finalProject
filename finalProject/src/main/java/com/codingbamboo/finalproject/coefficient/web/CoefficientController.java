package com.codingbamboo.finalproject.coefficient.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingbamboo.finalproject.coefficient.service.CoefficientService;

@Controller
public class CoefficientController {
	
	@Autowired
	CoefficientService coefficientService;
	
	/*
	 * @RequestMapping("coefficientView") public int coefficientView() {
	 * 
	 * }
	 */
}
