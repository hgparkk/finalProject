package com.codingbamboo.finalproject.notice.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingbamboo.finalproject.notice.dto.NoticeDTO;
import com.codingbamboo.finalproject.notice.service.NoticeService;
import com.codingbamboo.finalproject.user.dto.UserDTO;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	// 공지사항 목록 뷰 (페이징 추가)
	@RequestMapping("/noticeView")
	public String noticeView(@RequestParam(value = "searchKeyword", required = false) String searchKeyword,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "size", defaultValue = "10") int size, HttpSession session, Model model) {

		// 세션에서 로그인 정보 가져오기
		UserDTO loginUser = (UserDTO) session.getAttribute("login");

		// 검색 키워드 초기화 (NULL 처리)
		if (searchKeyword == null || searchKeyword.trim().isEmpty()) {
			searchKeyword = null; // NULL로 설정해 SQL에서 전체 검색 가능
		}

		// 페이지와 사이즈 검증
		if (page < 1)
			page = 1; // 최소 페이지는 1
		if (size < 1)
			size = 10; // 최소 페이지 크기 기본값 설정

		// 검색 조건 및 페이징 처리 파라미터 설정
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("searchKeyword", searchKeyword);
		paramMap.put("offset", (page - 1) * size); // 시작점 계산
		paramMap.put("limit", size); // 페이지 크기 설정

		// 공지사항 목록 조회
		List<NoticeDTO> noticeList = noticeService.getNoticeList(paramMap);

		// 전체 공지사항 개수 조회 및 페이지 수 계산
		int totalNotices = noticeService.getNoticeCount(paramMap);
		int totalPages = (int) Math.ceil((double) totalNotices / size); // 전체 페이지 수 계산

		// 데이터 모델에 추가
		model.addAttribute("noticeList", noticeList); // 공지사항 리스트
		model.addAttribute("searchKeyword", searchKeyword); // 검색 키워드
		model.addAttribute("currentPage", page); // 현재 페이지
		model.addAttribute("totalPages", totalPages); // 전체 페이지 수
		model.addAttribute("size", size); // 페이지 크기

		// 로그인 여부 및 권한 추가
		model.addAttribute("ismaster", loginUser != null ? loginUser.getUserIsmaster() : 0);

		return "notice/noticeView";
	}

	// 공지사항 상세 뷰
	@RequestMapping("/noticeDetailView")
	public String noticeDetailView(@RequestParam("noticeNo") int noticeNo, Model model) {
		// 공지사항 상세 정보를 가져온다.
		NoticeDTO notice = noticeService.getNoticeDetail(noticeNo);
		model.addAttribute("notice", notice);
		return "notice/noticeDetailView"; // JSP 경로와 일치해야 합니다.
	}

	// 공지사항 글쓰기 뷰
	@RequestMapping("/noticeWriteView")
	public String noticeWriteView(HttpSession session, Model model) {
		// 세션에서 로그인 정보 가져오기
		UserDTO loginUser = (UserDTO) session.getAttribute("login");

		// 권한 체크
		if (loginUser == null || loginUser.getUserIsmaster() != 1) {
			model.addAttribute("errorMsg", "권한이 없습니다.");
			return "redirect:/noticeView";
		}

		return "notice/noticeWriteView"; // 글쓰기 뷰 JSP 경로
	}

	// 공지사항 작성 처리
	@RequestMapping("/noticeWriteDo")
	public String noticeWriteDo(@RequestParam("noticeTitle") String noticeTitle,
			@RequestParam("noticeContent") String noticeContent, HttpSession session,
			RedirectAttributes redirectAttributes) {
		// 세션에서 로그인 정보 가져오기
		UserDTO loginUser = (UserDTO) session.getAttribute("login");

		// 권한 체크
		if (loginUser == null || loginUser.getUserIsmaster() != 1) {
			redirectAttributes.addFlashAttribute("errorMsg", "권한이 없습니다.");
			return "redirect:/noticeView";
		}

		// 공지사항 등록
		NoticeDTO notice = new NoticeDTO();
		notice.setNoticeTitle(noticeTitle);
		notice.setNoticeContent(noticeContent);
		notice.setAttachNo(0); // 파일 첨부 기능 미구현 시 기본값으로 설정

		int result = noticeService.registNotice(notice);

		if (result > 0) {
			redirectAttributes.addFlashAttribute("successMsg", "공지사항이 등록되었습니다.");
		} else {
			redirectAttributes.addFlashAttribute("errorMsg", "공지사항 등록에 실패했습니다.");
		}

		return "redirect:/noticeView"; // 등록 후 공지사항 목록으로 이동
	}

	// 공지사항 삭제 처리
	@RequestMapping("/noticeDeleteDo")
	public String noticeDeleteDo(@RequestParam("noticeNo") int noticeNo, HttpSession session,
			RedirectAttributes redirectAttributes) {
		// 세션에서 로그인 정보 가져오기
		UserDTO loginUser = (UserDTO) session.getAttribute("login");

		// 권한 체크
		if (loginUser == null || loginUser.getUserIsmaster() != 1) {
			redirectAttributes.addFlashAttribute("errorMsg", "권한이 없습니다.");
			return "redirect:/noticeView";
		}

		// 공지사항 삭제
		int result = noticeService.deleteNotice(noticeNo);

		if (result > 0) {
			redirectAttributes.addFlashAttribute("successMsg", "공지사항이 삭제되었습니다.");
		} else {
			redirectAttributes.addFlashAttribute("errorMsg", "공지사항 삭제에 실패했습니다.");
		}

		return "redirect:/noticeView";
	}

	@RequestMapping("/noticeEditView")
	public String noticeEditView(@RequestParam("noticeNo") int noticeNo, Model model, HttpSession session) {
		// 관리자 권한 체크
		UserDTO loginUser = (UserDTO) session.getAttribute("login");
		if (loginUser == null || loginUser.getUserIsmaster() != 1) {
			return "redirect:/noticeView"; // 권한이 없으면 목록으로 리다이렉트
		}

		// 공지사항 상세 정보 조회
		NoticeDTO notice = noticeService.getNoticeDetail(noticeNo);
		model.addAttribute("notice", notice);
		return "notice/noticeEditView"; // 수정 뷰로 이동
	}

	@RequestMapping("/noticeEditDo")
	public String noticeEditDo(@RequestParam("noticeNo") int noticeNo, @RequestParam("noticeTitle") String noticeTitle,
			@RequestParam("noticeContent") String noticeContent, HttpSession session,
			RedirectAttributes redirectAttributes) {

		// 관리자 권한 체크
		UserDTO loginUser = (UserDTO) session.getAttribute("login");
		if (loginUser == null || loginUser.getUserIsmaster() != 1) {
			redirectAttributes.addFlashAttribute("errorMsg", "권한이 없습니다.");
			return "redirect:/noticeView";
		}

		// 공지사항 수정
		NoticeDTO notice = new NoticeDTO();
		notice.setNoticeNo(noticeNo);
		notice.setNoticeTitle(noticeTitle);
		notice.setNoticeContent(noticeContent);

		int result = noticeService.editNotice(notice);
		if (result > 0) {
			redirectAttributes.addFlashAttribute("successMsg", "공지사항이 수정되었습니다.");
		} else {
			redirectAttributes.addFlashAttribute("errorMsg", "공지사항 수정에 실패했습니다.");
		}

		return "redirect:/noticeView";
	}
}
