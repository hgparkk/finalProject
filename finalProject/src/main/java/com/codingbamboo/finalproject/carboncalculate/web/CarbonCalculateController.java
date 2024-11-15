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
	
	// 나의 탄소발자국 페이지 이동
	@RequestMapping("/myCarbonStepView")
	public String myCarbonStepView(HttpSession session, Date date) {
		com.codingbamboo.finalproject.user.dto.UserDTO login = (com.codingbamboo.finalproject.user.dto.UserDTO)session.getAttribute("login");
		
		System.out.println(login);
		
		if(login == null) {
			return "redirect:/loginView";
		}
		
		List<CarbonCalculateDTO> getCarbonCalList = carbonCalculateService.getCarbonCalList();
		
		CarbonCalculateDTO carbonCalculate = carbonCalculateService.getCal(date);
		
		return "user/myCarbonStepView";
	}
	
	// 임시
	// 연도와 월에 해당하는 데이터를 가져오는 메서드
	@ResponseBody
    @RequestMapping("/carbonCal/getCarbonData")
    public ResponseEntity<Map<String, Object>> getCarbonData(@RequestParam("year") int year, @RequestParam("month") int month) {
        // DB에서 해당 연도와 월에 맞는 탄소발자국 계산 결과를 가져오기
        List<CarbonCalculateDTO> results = carbonCalculateService.getCarbonDataByMonth(year, month);

        // 데이터 가공 (예: 총 배출량 계산 등)
        Map<String, Object> response = new HashMap<>();
        response.put("results", results);

        // 필요한 데이터 추가로 응답 (예: 그래프에 필요한 값 등)
        // 예시: response.put("totalCo2", calculateTotalCo2(results));

        return ResponseEntity.ok(response);  // JSON 형식으로 응답
    }
}
