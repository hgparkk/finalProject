package com.codingbamboo.finalproject.attach.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.attach.dao.IAttachDAO;
import com.codingbamboo.finalproject.attach.dto.AttachDTO;
import com.codingbamboo.finalproject.usersg.dao.IUserSgDAO;

@Service
public class AttachService {

	@Autowired
	IAttachDAO dao;
	
	@Autowired
	IUserSgDAO usersgdao;



	public List<AttachDTO> getAttachList(int noticeNo) {
		List<AttachDTO> result = dao.getAttachList(noticeNo);
		return result;
	}

	public int getAttachNo(String attachName) {
		return dao.getAttachNo(attachName);
	}

	public int deleteAttach(int attachNo) {
	    return dao.deleteAttach(attachNo); // DAO에서 삭제 수행
	}
	
	public int deleteNoticeAttach(int attachNo) {
	    return dao.deleteNoticeAttach(attachNo);
	}
	
	public int deleteSgAttach(int attachNo) {
		return dao.deleteSgAttach(attachNo);
	}
	
	public int insertAttach(AttachDTO attach) {
	    return dao.insertAttach(attach);
	}
	
    public int deleteSg(int sgNo) {
        int result = usersgdao.deleteSg(sgNo);
    	return result;
    }
    
	public List<AttachDTO> getSgAttachList(int sgNo) {
		List<AttachDTO> result = dao.getSgAttachList(sgNo);
		return result;
	}
	
	
    


}
