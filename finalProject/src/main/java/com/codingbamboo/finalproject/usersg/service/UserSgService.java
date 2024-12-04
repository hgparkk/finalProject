package com.codingbamboo.finalproject.usersg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.attach.dao.IAttachDAO;
import com.codingbamboo.finalproject.attach.dto.AttachDTO;
import com.codingbamboo.finalproject.usersg.dao.IUserSgDAO;
import com.codingbamboo.finalproject.usersg.dto.UserSgDTO;

@Service
public class UserSgService {
	
	@Autowired
	private IUserSgDAO dao;
	@Autowired
	private IAttachDAO attachdao;
	
	// 1. 등록

		public int registSg(UserSgDTO sg) {
			return dao.registSg(sg);
		}

		/**
		 * 목록 조회
		 */
		public List<UserSgDTO> getSgList(String userId, int offset, int size) {
			return dao.getSgList(userId, offset, size);
		}

		/** 관리자 건의사항 목록 조회 **/
		public List<UserSgDTO> getAdminSgList(int offset, int size) {
			return dao.getAdminSgList(offset, size);
		}
		
		
		/**
		 * 총 개수 조회
		 */
		public int getSgCount(String userId) {
			return dao.getSgCount(userId);
		}
		
		public int getAdminSgCount() {
			return dao.getAdminSgCount();
		}
		
		/**
		 * 상세 조회
		 */
		public UserSgDTO getSgDetail(int sgNo) {
			return dao.getSgDetail(sgNo);
		}
		
		public int getSgNo() {
			int result = dao.getSgNo();
			return result;
		}
		
	    public int updateSg(UserSgDTO sg) {
	        return dao.updateSg(sg);
	    }

	    public int deleteSg(int sgNo) {
	        int result = dao.deleteSg(sgNo);
	    	return result;
	    }
	    
		public List<AttachDTO> getAttachList(int sgNo) {
			List<AttachDTO> result = attachdao.getSgAttachList(sgNo);
			return result;
		}
	    
	    
	    
}
