package com.codingbamboo.finalproject.suggestions.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingbamboo.finalproject.attach.dto.AttachDTO;
import com.codingbamboo.finalproject.attach.service.AttachService;
import com.codingbamboo.finalproject.common.util.FileUploadUtils;
import com.codingbamboo.finalproject.suggestionreply.dto.SuggestionReplyDTO;
import com.codingbamboo.finalproject.suggestionreply.service.SuggestionReplyService;
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
	FileUploadUtils fileUploadUtils;

	@Autowired
	private SuggestionReplyService replyService;

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
		if (loginUser == null || loginUser.getUserIsmaster() != 1) {
			return "redirect:/";
		}

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
	public String adminSuggestionsDetailView(int sgNo, Model model, HttpSession session) {
		// 사용자 정보 확인 (관리자 여부)
		UserDTO loginUser = (UserDTO) session.getAttribute("login");

		// 건의사항 상세 정보 가져오기
		UserSgDTO suggestion = userSgService.getSgDetail(sgNo);

		if (loginUser == null) {
			return "redirect:/";
		}

		if (loginUser.getUserIsmaster() == 1
				|| ((UserDTO) session.getAttribute("login")).getUserId().equals(suggestion.getUserId())) {
			List<AttachDTO> attachList = attachService.getSgAttachList(sgNo);

			List<SuggestionReplyDTO> replyList = replyService.getReplyList(sgNo);
			if (loginUser.getUserId().equals(suggestion.getUserId())) {
				for (int i = 0; i < replyList.size(); i++) {
					replyService.readReply(replyList.get(i).getReplyNo());
				}
			}

			model.addAttribute("suggestion", suggestion);
			model.addAttribute("attachList", attachList);
			model.addAttribute("replyList", replyList);
			return "admin/adminSuggestionsDetailView";
		}

		return "redirect:/";
	}

	@PostMapping("/registReplyDo")
	public String registReplyDo(SuggestionReplyDTO reply) {
		replyService.registReply(reply);
		int sgNo = reply.getSgNo();
		return "redirect:/adminSuggestionsDetailView?sgNo=" + sgNo;
	}

	@PostMapping("/delReplyDo")
	public String delReply(SuggestionReplyDTO reply) {
		int reNo = reply.getReplyNo();
		int sgNo = reply.getSgNo();
		replyService.delReply(reNo);
		return "redirect:/adminSuggestionsDetailView?sgNo=" + sgNo;
	}

	// 건의사항 삭제
	@RequestMapping(value = "/suggestionDeleteDo", method = RequestMethod.POST)
	public String suggestionDeleteDo(int sgNo, String userId, HttpServletRequest request, HttpSession session,
			Model model) {
		UserDTO loginUser = (UserDTO) session.getAttribute("login");

		if (loginUser == null) {
			return "redirect:/";
		}
		if (loginUser.getUserIsmaster() == 1 || loginUser.getUserId().equals(userId)) {
			try {

				replyService.delSgAllReply(sgNo);

				// 1. 첨부파일 목록 가져오기
				List<AttachDTO> attachList = attachService.getSgAttachList(sgNo);

				// 2. 첨부파일 목록에 대한 삭제
				for (AttachDTO attach : attachList) {
					// sg_attach 테이블에서 삭제
					attachService.deleteSgAttach(attach.getAttachNo());
				}

				for (AttachDTO attach : attachList) {
					// attach 테이블에서 삭제
					attachService.deleteAttach(attach.getAttachNo());
				}

				// 4. 건의사항 삭제
				userSgService.deleteSg(sgNo);

				request.setAttribute("msg", "건의사항이 삭제되었습니다.");
				if (loginUser.getUserIsmaster() == 1) {
					request.setAttribute("url", "/adminSuggestionsView");
				} else {
					request.setAttribute("url", "/myPageMySuggestionsView");
				}
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("msg", "건의사항 삭제 중 오류가 발생했습니다.");
				request.setAttribute("url", "/adminSuggestionsView");
			}
		} else {
			request.setAttribute("msg", "잘못된 접근입니다.");
			request.setAttribute("url", "/");
		}
		return "alert";
	}
}
