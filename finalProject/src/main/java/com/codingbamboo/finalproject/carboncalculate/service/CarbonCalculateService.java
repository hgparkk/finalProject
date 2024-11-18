package com.codingbamboo.finalproject.carboncalculate.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.carboncalculate.dao.ICarbonCalculateDAO;
import com.codingbamboo.finalproject.carboncalculate.dto.CarbonCalculateDTO;

@Service
public class CarbonCalculateService {
	@Autowired
	ICarbonCalculateDAO dao;

	// 탄소발자국 계산 결과 저장
	public int insertCal(CarbonCalculateDTO carbonCalculate) {
		int result = dao.insertCal(carbonCalculate);
		return result;
	}
	
	// 탄소발자국 저장 결과 상세 조회
		public CarbonCalculateDTO getCal(Date date) {
			CarbonCalculateDTO result = dao.getCal(date);
		    
		    return result;
		}

	// 탄소발자국 저장 목록 가져오기
	public List<CarbonCalculateDTO> getCarbonCalList() {
		List<CarbonCalculateDTO> result = dao.getCarbonCalList();
		return result;
	}
}
