package com.codingbamboo.finalproject.carboncalculate.dao;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.codingbamboo.finalproject.carboncalculate.dto.CarbonCalculateDTO;
import com.codingbamboo.finalproject.coefficient.dto.CoefficientDTO;

@Mapper
public interface ICarbonCalculateDAO {
	// 탄소 발자국 결과 저장
	int insertCal(CarbonCalculateDTO carbonCalculateDTO);
	
	// 탄소 발자국 결과 업데이트
	int updateCal(CarbonCalculateDTO carbonCalculateDTO);
	
	// 탄소 발자국 결과 불러오기
	List<CarbonCalculateDTO> selectCalList(String userId);
	
	// 탄소 발자국 등록된 날짜 불러오기
	CarbonCalculateDTO getCalByDate(CarbonCalculateDTO carbonCalculateDTO);
	
}
