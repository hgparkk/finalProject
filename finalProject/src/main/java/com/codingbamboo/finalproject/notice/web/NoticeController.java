package com.codingbamboo.finalproject.notice.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingbamboo.finalproject.notice.dto.NoticeDTO;
import com.codingbamboo.finalproject.notice.service.NoticeService;

@Controller
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    @RequestMapping("/noticeView")
    public String noticeView(Model model) {
        List<NoticeDTO> noticeList = noticeService.getNoticeList();
        model.addAttribute("noticeList", noticeList);
        return "notice/noticeView";
    }
    @RequestMapping("/noticeDetailView")
    public String noticeDetailView(@RequestParam("noticeNo") int noticeNo, Model model) {
        // 공지사항 상세 정보를 가져온다.
        NoticeDTO notice = noticeService.getNoticeDetail(noticeNo);
        model.addAttribute("notice", notice);
        return "notice/noticeDetailView"; // JSP 경로와 일치해야 합니다.
    }
}