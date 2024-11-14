package com.codingbamboo.finalproject.carbonCalculate.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingbamboo.finalproject.carbonCalculate.dao.ICarbonCalculateDAO;
import com.codingbamboo.finalproject.carbonCalculate.dto.CarbonCalculateDTO;
import com.codingbamboo.finalproject.carbonCalculate.service.CarbonCalculateService;

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
	public String boardWriteDo(CarbonCalculateDTO carbonCalculate, HttpServletRequest request, HttpSession session) {
		com.codingbamboo.finalproject.user.dto.UserDTO login = (com.codingbamboo.finalproject.user.dto.UserDTO)session.getAttribute("login");
		
		carbonCalculateService.insertCal(carbonCalculate);

		if(login == null) {
			return "redirect:/loginView";
		}
		request.setAttribute("msg", "결과가 등록되었습니다.");
		request.setAttribute("url", "/carbonCalView");

		return "alert";
	}
}
