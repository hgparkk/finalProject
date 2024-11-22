package com.codingbamboo.finalproject.noticeattach.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.codingbamboo.finalproject.noticeattach.dao.INoticeAttachDAO;
import com.codingbamboo.finalproject.noticeattach.dto.NoticeAttachDTO;

@Service
@Transactional
public class NoticeAttachService {

    @Autowired
    private INoticeAttachDAO noticeAttachDAO;

    /**
     * 첨부파일 등록 (단일)
     */
    public int registerAttach(NoticeAttachDTO attach) {
        return noticeAttachDAO.insertAttach(attach);
    }

    /**
     * 첨부파일 등록 (다중)
     */
    public void registerAttachList(int noticeNo, List<NoticeAttachDTO> attachList) {
        for (NoticeAttachDTO attach : attachList) {
            attach.setNoticeNo(noticeNo);
            noticeAttachDAO.insertAttach(attach);
        }
    }

    /**
     * 특정 공지사항 번호에 해당하는 첨부파일 리스트 가져오기
     */
    public List<NoticeAttachDTO> getAttachListByNoticeNo(int noticeNo) {
        return noticeAttachDAO.getAttachListByNoticeNo(noticeNo);
    }

    /**
     * 특정 첨부파일 번호에 해당하는 첨부파일 정보 가져오기
     */
    public NoticeAttachDTO getAttachByAttachNo(int attachNo) {
        return noticeAttachDAO.getAttachByAttachNo(attachNo);
    }

    /**
     * 특정 공지사항 번호에 연결된 모든 첨부파일 삭제
     */
    public int deleteAttachByNoticeNo(int noticeNo) {
        return noticeAttachDAO.deleteAttachByNoticeNo(noticeNo);
    }

    /**
     * 특정 첨부파일 번호에 해당하는 첨부파일 삭제
     */
    public int deleteAttachByAttachNo(int attachNo) {
        return noticeAttachDAO.deleteAttachByAttachNo(attachNo);
    }
}
