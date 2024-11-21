package com.codingbamboo.finalproject.carboncalculate.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingbamboo.finalproject.carboncalculate.dto.CarbonCalculateDTO;
import com.codingbamboo.finalproject.carboncalculate.service.CarbonCalculateService;
import com.codingbamboo.finalproject.coefficient.dto.CoefficientDTO;
import com.codingbamboo.finalproject.coefficient.service.CoefficientService;
import com.codingbamboo.finalproject.user.dto.UserDTO;

@Controller
public class CarbonCalculateController {

	@Autowired
	CarbonCalculateService carbonCalculateService;

	@Autowired
	CoefficientService coefficientService;

	@RequestMapping("/testView")
	public String testView() {
		return "carbonCal/testView";
	}

	// 탄소 계산기 뷰 페이지로 이동
	@RequestMapping("/carbonCalView")
	public String carbonCalView(Model model) {
		// 2. Coefficient 데이터 가져오기
        List<CoefficientDTO> coefficientList = coefficientService.getAllCoefficient();
        model.addAttribute("keyCoefficientList", coefficientList);
		return "carbonCal/carbonCalView";
	}

	// 탄소 계산기 결과 페이지로 이동
	@RequestMapping("/carbonCalResultView")
	public String carbonCalResultView() {
		return "carbonCal/carbonCalResultView";
	}

	// 탄소 계산기 결과 등록
	@PostMapping("/carbonCalRegistDo")
	public String carbonCalRegistDo(CarbonCalculateDTO carbonCalculate, HttpServletRequest request,
			HttpSession session) {
		UserDTO login = (UserDTO) session.getAttribute("login");

		// 로그인 정보가 없으면 로그인 페이지로 리다이렉트
		if (login == null) {
			return "redirect:/loginView";
		}

		// 탄소 계산 결과 날짜 확인
		carbonCalculate.getResultDate();

		// 탄소 계산 결과 저장
		carbonCalculateService.insertCal(carbonCalculate);

		// 사용자에게 메시지 전달
		request.setAttribute("msg", "탄소 계산 결과가 정상적으로 등록되었습니다.");
		request.setAttribute("url", "/carbonCalView");

		return "alert";
	}

}
