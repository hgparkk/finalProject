package com.codingbamboo.finalproject.carboncalculate.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.codingbamboo.finalproject.carboncalculate.dto.CarbonCalculateDTO;

@Mapper
public interface ICarbonCalculateDAO {
	// 탄소 발자국 결과 저장
	int insertCal(CarbonCalculateDTO carbonCalculateDTO);
	
	// 탄소 발자국 결과 불러오기
	List<CarbonCalculateDTO> selectCalList(String userId);
}
