package com.codingbamboo.finalproject.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.notice.dao.INoticeDAO;
import com.codingbamboo.finalproject.notice.dto.NoticeDTO;
import com.codingbamboo.finalproject.noticeattach.dao.INoticeAttachDAO;
import com.codingbamboo.finalproject.noticeattach.dto.NoticeAttachDTO;

@Service
public class NoticeService {

    @Autowired
    private INoticeDAO noticeDAO;

    @Autowired
    private INoticeAttachDAO noticeAttachDAO;

    // 공지사항 등록
    public int registNotice(NoticeDTO notice, List<NoticeAttachDTO> attachList) {

        int result = noticeDAO.registNotice(notice);

        if (result > 0) {
            System.out.println("공지사항 등록 성공, NoticeNo: " + notice.getNoticeNo());
        } else {
            System.out.println("공지사항 등록 실패");
            return 0; // 등록 실패 시 종료
        }

        // 첨부파일 처리
        if (attachList != null && !attachList.isEmpty()) {
            for (NoticeAttachDTO attach : attachList) {
                attach.setNoticeNo(notice.getNoticeNo()); // Notice 번호 연결

                // 첨부파일 데이터베이스 저장
                int attachResult = noticeAttachDAO.insertAttach(attach);
                if (attachResult > 0) {
                    System.out.println("첨부파일 등록 성공, AttachNo: " + attach.getAttachNo());
                } else {
                    System.out.println("첨부파일 등록 실패");
                }
            }
        } else {
            System.out.println("첨부파일이 없습니다.");
        }

        return result;
    }



    /**
     * 공지사항 목록 조회
     */
    public List<NoticeDTO> getNoticeList(String searchKeyword, int offset, int size) {
        return noticeDAO.getNoticeList(searchKeyword, offset, size);
    }

    /**
     * 공지사항 총 개수 조회
     */
    public int getNoticeCount(String searchKeyword) {
        return noticeDAO.getNoticeCount(searchKeyword);
    }

    /**
     * 공지사항 상세 조회
     */
    public NoticeDTO getNoticeDetail(int noticeNo) {
        return noticeDAO.getNoticeDetail(noticeNo);
    }
    
    public List<NoticeDTO> getNoticePreviewList() {
        return noticeDAO.getNoticePreviewList();
    }
}
