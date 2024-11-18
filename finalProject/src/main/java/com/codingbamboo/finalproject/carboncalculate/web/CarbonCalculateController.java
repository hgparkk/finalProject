package com.codingbamboo.finalproject.carboncalculate.web;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.codingbamboo.finalproject.carboncalculate.dao.ICarbonCalculateDAO;
import com.codingbamboo.finalproject.carboncalculate.dto.CarbonCalculateDTO;
import com.codingbamboo.finalproject.carboncalculate.service.CarbonCalculateService;

@Controller
public class CarbonCalculateController {

	@Autowired
	ICarbonCalculateDAO dao;
	
	@Autowired
	CarbonCalculateService carbonCalculateService;
	
	@RequestMapping("/testView")
	public String testView() {
		return "carbonCal/testView";
	}

	// 탄소발자국 계산기 페이지 이동
	@RequestMapping("/carbonCalView")
	public String carbonCalView() {
		return "carbonCal/carbonCalView";
	}

	// 탄소발자국 계산 결과 페이지 이동
	@RequestMapping("/carbonCalResultView")
	public String carbonCalResultView() {
		return "carbonCal/carbonCalResultView";
	}

	// 탄소발자국 계산 결과 저장
	@PostMapping("/carbonCalRegistDo")
	public String carbonCalRegistDo(CarbonCalculateDTO carbonCalculate, HttpServletRequest request, HttpSession session) {
		com.codingbamboo.finalproject.user.dto.UserDTO login = (com.codingbamboo.finalproject.user.dto.UserDTO)session.getAttribute("login");
		
		if(login == null) {
			return "redirect:/loginView";
		}
		carbonCalculate.getResultDate();
		System.out.println(carbonCalculate);
		
		carbonCalculateService.insertCal(carbonCalculate);

		request.setAttribute("msg", "결과가 등록되었습니다.");
		request.setAttribute("url", "/carbonCalView");

		return "alert";
	}
}
