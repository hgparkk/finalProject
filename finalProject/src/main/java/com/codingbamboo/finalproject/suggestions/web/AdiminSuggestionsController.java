package com.codingbamboo.finalproject.suggestions.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingbamboo.finalproject.attach.dto.AttachDTO;
import com.codingbamboo.finalproject.attach.service.AttachService;
import com.codingbamboo.finalproject.common.util.FileUploadUtils;
import com.codingbamboo.finalproject.suggestionattach.service.SuggestionAttachService;
import com.codingbamboo.finalproject.user.dto.UserDTO;
import com.codingbamboo.finalproject.usersg.dto.UserSgDTO;
import com.codingbamboo.finalproject.usersg.service.UserSgService;


@Controller
public class AdiminSuggestionsController {
	
	@Autowired
	private UserSgService userSgService;
	
	@Autowired
	private AttachService attachService;
	
	@Autowired
	private SuggestionAttachService suggestionAttachService;
	
	@Autowired
	FileUploadUtils fileUploadUtils;
	
	@RequestMapping("/adminSuggestionsView")
	public String adiminSuggestionsView(@RequestParam(value = "searchKeyword", required = false) String searchKeyword,
		@RequestParam(value = "page", defaultValue = "1") int page,
		@RequestParam(value = "size", defaultValue = "10") int size, Model model, HttpSession session) {

	// 검색 키워드 초기화
	if (searchKeyword == null || searchKeyword.trim().isEmpty()) {
		searchKeyword = null;
	}

	// 페이징 계산
	int offset = (page - 1) * size;

	// 건의사항 데이터 가져오기
	List<UserSgDTO> sgList = userSgService.getAdminSgList(offset, size);
	int totalSg = userSgService.getAdminSgCount();
	int totalPages = (int) Math.ceil((double) totalSg / size);

	// 사용자 정보 확인 (관리자 여부)
	UserDTO loginUser = (UserDTO) session.getAttribute("login");
	int isMaster = (loginUser != null) ? loginUser.getUserIsmaster() : 0;

	// 모델 데이터 추가
	model.addAttribute("sgList", sgList);
	model.addAttribute("currentPage", page);
	model.addAttribute("totalPages", totalPages);
	model.addAttribute("size", size);
	model.addAttribute("isMaster", isMaster);
	model.addAttribute("totalSg", totalSg);
		
		return "admin/adminSuggestionsView";
	}
	
	@RequestMapping("/adminSuggestionsDetailView")
	public String adminSuggestionsDetailView(int sgNo, Model model) {
		// 건의사항 상세 정보 가져오기
		UserSgDTO suggestion = userSgService.getSgDetail(sgNo);

		List<AttachDTO> attachList = attachService.getAttachList(sgNo);

		model.addAttribute("suggestion", suggestion);
		model.addAttribute("attachList", attachList);
		return "admin/adminSuggestionsDetailView";
	}
	
	@RequestMapping(value = "/suggestionDeleteDo", method = { RequestMethod.GET, RequestMethod.POST })
	public String suggestionDeleteDo(int sgNo, HttpServletRequest request,
			HttpSession session, Model model) {
		UserDTO loginUser = (UserDTO) session.getAttribute("login");
		if (loginUser == null || loginUser.getUserIsmaster() != 1) {
			return "redirect:/";
		}
		try {

			// 1. 첨부파일 목록 가져오기
			List<AttachDTO> attachList = attachService.getAttachList(sgNo);

			// 2. 자식 테이블 데이터 삭제 (예: sg_attach)
			for (AttachDTO attach : attachList) {
				attachService.deleteSg(attach.getAttachNo());
			}

			// 3. 첨부파일 데이터베이스에서 삭제
			for (AttachDTO attach : attachList) {
				attachService.deleteAttach(attach.getAttachNo());

			}

			// 4. 공지사항 삭제
			userSgService.deleteSg(sgNo);

			request.setAttribute("msg", "건의사항이 삭제되었습니다.");
			request.setAttribute("url", "/adminSuggestionsView");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "공지사항 삭제 중 오류가 발생했습니다.");
			request.setAttribute("url", "/daminSuggestionsView");
		}
		return "alert";
	}
}
