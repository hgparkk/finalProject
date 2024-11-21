package com.codingbamboo.finalproject.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.codingbamboo.finalproject.notice.dao.INoticeDAO;
import com.codingbamboo.finalproject.noticeattach.dao.INoticeAttachDAO;
import com.codingbamboo.finalproject.notice.dto.NoticeDTO;
import com.codingbamboo.finalproject.noticeattach.dto.NoticeAttachDTO;

@Service
@Transactional
public class NoticeService {

	@Autowired
	private INoticeDAO noticeDAO;

	@Autowired
	private INoticeAttachDAO noticeAttachDAO;

	/**
	 * 공지사항 리스트 가져오기
	 */
	public List<NoticeDTO> getNoticeList(Map<String, Object> paramMap) {
		return noticeDAO.getNoticeList(paramMap);
	}

	/**
	 * 공지사항 등록
	 */
	public int registNotice(NoticeDTO notice, List<NoticeAttachDTO> attachList) {
	    // 1. 공지사항 등록
	    int result = noticeDAO.registNotice(notice);

	    // 공지사항 번호 확인
	    if (notice.getNoticeNo() == 0) {
	        throw new IllegalStateException("공지사항 번호 생성에 실패했습니다.");
	    }

	    int noticeNo = notice.getNoticeNo(); // 생성된 공지사항 번호 가져오기
	    System.out.println("공지사항 등록 성공: NoticeNo=" + noticeNo);

	    // 2. 첨부파일 처리
	    if (result > 0 && attachList != null && !attachList.isEmpty()) {
	        for (NoticeAttachDTO attach : attachList) {
	            // Step 1: ATTACH 테이블에 삽입
	            noticeAttachDAO.insertAttach(attach);

	            // 자동 생성된 첨부파일 번호 확인
	            if (attach.getAttachNo() == 0) {
	                throw new IllegalStateException("첨부파일 번호 생성에 실패했습니다.");
	            }
	            System.out.println("첨부파일 등록 성공: AttachNo=" + attach.getAttachNo() + 
	                               ", FileName=" + attach.getAttachOriginalName());

	            // Step 2: NOTICE_ATTACH 테이블에 관계 저장
	            NoticeAttachDTO noticeAttach = new NoticeAttachDTO();
	            noticeAttach.setNoticeNo(noticeNo); // 공지사항 번호 설정
	            noticeAttach.setAttachNo(attach.getAttachNo()); // 첨부파일 번호 설정

	            noticeAttachDAO.insertNoticeAttach(noticeAttach);
	            System.out.println("공지사항-첨부파일 관계 저장 성공: NoticeNo=" + noticeAttach.getNoticeNo() +
	                               ", AttachNo=" + noticeAttach.getAttachNo());
	        }
	    } else {
	        System.out.println("첨부파일이 없거나 공지사항 등록에 실패했습니다.");
	    }

	    return result;
	}


	/**
	 * 공지사항 상세 정보 가져오기
	 */
	public NoticeDTO getNoticeDetail(int noticeNo) {
		// 공지사항 정보 조회
		NoticeDTO notice = noticeDAO.getNoticeDetail(noticeNo);

		if (notice != null) {
			// 첨부파일 리스트 조회
			List<NoticeAttachDTO> attachList = noticeAttachDAO.getAttachListByNoticeNo(noticeNo);
			notice.setAttachList(attachList); // NoticeDTO에 attachList 설정
		}

		return notice;
	}

	/**
	 * 공지사항 삭제
	 */
	public int deleteNotice(int noticeNo) {
		// 첨부파일 삭제
		noticeAttachDAO.deleteAttachByNoticeNo(noticeNo);
		// 공지사항 삭제
		return noticeDAO.deleteNotice(noticeNo);
	}

	/**
	 * 공지사항 미리보기 리스트 가져오기
	 */
	public List<NoticeDTO> getNoticePreviewList() {
		return noticeDAO.getNoticePreviewList();
	}

	/**
	 * 공지사항 총 개수 가져오기 (페이징 처리)
	 */
	public int getNoticeCount(Map<String, Object> paramMap) {
		return noticeDAO.selectNoticeCount(paramMap);
	}

	/**
	 * 공지사항 수정
	 */
	public int editNotice(NoticeDTO notice, List<NoticeAttachDTO> attachList) {
		// 공지사항 수정
		int result = noticeDAO.updateNotice(notice);

		if (result > 0) {
			// 기존 첨부파일 삭제
			noticeAttachDAO.deleteAttachByNoticeNo(notice.getNoticeNo());

			// 새 첨부파일 등록
			if (attachList != null && !attachList.isEmpty()) {
				for (NoticeAttachDTO attach : attachList) {
					// Step 1: 기본값 설정
					if (attach.getAttachType() == null) {
						attach.setAttachType("default");
					}

					// Step 2: ATTACH 테이블에 삽입
					noticeAttachDAO.insertAttach(attach);

					// Step 3: NOTICE_ATTACH 테이블에 관계 저장
					NoticeAttachDTO noticeAttach = new NoticeAttachDTO();
					noticeAttach.setNoticeNo(notice.getNoticeNo());
					noticeAttach.setAttachNo(attach.getAttachNo());
					noticeAttachDAO.insertNoticeAttach(noticeAttach);
				}
			}
		}

		return result;
	}

	/**
	 * 기존 첨부파일 삭제
	 */
	public void deleteNoticeAttachments(int noticeNo) {
		noticeAttachDAO.deleteAttachByNoticeNo(noticeNo);
	}

	/**
	 * 첨부파일 번호로 첨부파일 정보 가져오기
	 */
	public NoticeAttachDTO getAttachByAttachNo(int attachNo) {
		return noticeAttachDAO.getAttachByAttachNo(attachNo);
	}
}
