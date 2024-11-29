package com.codingbamboo.finalproject.carboncalculate.web;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.codingbamboo.finalproject.allcount.dto.AllCountDTO;
import com.codingbamboo.finalproject.allcount.dto.AvgDTO;
import com.codingbamboo.finalproject.allcount.service.AllCountService;
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

	@Autowired
	AllCountService allCountService;

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
	
	@RequestMapping("/insertCarbonResult")
	@ResponseBody
	public int insertCarbonResult(AllCountDTO allCount) {
		return allCountService.insertCo2Emission(allCount);
	}

	// 탄소 계산기 결과 페이지로 이동
	@RequestMapping("/carbonCalResultView")
	public String carbonCalResultView(AllCountDTO allCount, Model model) {

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

		// 탄소배출량 평균
		AvgDTO avg = allCountService.selectAvgCo2Emission();
		model.addAttribute("avgCo2Emisison", avg.getAvgAcCo2Emission());

		return "carbonCal/carbonCalResultView";
	}

	// 탄소 계산기 확인
	@PostMapping("/carbonCalRegistCheck")
	@ResponseBody
	public String carbonCalRegistCheck(int year, int month, HttpServletRequest request, HttpSession session) {
		UserDTO login = (UserDTO) session.getAttribute("login");

		// 로그인 정보가 없으면 로그인 페이지로 리다이렉트
		if (login == null) {
			return "login";
		}

		Calendar calendar = Calendar.getInstance();
		calendar.set(year, month - 1, 1, 0, 0, 0); // 월은 0부터 시작하므로 1을 빼야 한다.
		// java.sql.Date로 변환
		Date selectedDate = new Date(calendar.getTimeInMillis());
		CarbonCalculateDTO dateCheck = new CarbonCalculateDTO();
		dateCheck.setUserId(login.getUserId());
		dateCheck.setResultDate(selectedDate);

		// resultDate가 이미 DB에 존재하는지 확인
		CarbonCalculateDTO existingResult = carbonCalculateService.getCalByDate(dateCheck);

		if (existingResult != null) {
			return "exist";
		}

		return "true";
	}

	@PostMapping("/carbonCalRegistDo")
	public String carbonCalRegistDo(CarbonCalculateDTO carbonCalculate, int year, int month,
			HttpServletRequest request) {

		Calendar calendar = Calendar.getInstance();
		calendar.set(year, month - 1, 1, 0, 0, 0); // 월은 0부터 시작하므로 1을 빼야 한다.
		// java.sql.Date로 변환
		Date selectedDate = new Date(calendar.getTimeInMillis());
		carbonCalculate.setResultDate(selectedDate);

		carbonCalculateService.insertCal(carbonCalculate);

		// 사용자에게 메시지 전달
		request.setAttribute("msg", "탄소 계산 결과가 정상적으로 등록되었습니다.");
		request.setAttribute("url", "/myPageMyCarbonResultView");

		return "alert";
	}

	@PostMapping("/carbonCalUpdateDo")
	public String carbonCalUpdateDo(CarbonCalculateDTO carbonCalculate, int year, int month,
			HttpServletRequest request) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(year, month - 1, 1, 0, 0, 0); // 월은 0부터 시작하므로 1을 빼야 한다.
		// java.sql.Date로 변환
		Date selectedDate = new Date(calendar.getTimeInMillis());
		carbonCalculate.setResultDate(selectedDate);

		carbonCalculateService.updateCal(carbonCalculate);

		// 사용자에게 메시지 전달
		request.setAttribute("msg", "탄소 계산 결과가 업데이트되었습니다.");
		request.setAttribute("url", "/myPageMyCarbonResultView");

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
