package com.codingbamboo.finalproject.noticeattach.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.codingbamboo.finalproject.noticeattach.dto.NoticeAttachDTO;

@Mapper
public interface INoticeAttachDAO {

	// 공지사항 첨부파일 등록
	int insertNoticeAttach(NoticeAttachDTO attach);

	// 첨부파일 정보를 attach 테이블에 삽입
	int insertAttach(NoticeAttachDTO attach);

	// 공지사항과 첨부파일 매핑 정보를 notice_attach 테이블에 삽입
	int insertNoticeAttach(@Param("noticeNo") int noticeNo, @Param("attachNo") int attachNo);

	// 공지사항 번호로 첨부파일 조회
	List<NoticeAttachDTO> getAttachListByNoticeNo(@Param("noticeNo") int noticeNo);

	// 공지사항 번호로 첨부파일 매핑 삭제
	int deleteAttachByNoticeNo(@Param("noticeNo") int noticeNo);

	// 첨부파일 삭제
	int deleteAttachByAttachNo(@Param("attachNo") int attachNo);

	int getCurrentNoticeNo();
	
	NoticeAttachDTO getAttachByAttachNo(int attachNo);

}
