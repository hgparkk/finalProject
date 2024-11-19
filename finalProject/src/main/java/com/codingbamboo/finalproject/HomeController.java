package com.codingbamboo.finalproject;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingbamboo.finalproject.notice.dto.NoticeDTO;
import com.codingbamboo.finalproject.notice.service.NoticeService;

@Controller
public class HomeController {

    @Autowired
    private NoticeService noticeService;

    @RequestMapping("/")
    public String home(Model model) {
        List<NoticeDTO> noticePreviewList = noticeService.getNoticePreviewList();

        // 날짜 포맷 설정
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        // 각 공지사항 날짜를 포맷팅
        for (NoticeDTO notice : noticePreviewList) {
            if (notice.getNoticeDate() != null) {
                notice.setFormattedDate(sdf.format(notice.getNoticeDate()));
            }
        }

        model.addAttribute("noticePreviewList", noticePreviewList);
        return "home";
    }
}
