package com.codingbamboo.finalproject.attach.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.codingbamboo.finalproject.attach.dto.AttachDTO;

@Mapper
public interface IAttachDAO {
	// 첨부파일 등록
	int insertAttach(AttachDTO attach);
	
	List<AttachDTO> getAttachList(int noticeNo);
	
	// 특정 첨부파일 정보 가져오기
	AttachDTO getAttachByAttachNo(int attachNo);





	


	



}
