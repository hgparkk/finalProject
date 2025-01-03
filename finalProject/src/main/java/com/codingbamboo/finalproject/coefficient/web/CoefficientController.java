package com.codingbamboo.finalproject.coefficient.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.codingbamboo.finalproject.coefficient.dto.CoefficientDTO;
import com.codingbamboo.finalproject.coefficient.service.CoefficientService;

@Controller
public class CoefficientController {

	@Autowired
	CoefficientService coefficientService;

	// 계수 불러오기
	@RequestMapping(value = "/getEmissionList", method = RequestMethod.POST)
	@ResponseBody
	public List<CoefficientDTO> getEmissionList() {
		return coefficientService.getCoefficientValue();
	}
}
