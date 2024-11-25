package com.codingbamboo.finalproject.noticeattach.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.codingbamboo.finalproject.noticeattach.dto.NoticeAttachDTO;

@Mapper
public interface INoticeAttachDAO {
	// 첨부파일 등록
	int insertAttach(NoticeAttachDTO attach);

	// 특정 공지사항에 해당하는 첨부파일 목록 가져오기
	List<NoticeAttachDTO> getAttachListByNoticeNo(@Param("noticeNo") int noticeNo);

	// 특정 첨부파일 정보 가져오기
	NoticeAttachDTO getAttachByAttachNo(int attachNo);

	// 특정 공지사항에 연결된 첨부파일 삭제
	int deleteAttachByNoticeNo(int noticeNo);

	// 첨부파일 자체 삭제
	int deleteAttachByAttachNo(int attachNo);

	int insertNoticeAttach(@Param("noticeNo") int noticeNo, @Param("attachNo") int attachNo);

}
