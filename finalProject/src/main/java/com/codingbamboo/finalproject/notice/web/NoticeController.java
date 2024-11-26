package com.codingbamboo.finalproject.notice.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingbamboo.finalproject.attach.dto.AttachDTO;
import com.codingbamboo.finalproject.attach.service.AttachService;
import com.codingbamboo.finalproject.common.util.FileUploadUtils;
import com.codingbamboo.finalproject.notice.dto.NoticeDTO;
import com.codingbamboo.finalproject.notice.service.NoticeService;
import com.codingbamboo.finalproject.noticeattach.dto.NoticeAttachDTO;
import com.codingbamboo.finalproject.noticeattach.service.NoticeAttachService;
import com.codingbamboo.finalproject.user.dto.UserDTO;

@Controller
public class NoticeController {

	@Autowired
	NoticeService noticeService;

	@Autowired
	AttachService attachService;

	@Autowired
	NoticeAttachService noticeAttachService;

	@Autowired
	FileUploadUtils fileUploadUtils;

	/**
	 * 공지사항 목록 페이지
	 */
	@RequestMapping("/noticeView")
	public String noticeView(@RequestParam(value = "searchKeyword", required = false) String searchKeyword,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "size", defaultValue = "10") int size, Model model, HttpSession session) {

		// 검색 키워드 초기화
		if (searchKeyword == null || searchKeyword.trim().isEmpty()) {
			searchKeyword = null;
		}

		// 페이징 계산
		int offset = (page - 1) * size;

		// 공지사항 데이터 가져오기
		List<NoticeDTO> noticeList = noticeService.getNoticeList(searchKeyword, offset, size);
		int totalNotices = noticeService.getNoticeCount(searchKeyword);
		int totalPages = (int) Math.ceil((double) totalNotices / size);

		// 사용자 정보 확인 (관리자 여부)
		UserDTO loginUser = (UserDTO) session.getAttribute("login");
		int isMaster = (loginUser != null) ? loginUser.getUserIsmaster() : 0;

		// 모델 데이터 추가
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("size", size);
		model.addAttribute("isMaster", isMaster);

		return "notice/noticeView";
	}

	/**
	 * 공지사항 상세 페이지
	 */
	@RequestMapping("/noticeDetailView")
	public String noticeDetailView(@RequestParam("noticeNo") int noticeNo, Model model) {
		// 공지사항 상세 정보 가져오기
		NoticeDTO notice = noticeService.getNoticeDetail(noticeNo);

		List<AttachDTO> attachList = attachService.getAttachList(noticeNo);

		model.addAttribute("notice", notice);
		model.addAttribute("attachList", attachList);
		return "notice/noticeDetailView";
	}

	/**
	 * 공지사항 등록 페이지
	 */
	@RequestMapping("/noticeWriteView")
	public String noticeWriteView(HttpSession session, Model model) {
		UserDTO loginUser = (UserDTO) session.getAttribute("login");

		if (loginUser == null || loginUser.getUserIsmaster() != 1) {
			model.addAttribute("errorMsg", "권한이 없습니다.");
			return "redirect:/noticeView";
		}

		return "notice/noticeWriteView";
	}

	/**
	 * 공지사항 등록 처리
	 */
	@RequestMapping(value = "/noticeWriteDo", method = RequestMethod.POST)
	public String noticeWriteDo(NoticeDTO notice, String noticeContent, HttpSession session,
			RedirectAttributes redirectAttributes, MultipartFile[] boFile) {

		UserDTO loginUser = (UserDTO) session.getAttribute("login");

		if (loginUser == null || loginUser.getUserIsmaster() != 1) {
			redirectAttributes.addFlashAttribute("errorMsg", "권한이 없습니다.");
			return "redirect:/noticeView";
		}

		// 공지사항 DB 저장
		int isInserted = noticeService.registNotice(notice);
		if (isInserted == 0) {
			redirectAttributes.addFlashAttribute("errorMsg", "공지사항 등록에 실패했습니다.");
			return "redirect:/noticeWrite";
		}

		// 파일첨부
		if (boFile != null && boFile.length > 0 && !boFile[0].isEmpty()) {
			System.out.println("파일갯수:" + boFile.length);

			try {
				List<AttachDTO> attachList = fileUploadUtils.getAttachListByMultiparts(boFile);
				int noticeNo = noticeService.getNoticeNo();
				for (int i = 0; i < attachList.size(); i++) {
					attachService.insertAttach(attachList.get(i));
					System.out.println(attachList.get(i).getAttachName());
					int attachNo = attachService.getAttachNo(attachList.get(i).getAttachName());
					NoticeAttachDTO noticeAttach = new NoticeAttachDTO(noticeNo, attachNo);
					noticeAttachService.insertNoticeAttach(noticeAttach);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}

		}

		redirectAttributes.addFlashAttribute("successMsg", "공지사항이 등록되었습니다.");
		return "redirect:/noticeView";
	}

}
