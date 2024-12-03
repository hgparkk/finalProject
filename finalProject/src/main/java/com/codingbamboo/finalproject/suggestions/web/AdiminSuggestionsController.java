package com.codingbamboo.finalproject.suggestions.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingbamboo.finalproject.attach.service.AttachService;
import com.codingbamboo.finalproject.notice.dto.NoticeDTO;
import com.codingbamboo.finalproject.user.dto.UserDTO;
import com.codingbamboo.finalproject.usersg.dto.UserSgDTO;
import com.codingbamboo.finalproject.usersg.service.UserSgService;


@Controller
public class AdiminSuggestionsController {
	
	@Autowired
	private UserSgService userSgService;
	
	@Autowired
	private AttachService attachService;
	
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
}
