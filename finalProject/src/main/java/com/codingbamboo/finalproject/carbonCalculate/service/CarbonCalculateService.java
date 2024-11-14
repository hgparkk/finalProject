package com.codingbamboo.finalproject.carbonCalculate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.carbonCalculate.dao.ICarbonCalculateDAO;
import com.codingbamboo.finalproject.carbonCalculate.dto.CarbonCalculateDTO;

@Service
public class CarbonCalculateService {
	@Autowired
	ICarbonCalculateDAO dao;

	// 탄소발자국 계산 결과 저장
	public int insertCal(CarbonCalculateDTO carbonCalculateDTO) {
		int result = dao.insertCal(carbonCalculateDTO);
		return result;
	}

	// 게시판 목록 가져오기
	public List<CarbonCalculateDTO> getCarbonCalList() {
		List<CarbonCalculateDTO> result = dao.getCarbonCalList();
		return result;
	}
}
