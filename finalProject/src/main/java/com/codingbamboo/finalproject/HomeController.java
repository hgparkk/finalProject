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
        // 공지사항 미리보기 리스트 가져오기
        List<NoticeDTO> noticePreviewList = noticeService.getNoticePreviewList();

        // 날짜 포맷 설정
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        // 포맷된 날짜 리스트 생성
        for (NoticeDTO notice : noticePreviewList) {
            if (notice.getNoticeDate() != null) {
                // 포맷된 날짜를 DTO에 저장하지 않고 모델에서 사용
                String formattedDate = sdf.format(notice.getNoticeDate());
                notice.setNoticeContent(notice.getNoticeContent() + " (작성일: " + formattedDate + ")");
            }
        }

        // 모델에 데이터 추가
        model.addAttribute("noticePreviewList", noticePreviewList);

        return "home";
    }
}
