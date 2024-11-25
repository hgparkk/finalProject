package com.codingbamboo.finalproject.notice.web;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingbamboo.finalproject.notice.dto.NoticeDTO;
import com.codingbamboo.finalproject.notice.service.NoticeService;
import com.codingbamboo.finalproject.noticeattach.dto.NoticeAttachDTO;
import com.codingbamboo.finalproject.noticeattach.service.NoticeAttachService;
import com.codingbamboo.finalproject.user.dto.UserDTO;

@Controller
public class NoticeController {

	@Autowired
	private NoticeAttachService noticeAttachService;
	
    @Autowired
    private NoticeService noticeService;

    /**
     * 공지사항 목록 페이지
     */
    @RequestMapping("/noticeView")
    public String noticeView(
            @RequestParam(value = "searchKeyword", required = false) String searchKeyword,
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "10") int size,
            Model model, HttpSession session) {

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

        if (notice == null) {
            model.addAttribute("errorMsg", "존재하지 않는 공지사항입니다.");
            return "redirect:/noticeView";
        }

        // 첨부파일 리스트 가져오기
        List<NoticeAttachDTO> attachList = noticeAttachService.getAttachListByNoticeNo(noticeNo);
        notice.setAttachList(attachList);

        model.addAttribute("notice", notice);
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
    @RequestMapping("/noticeWriteDo")
    public String noticeWriteDo(
            @RequestParam("noticeTitle") String noticeTitle,
            @RequestParam("noticeContent") String noticeContent,
            @RequestParam(value = "attachFiles", required = false) List<MultipartFile> attachFiles,
            HttpSession session, RedirectAttributes redirectAttributes) {

        UserDTO loginUser = (UserDTO) session.getAttribute("login");

        if (loginUser == null || loginUser.getUserIsmaster() != 1) {
            redirectAttributes.addFlashAttribute("errorMsg", "권한이 없습니다.");
            return "redirect:/noticeView";
        }

        // 공지사항 생성
        NoticeDTO notice = new NoticeDTO();
        notice.setNoticeTitle(noticeTitle);
        notice.setNoticeContent(noticeContent);

        try {
            // 첨부파일 업로드 처리
            List<NoticeAttachDTO> attachList = new ArrayList<>();
            if (attachFiles != null && !attachFiles.isEmpty()) {
                for (MultipartFile file : attachFiles) {
                    if (!file.isEmpty()) {
                        NoticeAttachDTO attach = new NoticeAttachDTO();
                        attach.setAttachName(System.currentTimeMillis() + "_" + file.getOriginalFilename());
                        attach.setAttachOriginalName(file.getOriginalFilename());
                        attach.setAttachSize(file.getSize());
                        attach.setAttachType(file.getContentType());
                        attach.setAttachPath("C:/uploads/" + attach.getAttachName());

                        // 파일 저장
                        File dest = new File(attach.getAttachPath());
                        dest.getParentFile().mkdirs();
                        file.transferTo(dest);

                        attachList.add(attach);
                    }
                }
            }

            // 디버깅: 첨부파일 리스트 출력
            for (NoticeAttachDTO attach : attachList) {
                System.out.println("첨부파일 이름: " + attach.getAttachOriginalName());
                System.out.println("첨부파일 크기: " + attach.getAttachSize());
            }

            // 공지사항 등록
            int result = noticeService.registNotice(notice, attachList);

            if (result > 0) {
                redirectAttributes.addFlashAttribute("successMsg", "공지사항이 등록되었습니다.");
            } else {
                redirectAttributes.addFlashAttribute("errorMsg", "공지사항 등록에 실패했습니다.");
            }

        } catch (Exception e) {
            e.printStackTrace(); // 디버깅: 예외 메시지 출력
            redirectAttributes.addFlashAttribute("errorMsg", "공지사항 등록 중 오류가 발생했습니다.");
        }

        return "redirect:/noticeView";
    }





}
