package com.codingbamboo.finalproject.usersg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.usersg.dao.IUserSgDAO;
import com.codingbamboo.finalproject.usersg.dto.UserSgDTO;

@Service
public class UserSgService {
	
	@Autowired
	private IUserSgDAO dao;
	
	// 1. 등록

		public int registSg(UserSgDTO sg) {
			return dao.registSg(sg);
		}

		/**
		 * 목록 조회
		 */
		public List<UserSgDTO> getSgList(String searchKeyword, int offset, int size) {
			return dao.getSgList(searchKeyword, offset, size);
		}

		/**
		 * 총 개수 조회
		 */
		public int getSgCount(String searchKeyword) {
			return dao.getSgCount(searchKeyword);
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
	        return dao.deleteSg(sgNo);
	    }
	    
}
