package com.codingbamboo.finalproject.carbonresearch.web;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingbamboo.finalproject.carbonresearch.dto.CarbonResearchDTO;
import com.codingbamboo.finalproject.carbonresearch.service.CarbonResearchService;
import com.codingbamboo.finalproject.user.dto.UserDTO;

@Controller
public class CarbonResearchController {

	@Autowired
	CarbonResearchService techService;
		
	/**
	 * 연구동향  목록 페이지
	 */
	@RequestMapping("/carbonResearchView")
	public String carbonResearchView(@RequestParam(value = "searchKeyword", required = false) String searchKeyword,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "size", defaultValue = "10") int size, Model model, HttpSession session) {

		// 검색 키워드 초기화
		if (searchKeyword == null || searchKeyword.trim().isEmpty()) {
			searchKeyword = null;
		}

		// 페이징 계산
		int offset = (page - 1) * size;

		// 공지사항 데이터 가져오기
		List<CarbonResearchDTO> techList = techService.getTechList(searchKeyword, offset, size);
		int totalTechs = techService.getTechCount(searchKeyword);
		int totalPages = (int) Math.ceil((double) totalTechs / size);

		// 사용자 정보 확인 (관리자 여부)
		UserDTO loginUser = (UserDTO) session.getAttribute("login");
		int isMaster = (loginUser != null) ? loginUser.getUserIsmaster() : 0;

		// 모델 데이터 추가
		model.addAttribute("techList", techList);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("size", size);
		model.addAttribute("isMaster", isMaster);
		model.addAttribute("totalTechs", totalTechs);

		return "carbonresearch/carbonResearchView";
	}

	/**
	 * 연구동향 등록 페이지
	 */
	@RequestMapping("/carbonResearchWriteView")
	public String carbonResearchWriteView(HttpSession session, Model model) {
		UserDTO loginUser = (UserDTO) session.getAttribute("login");

		if (loginUser == null || loginUser.getUserIsmaster() != 1) {
			model.addAttribute("errorMsg", "권한이 없습니다.");
			return "redirect:/carbonResearchView";
		}

		return "carbonresearch/carbonResearchWriteView";
	}

	/**
	 * 연구동향 등록 처리
	 */
	@RequestMapping(value = "/techWriteDo", method = RequestMethod.POST)
	public String techWriteDo(CarbonResearchDTO technology, HttpSession session, HttpServletRequest request) {

		UserDTO loginUser = (UserDTO) session.getAttribute("login");

		if (loginUser == null || loginUser.getUserIsmaster() != 1) {
			return "redirect:/carbonResearchView";
		}

		// 연구동향 DB 저장
		int isInserted = techService.registTech(technology);
		if (isInserted == 0) {
			request.setAttribute("msg", "연구동향 등록에 실패하였습니다.");
			request.setAttribute("url", "/carbonResearchWriteView");
			return "alert";
		}

		request.setAttribute("msg", "연구동향이 등록되었습니다.");
		request.setAttribute("url", "/carbonResearchView");
		return "alert";
	}

	@RequestMapping(value = "/techDeleteDo", method = { RequestMethod.GET, RequestMethod.POST })
	public String techDeleteDo(@RequestParam("techNo") int techNo, HttpServletRequest request,
			HttpSession session, Model model) {
		UserDTO loginUser = (UserDTO) session.getAttribute("login");
		if (loginUser == null || loginUser.getUserIsmaster() != 1) {
			return "redirect:/carbonResearchView";
		}
		try {

			// 4. 연구동향 삭제
			techService.deleteTech(techNo);

			request.setAttribute("msg", "연구동향이 삭제되었습니다.");
			request.setAttribute("url", "/carbonResearchView");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "연구동향 삭제 중 오류가 발생했습니다.");
			request.setAttribute("url", "/carbonResearchView");
		}
		return "alert";
	}

	// 연구동향 수정뷰
	@RequestMapping("/carbonResearchEditView")
	public String carbonResearchEditView(@RequestParam("techNo") int techNo, Model model, HttpSession session,
			RedirectAttributes redirectAttributes) {
		UserDTO loginUser = (UserDTO) session.getAttribute("login");
		if (loginUser == null || loginUser.getUserIsmaster() != 1) {
			redirectAttributes.addFlashAttribute("errorMsg", "권한이 없습니다.");
			return "redirect:/carbonResearchView";
		}
		// 공지사항 정보 가져오기
		CarbonResearchDTO tech = techService.getTechDetail(techNo);

		model.addAttribute("tech", tech);

		return "carbonresearch/carbonResearchEditView"; // 수정 화면 JSP 경로
	}

	// 연구동향 수정실행
	@RequestMapping(value = "/techEditDo", method = RequestMethod.POST)
	public String techEditDo(CarbonResearchDTO technology, HttpServletRequest request) {
		String url = "";
		try {
			// 1. 연구동향 업데이트
			techService.updateTech(technology);

			url = "/carbonResearchView";

			request.setAttribute("msg", "연구동향이 수정되었습니다.");
			request.setAttribute("url", url);
		} catch (Exception e) {
			e.printStackTrace();
			url = "/carbonResearchView";
			request.setAttribute("msg", "연구동향 수정이 실패하였습니다.");
			request.setAttribute("url", url);
		}

		return "alert";
	}
}
