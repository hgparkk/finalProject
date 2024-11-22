package com.codingbamboo.finalproject.carboncalculate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.carboncalculate.dao.ICarbonCalculateDAO;
import com.codingbamboo.finalproject.carboncalculate.dto.CarbonCalculateDTO;

@Service
public class CarbonCalculateService {
	@Autowired
	ICarbonCalculateDAO dao;

	// 탄소 발자국 결과 저장
	public int insertCal(CarbonCalculateDTO carbonCalculate) {
		int result = dao.insertCal(carbonCalculate);
		return result;
	}

	// 탄소 발자국 결과 불러오기
	public List<CarbonCalculateDTO> selectCalList(String userId) {
		return dao.selectCalList(userId);
	}
	
}
