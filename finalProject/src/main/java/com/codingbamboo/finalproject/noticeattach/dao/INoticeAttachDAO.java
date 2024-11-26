package com.codingbamboo.finalproject.noticeattach.dao;

import org.apache.ibatis.annotations.Mapper;

import com.codingbamboo.finalproject.noticeattach.dto.NoticeAttachDTO;

@Mapper
public interface INoticeAttachDAO {
	int insertNoticeAttach(NoticeAttachDTO noticeAttach);
}
