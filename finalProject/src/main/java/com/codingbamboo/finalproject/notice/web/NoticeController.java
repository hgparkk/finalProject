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
    public String noticeView(
            @RequestParam(value = "searchKeyword", required = false) String searchKeyword,
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "10") int size,
            HttpSession session, Model model) {

        // 세션에서 로그인 정보 가져오기
        UserDTO loginUser = (UserDTO) session.getAttribute("login");

        // 검색 조건 처리
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("searchKeyword", searchKeyword);
        paramMap.put("offset", (page - 1) * size); // 시작점 계산
        paramMap.put("limit", size); // 페이지 크기

        // 공지사항 목록 조회
        List<NoticeDTO> noticeList = noticeService.getNoticeList(paramMap);

        // 전체 공지사항 개수 및 페이지 계산
        int totalNotices = noticeService.getNoticeCount(paramMap); // 공지사항 총 개수
        int totalPages = (int) Math.ceil((double) totalNotices / size); // 전체 페이지 수 계산

        // 데이터 모델에 추가
        model.addAttribute("noticeList", noticeList);
        model.addAttribute("searchKeyword", searchKeyword);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("size", size);

        // ismaster 정보 추가 (loginUser가 null인 경우 기본값 설정)
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
                                 @RequestParam("noticeContent") String noticeContent,
                                 HttpSession session, RedirectAttributes redirectAttributes) {
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
}
