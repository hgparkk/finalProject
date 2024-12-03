package com.codingbamboo.finalproject.notice.web;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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

	@Value("${file.upload.path:C:\\uploadFinalproject}") // 기본 경로 설정
	String uploadPath;

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
		model.addAttribute("totalNotices", totalNotices);

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
	public String noticeWriteDo(NoticeDTO notice, HttpSession session, HttpServletRequest request,
			MultipartFile[] boFile) {

		UserDTO loginUser = (UserDTO) session.getAttribute("login");

		if (loginUser == null || loginUser.getUserIsmaster() != 1) {
			return "redirect:/noticeView";
		}

		// 공지사항 DB 저장
		int isInserted = noticeService.registNotice(notice);
		if (isInserted == 0) {
			request.setAttribute("msg", "공지사항 등록에 실패하였습니다.");
			request.setAttribute("url", "/noticeWriteView");
			return "alert";
		}

		int noticeNo = noticeService.getNoticeNo();
		// 파일첨부
		if (boFile != null && boFile.length > 0 && !boFile[0].isEmpty()) {
			try {
				List<AttachDTO> attachList = fileUploadUtils.getAttachListByMultiparts(boFile);
				for (int i = 0; i < attachList.size(); i++) {
					System.out.println(attachList.get(i));
					attachService.insertAttach(attachList.get(i));
					int attachNo = attachService.getAttachNo(attachList.get(i).getAttachName());
					NoticeAttachDTO noticeAttach = new NoticeAttachDTO(noticeNo, attachNo);
					noticeAttachService.insertNoticeAttach(noticeAttach);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		String url = "/noticeDetailView?noticeNo=" + noticeNo;
		request.setAttribute("msg", "공지사항이 등록되었습니다.");
		request.setAttribute("url", url);
		return "alert";
	}

	@RequestMapping(value = "/noticeDeleteDo", method = { RequestMethod.GET, RequestMethod.POST })
	public String noticeDeleteDo(@RequestParam("noticeNo") int noticeNo, HttpServletRequest request,
			HttpSession session, Model model) {
		UserDTO loginUser = (UserDTO) session.getAttribute("login");
		if (loginUser == null || loginUser.getUserIsmaster() != 1) {
			return "redirect:/noticeView";
		}
		try {

			// 1. 첨부파일 목록 가져오기
			List<AttachDTO> attachList = attachService.getAttachList(noticeNo);

			// 2. 자식 테이블 데이터 삭제 (예: notice_attach)
			for (AttachDTO attach : attachList) {
				attachService.deleteNoticeAttach(attach.getAttachNo());
			}

			// 3. 첨부파일 데이터베이스에서 삭제
			for (AttachDTO attach : attachList) {
				attachService.deleteAttach(attach.getAttachNo());

			}

			// 4. 공지사항 삭제
			noticeService.deleteNotice(noticeNo);

			request.setAttribute("msg", "공지사항이 삭제되었습니다.");
			request.setAttribute("url", "/noticeView");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "공지사항 삭제 중 오류가 발생했습니다.");
			request.setAttribute("url", "/noticeView");
		}
		return "alert";
	}

	// 파일 다운로드 처리
	@RequestMapping("/filedownloadDo")
	public void fileDownloadDo(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// 클라이언트에서 요청받은 파라미터 가져오기
		String fileName = request.getParameter("attachName"); // 서버에 저장된 파일명
		String attachOriginalName = request.getParameter("attachOriginalName"); // 사용자에게 보여질 파일명

		// 파일 경로 생성
		File downloadFile = new File(uploadPath + File.separatorChar + fileName);

		// 해당 파일의 데이터를 읽어서 byte 배열로 리턴
		byte[] fileByte = FileUtils.readFileToByteArray(downloadFile);

		// 응답데이터로 넘겨줄 준비
		response.setContentType("application/actet-stream");
		response.setContentLength(fileByte.length);

		// 원본파일명으로 받아짐
		response.setHeader("Content-Disposition",
				"attachment; fileName=\"" + URLEncoder.encode(attachOriginalName, "UTF-8") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");

		// 파일을 응답데이터로 전송

		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();

	}

	// 공지수정뷰
	@RequestMapping("/noticeEditView")
	public String noticeEditView(@RequestParam("noticeNo") int noticeNo, Model model, HttpSession session,
			RedirectAttributes redirectAttributes) {
		UserDTO loginUser = (UserDTO) session.getAttribute("login");
		if (loginUser == null || loginUser.getUserIsmaster() != 1) {
			redirectAttributes.addFlashAttribute("errorMsg", "권한이 없습니다.");
			return "redirect:/noticeView";
		}
		// 공지사항 정보 가져오기
		NoticeDTO notice = noticeService.getNoticeDetail(noticeNo);

		// 첨부파일 목록 가져오기
		List<AttachDTO> attachList = attachService.getAttachList(noticeNo);

		model.addAttribute("notice", notice);
		model.addAttribute("attachList", attachList);

		return "notice/noticeEditView"; // 수정 화면 JSP 경로
	}

	// 공지수정실행
	@RequestMapping(value = "/noticeEditDo", method = RequestMethod.POST)
	public String noticeEditDo(NoticeDTO notice, @RequestParam("uploadFiles") MultipartFile[] uploadFiles,
			HttpServletRequest request) {
		String url = "";
		try {
			// 1. 공지사항 업데이트
			noticeService.updateNotice(notice);

			// 2. 기존 첨부파일 삭제
			List<AttachDTO> attachList = attachService.getAttachList(notice.getNoticeNo());
			for (AttachDTO attach : attachList) {
				attachService.deleteAttach(attach.getAttachNo());
			}

			// 3. 새로운 첨부파일 업로드 및 저장
			if (uploadFiles != null && uploadFiles.length > 0) {
				for (MultipartFile file : uploadFiles) {
					if (!file.isEmpty()) {
						AttachDTO newAttach = fileUploadUtils.getAttachByMultipart(file);
						attachService.insertAttach(newAttach);
					}
				}
			}
			url = "/noticeDetailView?noticeNo=" + notice.getNoticeNo();

			request.setAttribute("msg", "공지사항이 수정되었습니다.");
			request.setAttribute("url", url);
		} catch (Exception e) {
			e.printStackTrace();
			url = "/noticeDetailView?noticeNo=" + notice.getNoticeNo();
			request.setAttribute("msg", "공지사항 수정이 실패하였습니다.");
			request.setAttribute("url", url);
		}

		return "alert";
	}

}
