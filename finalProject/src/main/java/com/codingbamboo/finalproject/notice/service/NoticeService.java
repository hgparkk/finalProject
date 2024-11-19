package com.codingbamboo.finalproject.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.notice.dao.INoticeDAO;
import com.codingbamboo.finalproject.notice.dto.NoticeDTO;

@Service
public class NoticeService {

    @Autowired
    private INoticeDAO dao;

    // 공지사항 리스트 가져오기
    public List<NoticeDTO> getNoticeList(Map<String, Object> paramMap) {
        return dao.getNoticeList(paramMap);
    }

    // 공지사항 등록
    public int registNotice(NoticeDTO notice) {
        return dao.registNotice(notice);
    }

    // 공지사항 디테일 가져오기
    public NoticeDTO getNoticeDetail(int noticeNo) {
        return dao.getNoticeDetail(noticeNo);
    }

    // 공지사항 삭제
    public int deleteNotice(int noticeNo) {
        return dao.deleteNotice(noticeNo);
    }
}
