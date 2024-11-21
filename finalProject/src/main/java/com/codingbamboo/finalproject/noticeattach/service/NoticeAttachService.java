package com.codingbamboo.finalproject.noticeattach.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.noticeattach.dao.INoticeAttachDAO;
import com.codingbamboo.finalproject.noticeattach.dto.NoticeAttachDTO;

@Service
public class NoticeAttachService {

    @Autowired
    private INoticeAttachDAO noticeAttachDAO;

    // 공지사항 첨부파일 등록
    public int registerNoticeAttach(NoticeAttachDTO attach) {
        return noticeAttachDAO.insertNoticeAttach(attach);
    }

    // 공지사항 번호로 첨부파일 목록 조회
    public List<NoticeAttachDTO> getAttachListByNoticeNo(int noticeNo) {
        return noticeAttachDAO.getAttachListByNoticeNo(noticeNo);
    }

    // 공지사항 번호로 첨부파일 삭제
    public int deleteAttachByNoticeNo(int noticeNo) {
        return noticeAttachDAO.deleteAttachByNoticeNo(noticeNo);
    }
}
