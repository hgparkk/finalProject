package com.codingbamboo.finalproject.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.codingbamboo.finalproject.notice.dto.NoticeDTO;
import com.codingbamboo.finalproject.noticeattach.dto.NoticeAttachDTO;

@Mapper
public interface INoticeDAO {



    // 공지사항 목록 조회 (검색 키워드와 페이징 처리 - Map 방식)
    List<NoticeDTO> getNoticeList(Map<String, Object> paramMap);

    // 공지사항 상세 조회 (공지사항 번호 기반)
    NoticeDTO getNoticeDetail(@Param("noticeNo") int noticeNo);

    // 공지사항 삭제
    int deleteNotice(@Param("noticeNo") int noticeNo);

    // 공지사항 미리보기 조회 (최신 공지사항 3개)
    List<NoticeDTO> getNoticePreviewList();

    // 공지사항 총 개수 조회 (검색 키워드 기반 - Map 방식)
    int selectNoticeCount(Map<String, Object> paramMap);

    // 공지사항 수정
    int updateNotice(NoticeDTO notice);

    // 특정 공지사항의 첨부파일 개수 조회
    int getAttachCountByNoticeNo(@Param("noticeNo") int noticeNo);

    // 공지사항 목록 조회 (검색 키워드와 페이징 처리 - 개별 파라미터 방식)
    List<NoticeDTO> getNoticeList(@Param("searchKeyword") String searchKeyword, 
                                  @Param("offset") int offset, 
                                  @Param("size") int size);

    // 공지사항 총 개수 조회 (검색 키워드 기반)
    int getNoticeCount(@Param("searchKeyword") String searchKeyword);
    
    int registNotice(NoticeDTO notice);
    
    int getCurrentNoticeNo();
    
    List<NoticeAttachDTO> getAttachListByNoticeNo(@Param("noticeNo") int noticeNo);
    
}

