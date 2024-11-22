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
import com.codingbamboo.finalproject.hme.dto.HmeDTO;
import com.codingbamboo.finalproject.hme.service.HmeService;
import com.codingbamboo.finalproject.hte.dto.HteDTO;
import com.codingbamboo.finalproject.hte.service.HteService;
import com.codingbamboo.finalproject.rae.dto.RaeDTO;
import com.codingbamboo.finalproject.rae.service.RaeService;
import com.codingbamboo.finalproject.user.dto.UserDTO;

@Controller
public class CarbonCalculateController {

	@Autowired
	CarbonCalculateService carbonCalculateService;

	@Autowired
	CoefficientService coefficientService;
	
	@Autowired
	HteService hteService;
	
	@Autowired
	HmeService hmeService;
	
	@Autowired
	RaeService raeService;

	@RequestMapping("/testView")
	public String testView() {
		return "carbonCal/testView";
	}

	// 탄소 계산기 뷰 페이지로 이동
	@RequestMapping("/carbonCalView")
	public String carbonCalView(Model model) {
		// 계수 데이터 가져오기
        List<CoefficientDTO> getCoefficientValue = coefficientService.getCoefficientValue();
        model.addAttribute("keyGetCoefficientValue", getCoefficientValue);
        
		return "carbonCal/carbonCalView";
	}

	// 탄소 계산기 결과 페이지로 이동
	@RequestMapping("/carbonCalResultView")
	public String carbonCalResultView(Model model) {
		// 계수 데이터 가져오기
        List<CoefficientDTO> getCoefficientValue = coefficientService.getCoefficientValue();
        model.addAttribute("keyGetCoefficientValue", getCoefficientValue);
        
        // 건물 종류별 탄소 배출량
        List<HteDTO> getHte = hteService.getHte();
        model.addAttribute("keyGetHte", getHte);
        
        // 가족 구성원별 탄소 배출량
        List<HmeDTO> getHme = hmeService.getHme();
        model.addAttribute("keyGetHme", getHme);
        
        // 건물 면적별 탄소 배출량
        List<RaeDTO> getRae = raeService.getRae();
        model.addAttribute("keyGetRae", getRae);
        
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
