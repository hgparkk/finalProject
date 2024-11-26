package com.codingbamboo.finalproject.noticeattach.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.noticeattach.dao.INoticeAttachDAO;
import com.codingbamboo.finalproject.noticeattach.dto.NoticeAttachDTO;

@Service
public class NoticeAttachService {

	@Autowired
	INoticeAttachDAO dao;
	
	public int insertNoticeAttach(NoticeAttachDTO noticeAttach) {
		return dao.insertNoticeAttach(noticeAttach);
	}
}
