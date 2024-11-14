package com.codingbamboo.finalproject.carbonCalculate.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.codingbamboo.finalproject.carbonCalculate.dto.CarbonCalculateDTO;

@Mapper
public interface ICarbonCalculateDAO {
	// 탄소발자국 결과 저장하기
	int insertCal(CarbonCalculateDTO carbonCalculateDTO);
	
	// 탄소발자국 결과 조회하기
	CarbonCalculateDTO getCal(int no);
	
	// 탄소발자국 결과 목록 조회
	List<CarbonCalculateDTO> getCarbonCalList();
}
