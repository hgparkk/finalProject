package com.codingbamboo.finalproject.notice.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.codingbamboo.finalproject.notice.dto.NoticeDTO;

@Mapper
public interface INoticeDAO {

    // 공지사항 상세 조회 (공지사항 번호 기반)
    NoticeDTO getNoticeDetail(int noticeNo);

    // 공지사항 삭제
    int deleteNotice(int noticeNo);

    // 공지사항 미리보기 조회 (최신 공지사항 3개)
    List<NoticeDTO> getNoticePreviewList();

    // 공지사항 수정
    int updateNotice(NoticeDTO notice);

    // 특정 공지사항의 첨부파일 개수 조회
    int getAttachCountByNoticeNo(int noticeNo);

    // 공지사항 목록 조회 (검색 키워드와 페이징 처리 - 개별 파라미터 방식)
    List<NoticeDTO> getNoticeList(@Param("searchKeyword") String searchKeyword, 
                                  @Param("offset") int offset, 
                                  @Param("size") int size);

    // 공지사항 총 개수 조회 (검색 키워드 기반)
    int getNoticeCount(String searchKeyword);
    
    int registNotice(NoticeDTO notice);
    
    int getCurrentNoticeNo();
    
	int getNoticeNo();
}

