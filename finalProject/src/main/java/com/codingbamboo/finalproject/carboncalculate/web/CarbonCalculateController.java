package com.codingbamboo.finalproject.carboncalculate.web;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.codingbamboo.finalproject.carboncalculate.dto.CarbonCalculateDTO;
import com.codingbamboo.finalproject.carboncalculate.service.CarbonCalculateService;
import com.codingbamboo.finalproject.coefficient.dto.CoefficientDTO;
import com.codingbamboo.finalproject.coefficient.service.CoefficientService;
import com.codingbamboo.finalproject.hmc.dto.HmcDTO;
import com.codingbamboo.finalproject.hmc.service.HmcService;
import com.codingbamboo.finalproject.hme.dto.HmeDTO;
import com.codingbamboo.finalproject.hme.service.HmeService;
import com.codingbamboo.finalproject.htac.dto.HtacDTO;
import com.codingbamboo.finalproject.htac.service.HtacService;
import com.codingbamboo.finalproject.hte.dto.HteDTO;
import com.codingbamboo.finalproject.hte.service.HteService;
import com.codingbamboo.finalproject.htr.dto.HtrDTO;
import com.codingbamboo.finalproject.htr.service.HtrService;
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
	
	@Autowired
	HmcService hmcService;
	
	@Autowired
	HtrService htrService;
	
	@Autowired
	HtacService htacService;

	@RequestMapping("/testView")
	public String testView(Model model) {
		
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
        
        // 건물 면적별 탄소 배출량
        List<RaeDTO> getRae = raeService.getRae();
        model.addAttribute("keyGetRae", getRae);
        
        // 가구원수별 인구와 비율
        List<HmcDTO> getHmc = hmcService.getHmc();
        model.addAttribute("keyGetHmc", getHmc);
        
        // 거주
        List<HtrDTO> getHtr = htrService.getHtr();
        model.addAttribute("keyGetHtr", getHtr);
        
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
		
		// 현재 날짜와 결과 날짜 비교
	    Date resultDate = carbonCalculate.getResultDate();
	    
	    System.out.println(resultDate);
	    
	    // resultDate가 이미 DB에 존재하는지 확인
	    CarbonCalculateDTO existingResult = carbonCalculateService.getCalByDate(resultDate);
	    
	    if (existingResult != null) {
	        // 결과 날짜가 이미 존재하는 경우, 기존 데이터를 업데이트
	        carbonCalculate.setUserId(existingResult.getUserId());
	        carbonCalculateService.updateCal(carbonCalculate);

	        // 사용자에게 메시지 전달
	        request.setAttribute("msg", "탄소 계산 결과가 업데이트되었습니다.");
	    } else {
	        // 새로운 계산 결과를 저장
	        carbonCalculateService.insertCal(carbonCalculate);

	        // 사용자에게 메시지 전달
	        request.setAttribute("msg", "탄소 계산 결과가 정상적으로 등록되었습니다.");
	    }

		return "alert";
	}
	
	@PostMapping("/carbonGraphDo")
	@ResponseBody
	public HtacDTO carbonGraphDo(HtacDTO htac) {
		return htacService.getHtac(htac);
	}
	
	@PostMapping("/carbonEnergyDo")
	@ResponseBody
	public List<HmeDTO> carbonEnergyDo(HmeDTO hme) {
		return hmeService.getHme(hme);
	}
}
