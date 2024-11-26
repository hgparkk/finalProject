package com.codingbamboo.finalproject.attach.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.codingbamboo.finalproject.attach.dao.IAttachDAO;
import com.codingbamboo.finalproject.attach.dto.AttachDTO;

@Service
public class AttachService {

	@Autowired
	IAttachDAO dao;
	
	public int insertAttach(AttachDTO attach) {
		int result = dao.insertAttach(attach);
		return result;
	}
	
	public List<AttachDTO> getAttachList(int noticeNo){
		List<AttachDTO> result = dao.getAttachList(noticeNo);
		return result;
	}
	
	public int getAttachNo(String attachName) {
		return dao.getAttachNo(attachName);
	}
}
