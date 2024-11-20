package com.codingbamboo.finalproject.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import com.codingbamboo.finalproject.notice.dto.NoticeDTO;

@Mapper
public interface INoticeDAO {

	// 공지사항 등록
	int registNotice(NoticeDTO notice);

	// 공지사항 목록 조회
	List<NoticeDTO> getNoticeList(Map<String, Object> paramMap);

	// 공지사항 상세 조회
	NoticeDTO getNoticeDetail(int noticeNo);

	// 공지사항 삭제
	int deleteNotice(int noticeNo);
	
	//공지사항 미리보기 조회
	List<NoticeDTO> getNoticePreviewList();
	
    // 공지사항 총 개수 조회 (페이징)
    int selectNoticeCount(Map<String, Object> paramMap);
    
    //공지사항 수정
    int updateNotice(NoticeDTO notice);
}
