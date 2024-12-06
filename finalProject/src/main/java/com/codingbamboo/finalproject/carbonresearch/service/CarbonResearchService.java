package com.codingbamboo.finalproject.carbonresearch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.carbonresearch.dao.ICarbonResearchDAO;
import com.codingbamboo.finalproject.carbonresearch.dto.CarbonResearchDTO;

@Service
public class CarbonResearchService {

	@Autowired
	ICarbonResearchDAO dao;
	
	// 1. 연구동향 등록

		public int registTech(CarbonResearchDTO technology) {
			return dao.registTech(technology);
		}

		/**
		 * 연구동향 목록 조회
		 */
		public List<CarbonResearchDTO> getTechList(String searchKeyword, int offset, int size) {
			return dao.getTechList(searchKeyword, offset, size);
		}

		/**
		 * 연구동향 총 개수 조회
		 */
		public int getTechCount(String searchKeyword) {
			return dao.getTechCount(searchKeyword);
		}

		/**
		 * 연구동향 상세 조회
		 */
		public CarbonResearchDTO getTechDetail(int techNo) {
			return dao.getTechDetail(techNo);
		}

		public List<CarbonResearchDTO> getTechPreviewList() {
			return dao.getTechPreviewList();
		}
		
		public int getTechNo() {
			int result = dao.getTechNo();
			return result;
		}
	    public int updateTech(CarbonResearchDTO technology) {
	        return dao.updateTech(technology);
	    }

	    public int deleteTech(int techNo) {
	        return dao.deleteTech(techNo);
	    }
}
