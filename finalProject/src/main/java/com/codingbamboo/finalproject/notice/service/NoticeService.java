package com.codingbamboo.finalproject.notice.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.notice.dao.INoticeDAO;
import com.codingbamboo.finalproject.notice.dto.NoticeDTO;

@Service
public class NoticeService {

    @Autowired
    private INoticeDAO dao;

    // 공지사항 리스트 가져오기
    public List<NoticeDTO> getNoticeList() {
        List<NoticeDTO> noticeList = dao.getNoticeList();
        return noticeList != null ? noticeList : Collections.emptyList();
    }

    // 공지사항 등록
    public int registNotice(NoticeDTO notice) {
        return dao.registNotice(notice);
    }
    
    //공지사항 디테일 가져오기
    public NoticeDTO getNoticeDetail(int noticeNo) {
        return dao.getNoticeDetail(noticeNo);
    }
}
