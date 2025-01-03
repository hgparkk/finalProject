package com.codingbamboo.finalproject.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.notice.dao.INoticeDAO;
import com.codingbamboo.finalproject.notice.dto.NoticeDTO;

@Service
public class NoticeService {

	@Autowired
	private INoticeDAO noticeDAO;

// 1. 공지사항 등록

	public int registNotice(NoticeDTO notice) {
		return noticeDAO.registNotice(notice);
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
	
	public int getNoticeNo() {
		int result = noticeDAO.getNoticeNo();
		return result;
	}
    public int updateNotice(NoticeDTO notice) {
        return noticeDAO.updateNotice(notice);
    }

    public int deleteNotice(int noticeNo) {
        return noticeDAO.deleteNotice(noticeNo);
    }
}
