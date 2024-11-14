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

	// ź�ҹ��ڱ� ���� ������ �̵�
	@RequestMapping("/carbonCalView")
	public String carbonCalView() {
		return "carbonCal/carbonCalView";
	}

	// ź�ҹ��ڱ� ��� ��� ������ �̵�
	@RequestMapping("/carbonCalResultView")
	public String carbonCalResultView() {
		return "carbonCal/carbonCalResultView";
	}

	// ź�ҹ��ڱ� ��� ��� ����
	@PostMapping("/carbonCalRegistDo")
	public String boardWriteDo(CarbonCalculateDTO carbonCalculate, HttpServletRequest request, HttpSession session) {
		com.codingbamboo.finalproject.user.dto.UserDTO login = (com.codingbamboo.finalproject.user.dto.UserDTO)session.getAttribute("login");
		
		carbonCalculateService.insertCal(carbonCalculate);

		if(login == null) {
			return "redirect:/loginView";
		}
		request.setAttribute("msg", "����� ��ϵǾ����ϴ�.");
		request.setAttribute("url", "/carbonCalView");

		return "alert";
	}
}
